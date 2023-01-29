import '../../common/common_state.dart';
import 'authentication_signin_output.dart';

class AuthenticationSigninState extends CommonState<AuthenticationSigninOutput> {
  const AuthenticationSigninState({
    required super.status,
    required super.message,
    required super.output,
  });

  factory AuthenticationSigninState.initial() {
    return AuthenticationSigninState(
      status: StateStatus.initial,
      message: '',
      output: AuthenticationSigninOutput.empty(),
    );
  }

  factory AuthenticationSigninState.loading() {
    return AuthenticationSigninState(
      status: StateStatus.loading,
      message: '',
      output: AuthenticationSigninOutput.empty(),
    );
  }

  factory AuthenticationSigninState.failure(String message) {
    return AuthenticationSigninState(
      status: StateStatus.failure,
      message: message,
      output: AuthenticationSigninOutput.empty(),
    );
  }

  factory AuthenticationSigninState.success(String message, AuthenticationSigninOutput output) {
    return AuthenticationSigninState(
      status: StateStatus.success,
      message: message,
      output: output,
    );
  }
}
