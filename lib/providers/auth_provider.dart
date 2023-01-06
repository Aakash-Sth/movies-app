import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/auth_notifier.dart';
import 'package:movies_app/notifiers/auth_state.dart';
import 'package:movies_app/services/local_storage_service.dart';

import '../services/auth_service.dart';
import 'api_service_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    service: AuthService(
      apiService: ref.read(apiServiceProvider),
    ),
    localService: LocalStorageService(),
  ),
);
