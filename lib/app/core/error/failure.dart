import '../services/remote/firebase_crashlytics_service.dart';

abstract class Failure {
  final String errorMessage;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.errorMessage = '',
  }) {
    ErrorReport.externalFailureError(
      exception: exception,
      stackTrace: stackTrace,
      reportTag: label,
    );
  }
}

class UnknownError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknownError({
    this.errorMessage = 'Unknown Error',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}
