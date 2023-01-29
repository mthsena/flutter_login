import '../authentication_repository.dart';
import 'authentication_signin_input.dart';
import 'authentication_signin_output.dart';

abstract class AuthenticationSigninUsecase {
  const AuthenticationSigninUsecase(
    this.authenticationRepository,
  );

  final AuthenticationRepository authenticationRepository;

  Future<AuthenticationSigninOutput> execute(AuthenticationSigninInput input);
}
