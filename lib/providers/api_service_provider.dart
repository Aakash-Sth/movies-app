import 'package:movies_app/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "api_service_provider.g.dart";

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService();
}
