import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';

class TextFieldLogin extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final IconData icon;
  final String semanticLabel;
  final String? Function(String?)? validator;

  const TextFieldLogin({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    required this.icon,
    this.obscureText = true,
    required this.semanticLabel,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          onChanged: (value) {},
          controller: textEditingController,
          keyboardType: textInputType,
          obscureText: obscureText,
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Semantics(
              label: semanticLabel,
              child: Material(
                elevation: 0,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child:  Icon(
                  icon,
                  color: lightBlue,
                ),
              ),
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
