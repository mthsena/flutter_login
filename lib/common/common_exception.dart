abstract class CommonException<Error> implements Exception {
  const CommonException(
    this.error,
  );

  final Error error;
}
