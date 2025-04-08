import 'package:flutter/material.dart';
import 'package:inf_fl/core/presentation/components/big_button.dart';
import 'package:inf_fl/core/presentation/components/input_field.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() onTapSignIn;

  const SignUpScreen({super.key, required this.onTapSignIn});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text('Create an account', style: TST.largeTextBold),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Let’s help you set up your account, it won’t take long.',
                    style: TST.smallerTextRegular,
                  ),
                ),
                const SizedBox(height: 20),
                const InputField(label: 'Name', placeHolder: 'Enter Name'),
                const SizedBox(height: 20),
                const InputField(label: 'Email', placeHolder: 'Enter Email'),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Password',
                  placeHolder: 'Enter Password',
                ),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Confirm Password',
                  placeHolder: 'Retype Password',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: const BorderSide(width: 1, color: CST.secondary100),
                      activeColor: CST.secondary100,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Accept terms & Condition',
                      style: TST.smallerTextRegular.copyWith(
                        color: CST.secondary100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                BigButton('Sign Up', onPressed: () {}),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member? ',
                      style: TST.smallerTextBold,
                    ),
                    GestureDetector(
                      onTap: widget.onTapSignIn,
                      child: Text(
                        'Sign In',
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
      ),
    );
  }
}
