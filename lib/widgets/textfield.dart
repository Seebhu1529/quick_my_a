import 'package:flutter/material.dart';

import '../theme.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.size,
    required this.hint,
    required this.icon,
    required this.onChanged,
    this.isPassword = false,
  });

  final Size size;
  final String hint;
  final bool isPassword;
  final IconData icon;
  final void Function(String value) onChanged;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isVisible = true;
  String? isText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          width: widget.size.width * .9,
          decoration: BoxDecoration(
            color: MyTheme.widgetColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
              textAlignVertical: TextAlignVertical.center,
              obscureText: widget.isPassword ? isVisible : false,
              keyboardType: widget.hint == "Email address"
                  ? TextInputType.emailAddress
                  : null,
              cursorColor: MyTheme.subTextColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: MyTheme.subTextColor,
                  icon: Icon(
                    widget.icon,
                    color: MyTheme.subTextColor,
                  ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(color: MyTheme.subTextColor),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () =>
                              setState(() => isVisible = !isVisible),
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: MyTheme.subTextColor,
                          ))
                      : const SizedBox()),
              onChanged: (value) => setState(() {
                    isText = value;
                    widget.onChanged(value);
                  })),
        ),
        if (isText?.isEmpty ?? false)
          Text(
            "Please enter your ${widget.hint}",
            style: TextStyle(color: MyTheme.errorColor),
          )
      ],
    );
  }
}
