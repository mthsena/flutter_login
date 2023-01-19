enum CommonStateStatus {
  initial,
  loading,
  failure,
  success,
}

abstract class CommonState<Exception, Output> {
  const CommonState({
    required this.status,
    required this.exception,
    required this.output,
  });

  final CommonStateStatus status;
  final Exception exception;
  final Output output;

  bool get isInitial => status == CommonStateStatus.initial;
  bool get isLoading => status == CommonStateStatus.loading;
  bool get isFailure => status == CommonStateStatus.failure;
  bool get isSuccess => status == CommonStateStatus.success;
}
