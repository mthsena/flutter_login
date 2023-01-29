import 'package:flutter/material.dart';

import '../common/common_state.dart';
import '../env/env_default.dart';
import 'signin/authentication_signin_input.dart';
import 'signin/authentication_signin_store.dart';
import 'signup/authentication_signup_input.dart';
import 'signup/authentication_signup_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
    this.authenticationSigninStore,
    this.authenticationSignupStore, {
    super.key,
  });

  final AuthenticationSigninStore authenticationSigninStore;
  final AuthenticationSignupStore authenticationSignupStore;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberLogin = false;
  bool passwordHidden = true;
  bool emailIsOk = false;
  bool passwordIsOk = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      final validation = emailValidator(emailController.text);
      setState(() {
        emailIsOk = validation == null ? true : false;
      });
    });
    passwordController.addListener(() {
      final validation = passwordValidator(passwordController.text);
      setState(() {
        passwordIsOk = validation == null ? true : false;
      });
    });
    widget.authenticationSigninStore.addListener(() {
      if (widget.authenticationSigninStore.value.status == StateStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.authenticationSigninStore.value.message,
            ),
          ),
        );
      }
    });
    widget.authenticationSignupStore.addListener(() {
      if (widget.authenticationSignupStore.value.status == StateStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.authenticationSignupStore.value.message,
            ),
          ),
        );
      }
    });
  }

  String? emailValidator(String? text) {
    final email = text ?? '';
    if (email.isEmpty) return 'E-mail cannot be empty.';
    if (!email.contains('@') || !email.contains('.com')) return 'You must enter a valid e-mail address.';
    return null;
  }

  String? passwordValidator(String? text) {
    final password = text ?? '';
    if (password.isEmpty) return 'Password cannot be empty.';
    if (password.length < 6) return 'You must enter at least a 6 characters password.';
    return null;
  }

  void togglePassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  void checkRememberLogin(bool? value) {
    setState(() {
      rememberLogin = value ?? false;
    });
  }

  void signIn() async {
    widget.authenticationSigninStore.signIn(
      AuthenticationSigninInput(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void signUp() {
    widget.authenticationSignupStore.signUp(
      AuthenticationSignupInput(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(EnvDefault.appTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome to Flutter Login.',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                validator: emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  suffixIcon: InkWell(
                    onTap: togglePassword,
                    child: Icon(passwordHidden ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                obscureText: passwordHidden,
                validator: passwordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: rememberLogin,
                    onChanged: checkRememberLogin,
                  ),
                  const Text('Remember me?')
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ValueListenableBuilder(
                  valueListenable: widget.authenticationSigninStore,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: !value.isLoading && emailIsOk && passwordIsOk ? signIn : null,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      ),
                      child: value.isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator()) : const Text('SIGNIN'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Divider(),
                    Chip(
                      label: Text('OR'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ValueListenableBuilder(
                  valueListenable: widget.authenticationSignupStore,
                  builder: (context, value, child) {
                    return OutlinedButton(
                      onPressed: !value.isLoading && emailIsOk && passwordIsOk ? signUp : null,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      ),
                      child: value.isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator()) : const Text('SIGNUP'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
