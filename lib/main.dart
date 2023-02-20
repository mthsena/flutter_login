import 'package:flutter/material.dart';

import 'authentication/authentication_page.dart';
import 'authentication/authentication_repository_firebase.dart';
import 'authentication/authentication_service_firebase.dart';
import 'authentication/signin/authentication_signin_store.dart';
import 'authentication/signin/authentication_signin_usecase_firebase.dart';
import 'authentication/signup/authentication_signup_store.dart';
import 'authentication/signup/authentication_signup_usecase_firebase.dart';
import 'env/env_default.dart';
import 'main/main_widget.dart';
import 'theme/theme_default.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  AuthenticationServiceFirebase.init();

  // Injection
  final authenticationServiceFirebase = AuthenticationServiceFirebase();
  final authenticationRepositoryFirebase = AuthenticationRepositoryFirebase(authenticationServiceFirebase);
  final authenticationSigninUsecaseFirebase = AuthenticationSigninUsecaseFirebase(authenticationRepositoryFirebase);
  final authenticationSigninStore = AuthenticationSigninStore(authenticationSigninUsecaseFirebase);
  final authenticationSignupUsecaseFirebase = AuthenticationSignupUsecaseFirebase(authenticationRepositoryFirebase);
  final authenticationSignupStore = AuthenticationSignupStore(authenticationSignupUsecaseFirebase);

  // Main
  runApp(
    MainWidget(
      theme: ThemeDefault.data,
      title: EnvDefault.appTitle,
      child: LoginPage(authenticationSigninStore, authenticationSignupStore),
    ),
  );
}
