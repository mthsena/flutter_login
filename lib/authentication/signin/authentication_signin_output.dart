import '../../user/user_model.dart';

class AuthenticationSigninOutput {
  const AuthenticationSigninOutput({
    required this.user,
  });

  final UserModel user;

  factory AuthenticationSigninOutput.empty() {
    return AuthenticationSigninOutput(
      user: UserModel.empty(),
    );
  }
}
