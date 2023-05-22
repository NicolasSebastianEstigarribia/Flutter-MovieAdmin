import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextInputAction? action;
  final String? valorInicial;
  final TextEditingController? controller;
  final bool activado;

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  final TextInputType? valor;
  final FocusNode? focusNode;
  final int? maxLines;

  final String? labelText;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final InputBorder? border;

  final bool validarCampo;
  final EdgeInsetsGeometry? padding;
  final TextCapitalization? textCapitalization;

  final bool alignLabelWithHint;
  final dynamic floatingLabelBehavior;

  final Widget? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextStyle? labelStyle;

  const PTextField({
    Key? key,
    this.focusNode,
    this.onFieldSubmitted,
    this.action,
    this.inputFormatters,
    this.onChanged,
    this.textAlign,
    this.activado = true,
    this.valorInicial,
    this.valor,
    this.controller,
    this.maxLines = 1,
    this.labelText,
    this.label,
    this.hintText,
    this.border,
    this.validarCampo = true,
    this.helperText,
    this.padding,
    this.textCapitalization,
    this.alignLabelWithHint = false,
    this.floatingLabelBehavior,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validarCampo
          ? (value) {
              if (value!.isEmpty) {
                return "The field cannot be empty";
              }
              return null;
            }
          : null,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: maxLines,
      focusNode: focusNode,
      inputFormatters: inputFormatters ??
          [
            LengthLimitingTextInputFormatter(40),
            FilteringTextInputFormatter.deny(RegExp(
                '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
          ],
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: activado,
      initialValue: valorInicial,
      keyboardType: valor,
      textInputAction: action ?? TextInputAction.next,
      controller: controller,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(color: Theme.of(context).primaryColorDark),
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: floatingLabelBehavior,
        alignLabelWithHint: alignLabelWithHint,
        contentPadding: (padding == null)
            ? const EdgeInsets.only(bottom: 0, top: 10, left: 5)
            : padding,
        border: border,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        label: label,
        labelText: label == null ? labelText : null,
        labelStyle: const TextStyle(color: Colors.black),
        helperText: helperText,
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;

    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
