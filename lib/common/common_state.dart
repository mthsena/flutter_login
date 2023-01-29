enum StateStatus {
  initial,
  loading,
  failure,
  success,
}

abstract class CommonState<Output> {
  const CommonState({
    required this.status,
    required this.message,
    required this.output,
  });

  final StateStatus status;
  final String message;
  final Output output;

  bool get isInitial => status == StateStatus.initial;
  bool get isLoading => status == StateStatus.loading;
  bool get isFailure => status == StateStatus.failure;
  bool get isSuccess => status == StateStatus.success;
}
