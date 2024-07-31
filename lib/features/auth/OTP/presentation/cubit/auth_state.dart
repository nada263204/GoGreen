part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];

  get message => null;
}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;

  const LoginSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginError extends AuthState {
  final String message;

  const LoginError({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final User user;

  const RegisterSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class RegisterError extends AuthState {
  final String message;

  const RegisterError({required this.message});

  @override
  List<Object?> get props => [message];
}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  final String message;

  const LogoutError({required this.message});

  @override
  List<Object?> get props => [message];
}

