import '../authentication/authentication_service.dart';
import '../user/user_entity.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository(
    this.authenticationService,
  );

  final AuthenticationService authenticationService;

  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String email, String password);
}
