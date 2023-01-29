abstract class CommonError implements Exception {
  const CommonError(
    this.message,
  );

  final String message;
}
