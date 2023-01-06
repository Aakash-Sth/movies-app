import 'package:movies_app/api_constants.dart';

class MovieCast {
  final String name;
  final String imageUrl;
  MovieCast({
    required this.name,
    required this.imageUrl,
  });

  MovieCast.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        imageUrl = json["profile_path"] == null
            ? ""
            : "${ApiConstants.imageBaseUrl}${json["profile_path"]}";
}
