import 'package:flutter/material.dart';

import '../theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? message;
  final double? height;
  final double? width;
  final Color? color;
  final IconData? icon;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.message,
      this.height,
      this.width,
      this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        onTap.call();
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message.toString()),
          ));
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: height ?? 55,
        width: width ?? size.width * .9,
        decoration: BoxDecoration(
            color: color ?? MyTheme.primaryColor,
            borderRadius: BorderRadius.circular(MyTheme.borderRadius),
            boxShadow: [
              BoxShadow(color: color ?? MyTheme.primaryColor, blurRadius: 6)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: MyTheme.backgroundColor,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: MyTheme.backgroundColor,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
