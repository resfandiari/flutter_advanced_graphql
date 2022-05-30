class Failure {
  final String errorMessage;
  final String? errorCode;

  Failure(
    this.errorMessage, {
    this.errorCode,
  });

  @override
  String toString() =>
      '$runtimeType(errorMessage: $errorMessage, code: $errorCode)';
}
