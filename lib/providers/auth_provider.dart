import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/auth_notifier.dart';
import 'package:movies_app/notifiers/auth_state.dart';
import 'package:movies_app/services/local_storage_service.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(localService: LocalStorageService()),
);
