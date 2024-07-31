import 'package:flutter/material.dart';
import 'package:shop_app/services/local_stroage/user_data.dart';

import '../services/authenticaton/authenticaton.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    signIn() async {
      if (email != '' && password != '') {
        final message = await AuthService().login(
          email: email,
          password: password,
        );
        if (message!.contains('Success')) {
          MyLocalData()
              .saveUserData(email: email, password: password, isLogin: true);
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
        // Navigator.pushReplacementNamed(context, "/home");
      }
    }

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
                  "Sign In",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome back. Please sign in to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyTheme.subTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyTextField(
                size: size,
                hint: "User name",
                icon: Icons.person,
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 20),
              MyTextField(
                size: size,
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              InkWell(
                onTap: () {
                  print("Forgot password?");
                },
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyTheme.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Sign In', onTap: signIn),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/signUp"),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                      color: MyTheme.subTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Sign Up",
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
