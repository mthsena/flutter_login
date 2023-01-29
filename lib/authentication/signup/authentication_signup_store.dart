import '../../common/common_error.dart';
import '../../common/common_store.dart';
import '../authentication_message.dart';
import 'authentication_signup_input.dart';
import 'authentication_signup_state.dart';
import 'authentication_signup_usecase.dart';

class AuthenticationSignupStore extends CommonStore<AuthenticationSignupState> {
  AuthenticationSignupStore(
    this.authenticationSignupUsecase,
  ) : super(AuthenticationSignupState.initial());

  final AuthenticationSignupUsecase authenticationSignupUsecase;

  void signUp(AuthenticationSignupInput input) async {
    try {
      emit(AuthenticationSignupState.loading());
      final output = await authenticationSignupUsecase.execute(input);
      emit(AuthenticationSignupState.success(AuthenticationMessage.authenticationSignupSuccess.name, output));
    } on CommonError catch (e) {
      emit(AuthenticationSignupState.failure(e.message));
    }
  }
}
