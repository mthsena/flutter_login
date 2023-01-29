import 'authentication_signup_input.dart';
import 'authentication_signup_output.dart';
import 'authentication_signup_usecase.dart';

class AuthenticationSignupUsecaseFirebase extends AuthenticationSignupUsecase {
  const AuthenticationSignupUsecaseFirebase(
    super.authenticationRepository,
  );

  @override
  Future<AuthenticationSignupOutput> execute(AuthenticationSignupInput input) async {
    final user = await authenticationRepository.signUp(input.email, input.password);
    return AuthenticationSignupOutput(
      user: user.user,
    );
  }
}
