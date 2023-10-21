import 'package:flutter/material.dart';

class UserCredentialField extends StatelessWidget {
  final String hint;
  final Color color;
  final bool obscureText;
  final Function(String)? onChanged;
  const UserCredentialField(
      {Key? key,
      required this.hint,
      required this.onChanged,
      required this.color, required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        // hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
