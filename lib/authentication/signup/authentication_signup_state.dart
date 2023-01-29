import '../../common/common_state.dart';
import 'authentication_signup_output.dart';

class AuthenticationSignupState extends CommonState<AuthenticationSignupOutput> {
  const AuthenticationSignupState({
    required super.status,
    required super.message,
    required super.output,
  });

  factory AuthenticationSignupState.initial() {
    return AuthenticationSignupState(
      status: StateStatus.initial,
      message: '',
      output: AuthenticationSignupOutput.empty(),
    );
  }

  factory AuthenticationSignupState.loading() {
    return AuthenticationSignupState(
      status: StateStatus.loading,
      message: '',
      output: AuthenticationSignupOutput.empty(),
    );
  }

  factory AuthenticationSignupState.failure(String message) {
    return AuthenticationSignupState(
      status: StateStatus.failure,
      message: message,
      output: AuthenticationSignupOutput.empty(),
    );
  }

  factory AuthenticationSignupState.success(String message, AuthenticationSignupOutput output) {
    return AuthenticationSignupState(
      status: StateStatus.success,
      message: message,
      output: output,
    );
  }
}
