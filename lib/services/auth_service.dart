import 'package:dartz/dartz.dart';
import 'package:movies_app/api_constants.dart';
import 'package:movies_app/services/api_service.dart';

typedef RequestToken = String;
typedef SessionId = String;
typedef ErrorMessage = String;

class AuthService {
  final ApiService _apiService;

  AuthService({required ApiService apiService}) : _apiService = apiService;

  Future<String> getRequestToken() async {
    String uri =
        "${ApiConstants.baseUrl}/authentication/token/new?api_key=${ApiConstants.apiKey}";
    final apiData = await _apiService.getApiData(uri);

    if (apiData["success"] == true) {
      return apiData["request_token"];
    } else {
      return "Request Failed";
    }
  }

  Future<Either<RequestToken, ErrorMessage>> validateUser(
      {required String username, required String password}) async {
    final getToken = await getRequestToken();
    String requestToken = "";
    if (!getToken.contains("Failed")) {
      requestToken = getToken;
    } else {
      return Right(getToken);
    }

    String uri =
        "${ApiConstants.baseUrl}/authentication/token/validate_with_login?api_key=${ApiConstants.apiKey}";
    final body = {
      "username": username,
      "password": password,
      "request_token": requestToken
    };

    final apiData = await _apiService.postData(uri, body);
    if (apiData["success"] == true) {
      return Left(apiData["request_token"]);
    } else {
      return Right(apiData["status_message"]);
    }
  }

  Future<Either<SessionId, ErrorMessage>> getSessionId(
      {required String username, required String password}) async {
    final tokenValidator =
        await validateUser(username: username, password: password);
    String requestToken = "";
    bool error = false;
    String errorMessage = "";

    tokenValidator.fold(
      (token) => requestToken = token,
      (errorMsg) {
        error = true;
        errorMessage = errorMsg;
      },
    );

    if (error) {
      return Right(errorMessage);
    }

    String uri =
        "${ApiConstants.baseUrl}/authentication/session/new?api_key=${ApiConstants.apiKey}";
    final body = {"request_token": requestToken};

    final apiData = await _apiService.postData(uri, body);
    if (apiData["success"] == true) {
      return Left(apiData["session_id"]);
    } else {
      return Right(apiData["status_message"]);
    }
  }

  Future<Either<String, ErrorMessage>> getGuestSessionId() async {
    String uri =
        "${ApiConstants.baseUrl}/authentication/guest_session/new?api_key=${ApiConstants.apiKey}";
    final apiData = await _apiService.getApiData(uri);

    if (apiData["success"] == true) {
      return Left(apiData["guest_session_id"]);
    } else {
      return Right(apiData["status_message"]);
    }
  }
}
