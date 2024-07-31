import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_button.dart';

import '../services/authenticaton/authenticaton.dart';
import '../theme.dart';
import '../widgets/textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = '';
    String email = '';
    String password = '';

    signUp() async {
      if (userName != '' && email != '' && password != '') {
        final message = await AuthService().registration(
          email: email,
          password: password,
        );
        if (message!.contains('Success')) {
          Navigator.pushReplacementNamed(context, "/home");
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('fill the all field'),
        ));
      }
    }

    ;

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: Column(
        children: [
          const SizedBox(width: double.infinity),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 5),
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome Please sign up using your social account to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyTheme.subTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              MyTextField(
                size: size,
                hint: "User name",
                icon: Icons.person,
                onChanged: (value) => userName = value,
              ),
              const SizedBox(height: 20),
              MyTextField(
                size: size,
                hint: "Email address",
                icon: Icons.email,
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 20),
              MyTextField(
                size: size,
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
                onChanged: (value) => password = value,
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Sign Up', onTap: signUp)
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                print("Don't have an account? Sign UP");
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                      color: MyTheme.subTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: MyTheme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
