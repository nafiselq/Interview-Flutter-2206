import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kTextLogo.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: inputTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            autofocus: false,
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            cursorColor: kBlackColor,
            decoration: const InputDecoration.collapsed(hintText: ''),
          ),
        ],
      ),
    );
  }
}
