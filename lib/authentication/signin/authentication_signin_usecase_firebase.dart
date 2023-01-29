import 'authentication_signin_input.dart';
import 'authentication_signin_output.dart';
import 'authentication_signin_usecase.dart';

class AuthenticationSigninUsecaseFirebase extends AuthenticationSigninUsecase {
  const AuthenticationSigninUsecaseFirebase(
    super.authenticationRepository,
  );

  @override
  Future<AuthenticationSigninOutput> execute(AuthenticationSigninInput input) async {
    final user = await authenticationRepository.signIn(input.email, input.password);
    return AuthenticationSigninOutput(
      user: user.user,
    );
  }
}
