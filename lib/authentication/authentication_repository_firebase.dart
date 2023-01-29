import '../user/user_entity.dart';
import '../user/user_model.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryFirebase extends AuthenticationRepository {
  const AuthenticationRepositoryFirebase(
    super.authenticationService,
  );

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final data = await authenticationService.signIn(email, password);
    return UserEntity(
      uuid: data['uuid'] ?? '',
      updatedAt: DateTime.parse(data['updatedAt']),
      createdAt: DateTime.parse(data['createdAt']),
      user: UserModel(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phone: data['phone'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
      ),
    );
  }

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final data = await authenticationService.signUp(email, password);
    return UserEntity(
      uuid: data['uuid'] ?? '',
      updatedAt: DateTime.parse(data['updatedAt']),
      createdAt: DateTime.parse(data['createdAt']),
      user: UserModel(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phone: data['phone'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
      ),
    );
  }
}
