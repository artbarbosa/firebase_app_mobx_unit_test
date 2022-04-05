import '../../../core/error/failure.dart';

class LoginWithEmailAndPasswordError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  LoginWithEmailAndPasswordError({
    this.errorMessage = 'Login Error',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}

class LoginWithPhoneError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  LoginWithPhoneError({
    this.errorMessage = 'Login Error',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}

class CurrentUserError extends Failure {
  final String errorMessage;
  final StackTrace stackTrace;

  CurrentUserError({
    this.errorMessage = 'Current User Error',
    required this.stackTrace,
  });
}
