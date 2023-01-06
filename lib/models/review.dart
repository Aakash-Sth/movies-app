import 'package:movies_app/api_constants.dart';

class Review {
  final String author;
  final String avatarUrl;
  final double rating;
  final String content;

  Review({
    required this.author,
    required this.avatarUrl,
    required this.rating,
    required this.content,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    final authorDetails = json["author_details"];
    final avatarPath = authorDetails["avatar_path"];
    return Review(
        author: json["author"],
        avatarUrl: avatarPath == null
            ? ""
            : avatarPath.contains("http")
                ? avatarPath.substring(1)
                : "${ApiConstants.imageBaseUrl}$avatarPath",
        rating: authorDetails["rating"] ?? 0,
        content: json["content"]);
  }
}
