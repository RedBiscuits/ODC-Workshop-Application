import 'package:flutter/material.dart';
import 'package:login/utils/constants.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  String? label,
  int? minLines,
  String? initialValue,
  IconData? prefixIcon,
  IconData? suffixIcon,
  onSubmit,
  onChange,
  InputDecoration? decoration,
  onTap,
  // required validator,
  function,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      minLines: minLines?? 1,
      maxLines: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return "Can't be empty";
        } else if (value.length < 8) {
          return "Can't be less than 8";
        }
      },
      initialValue: initialValue,
      obscureText: isPassword,
      cursorColor: appColor,
      decoration: (decoration != null)
          ? decoration
          : InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: appColor, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              labelText: label,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                      ),
                      onPressed: function,
                    )
                  : null,
              border: OutlineInputBorder(),
            ),
    );
