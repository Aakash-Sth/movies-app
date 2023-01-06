import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  final String sessionId;
  final String message;
  const AuthLoaded({this.message = "", this.sessionId = ""});

  @override
  List<Object> get props => [sessionId, message];
}
