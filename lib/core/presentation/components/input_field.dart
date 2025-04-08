import 'package:flutter/material.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TST.smallTextRegular),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: CST.gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: CST.primary80),
            ),
            hintText: placeHolder,
            hintStyle: TST.smallTextRegular.copyWith(color: CST.gray4),
          ),
        ),
      ],
    );
  }
}
