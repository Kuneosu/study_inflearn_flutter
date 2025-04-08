import 'package:flutter/material.dart';
import 'package:inf_fl/core/presentation/components/big_button.dart';
import 'package:inf_fl/core/presentation/components/input_field.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class SignInScreen extends StatelessWidget {
  final void Function() onTapSignUp;
  final void Function() onTapSignIn;
  const SignInScreen({
    super.key,
    required this.onTapSignUp,
    required this.onTapSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Hello', style: TST.headerTextBold),
              Text('Welcome Back!', style: TST.largeTextRegular),
              const SizedBox(height: 57),
              const InputField(label: 'Email', placeHolder: 'Enter Email'),
              const SizedBox(height: 30),
              const InputField(
                label: 'Password',
                placeHolder: 'Enter Password',
              ),
              const SizedBox(height: 20),
              Text(
                'Forgot Password ?',
                style: TST.smallerTextRegular.copyWith(color: CST.secondary100),
              ),
              const SizedBox(height: 25),
              BigButton('Sign In', onPressed: onTapSignIn),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 1, color: CST.gray4),
                  const SizedBox(width: 7),
                  Text(
                    'Or Sign in With',
                    style: TST.smallerTextBold.copyWith(color: CST.gray4),
                  ),
                  const SizedBox(width: 7),
                  Container(width: 50, height: 1, color: CST.gray4),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/google_button.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 15),
                  Image.asset(
                    'assets/image/facebook_button.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TST.smallerTextBold),
                  GestureDetector(
                    onTap: onTapSignUp,
                    child: Text(
                      'Sign up',
                      style: TST.smallerTextBold.copyWith(
                        color: CST.secondary100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
