import '../../user/user_model.dart';

class AuthenticationSignupOutput {
  const AuthenticationSignupOutput({
    required this.user,
  });

  final UserModel user;

  factory AuthenticationSignupOutput.empty() {
    return AuthenticationSignupOutput(
      user: UserModel.empty(),
    );
  }
}
