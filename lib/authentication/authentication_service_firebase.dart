import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../env/env_default.dart';
import 'authentication_error.dart';
import 'authentication_message.dart';
import 'authentication_service.dart';

class AuthenticationServiceFirebase extends AuthenticationService {
  static void init() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        projectId: EnvDefault.fireBaseProjectId,
        appId: EnvDefault.fireBaseAppId,
        messagingSenderId: EnvDefault.fireBaseMessagingSenderId,
        apiKey: EnvDefault.fireBaseApiKey,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {
        'uuid': data.user?.uid ?? '',
        'updatedAt': data.user?.metadata.lastSignInTime?.toIso8601String() ?? '',
        'createdAt': data.user?.metadata.creationTime?.toIso8601String() ?? '',
        'user': {
          'name': data.user?.displayName ?? '',
          'email': data.user?.email ?? '',
          'phone': data.user?.phoneNumber ?? '',
          'imageUrl': data.user?.photoURL ?? '',
        },
      };
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthenticationError(AuthenticationMessage.authenticationInvalidEmail.name);
        case 'user-disabled':
          throw AuthenticationError(AuthenticationMessage.authenticationUserDisabled.name);
        case 'user-not-found':
          throw AuthenticationError(AuthenticationMessage.authenticationUserNotFound.name);
        case 'wrong-password':
          throw AuthenticationError(AuthenticationMessage.authenticationWrongPassword.name);
        default:
          throw AuthenticationError(AuthenticationMessage.authenticationInvalid.name);
      }
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(String email, String password) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {
        'uuid': data.user?.uid ?? '',
        'updatedAt': data.user?.metadata.lastSignInTime?.toIso8601String() ?? '',
        'createdAt': data.user?.metadata.creationTime?.toIso8601String() ?? '',
        'user': {
          'name': data.user?.displayName ?? '',
          'email': data.user?.email ?? '',
          'phone': data.user?.phoneNumber ?? '',
          'imageUrl': data.user?.photoURL ?? '',
        },
      };
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthenticationError(AuthenticationMessage.authenticationInvalidEmail.name);
        case 'email-already-in-use':
          throw AuthenticationError(AuthenticationMessage.authenticationEmailAlreadyInUse.name);
        case 'operation-not-allowed':
          throw AuthenticationError(AuthenticationMessage.authenticationOperationNotAllowed.name);
        case 'weak-password':
          throw AuthenticationError(AuthenticationMessage.authenticationWeakPassword.name);
        default:
          throw AuthenticationError(AuthenticationMessage.authenticationInvalid.name);
      }
    }
  }
}
