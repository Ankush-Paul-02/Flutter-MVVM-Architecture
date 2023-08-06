import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/auth_view_model.dart';
import '../res/colors.dart';
import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.black,
        title: 'Sign up'.text.bold.color(AppColors.cyan).make().centered(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Enter email',
              labelText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              prefixIcon: Icon(
                Icons.alternate_email,
              ),
            ),
            onFieldSubmitted: (value) => AppUtils.fieldFocusChange(
              context,
              emailFocusNode,
              passwordFocusNode,
            ),
          ),
          10.heightBox,
          ValueListenableBuilder(
            valueListenable: _obscurePassword,
            builder: (context, value, child) => TextFormField(
              controller: passwordController,
              obscuringCharacter: '*',
              obscureText: _obscurePassword.value,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter password',
                labelText: 'Password',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                prefixIcon: const Icon(
                  Icons.lock_open_outlined,
                ),
                suffixIcon: Icon(
                  _obscurePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ).onInkTap(
                  () => _obscurePassword.value = !_obscurePassword.value,
                ),
              ),
            ),
          ),
          40.heightBox,
          RoundButton(
            title: 'Signup',
            loading: authViewModel.isSignupLoading,
            onPress: () {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                AppUtils.snackBar('Enter required fields', context);
              } else {
                Map data = {
                  'email': emailController.text.trim().toString(),
                  'password': passwordController.text.trim().toString(),
                };
                authViewModel.signupApi(data, context);
                if (kDebugMode) {
                  print('Api hit');
                }
              }
            },
          ),
          40.heightBox,
          'Already have an account, Login'.text.make().onInkTap(
                () => Navigator.pushNamed(
                  context,
                  RoutesName.login,
                ),
              ),
        ],
      ).p20(),
    ).safeArea();
  }
}
