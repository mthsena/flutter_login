import '../../common/common_error.dart';
import '../../common/common_store.dart';
import '../authentication_message.dart';
import 'authentication_signin_input.dart';
import 'authentication_signin_state.dart';
import 'authentication_signin_usecase.dart';

class AuthenticationSigninStore extends CommonStore<AuthenticationSigninState> {
  AuthenticationSigninStore(
    this.authenticationSigninUsecase,
  ) : super(AuthenticationSigninState.initial());

  final AuthenticationSigninUsecase authenticationSigninUsecase;

  void signIn(AuthenticationSigninInput input) async {
    try {
      emit(AuthenticationSigninState.loading());
      final output = await authenticationSigninUsecase.execute(input);
      emit(AuthenticationSigninState.success(AuthenticationMessage.authenticationSigninSuccess.name, output));
    } on CommonError catch (e) {
      emit(AuthenticationSigninState.failure(e.message));
    }
  }
}
