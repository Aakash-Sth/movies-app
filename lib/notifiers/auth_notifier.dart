import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/auth_state.dart';
import 'package:movies_app/services/auth_service.dart';
import 'package:movies_app/services/local_storage_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final LocalStorageService _localService;
  String? _sessionId;

  AuthNotifier(
      {required LocalStorageService localService, required AuthService service})
      : _authService = service,
        _localService = localService,
        super(const AuthInitial());

  String? get sessionId => _sessionId;

  void loadSessionId() async {
    state = const AuthLoading();
    _sessionId = await _localService.loadSessionId();
    state = AuthLoaded(sessionId: _sessionId ?? "");
  }

  void updateState(Either<String, String> sessionStatus) {
    sessionStatus.fold((sessionId) {
      _sessionId = sessionId;
      _localService.setSessionId(_sessionId!);
      state = AuthLoaded(sessionId: _sessionId!, message: "Login Successful");
    }, (error) {
      state = AuthLoaded(message: error);
    });
  }

  void authenticate({
    required String username,
    required String password,
  }) async {
    state = const AuthLoading();
    final sessionStatus = await _authService.getSessionId(
      username: username,
      password: password,
    );
    updateState(sessionStatus);
  }

  void createGuestSession() async {
    state = const AuthLoading();
    final sessionStatus = await _authService.getGuestSessionId();
    updateState(sessionStatus);
  }

  void signOut() {
    _localService.removeSessionId();
    state = const AuthLoaded(sessionId: "");
  }
}
