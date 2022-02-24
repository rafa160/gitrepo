import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../styles/style.dart';

class CustomFormField extends StatelessWidget {

  final String text;
  final TextInputAction action;
  final TextInputType type;
  final bool obscureText;
  final String hint;
  final bool enabled;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> input;
  final String initialValue;
  final int maxLength;
  final FocusNode focusNode;
  final ValueTransformer transformer;
  final int maxLines;
  final TextEditingController controller;

  const CustomFormField(
      {Key key,
      this.text,
      this.action,
      this.type,
      this.obscureText,
      this.hint,
      this.enabled,
      this.validator,
      this.input,
      this.initialValue,
      this.maxLength,
      this.focusNode,
      this.transformer,
      this.maxLines,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      maxLines: maxLines,
      focusNode: focusNode,
      style: textBoldBlue12,
      enabled: enabled,
      initialValue: initialValue,
      name: text,
      autocorrect: false,
      validator: validator,
      textInputAction: action,
      keyboardType: type,
      obscureText: obscureText,
      maxLength: maxLength,
      inputFormatters: input,
      valueTransformer: transformer,
      decoration: InputDecoration(
        errorStyle: textBoldRedError8,
        counterText: '',
        hintText: hint,
        hintStyle: textBoldBlue12,
        contentPadding: const EdgeInsets.all(8),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(4.0)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(4.0)),
        errorBorder: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(4.0)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 10,
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }
}
