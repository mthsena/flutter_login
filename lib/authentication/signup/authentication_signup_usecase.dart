import '../authentication_repository.dart';
import 'authentication_signup_input.dart';
import 'authentication_signup_output.dart';

abstract class AuthenticationSignupUsecase {
  const AuthenticationSignupUsecase(
    this.authenticationRepository,
  );

  final AuthenticationRepository authenticationRepository;

  Future<AuthenticationSignupOutput> execute(AuthenticationSignupInput input);
}
