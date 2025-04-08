import 'package:flutter/material.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';


class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton(
    this.text, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected ? CST.primary100 : Colors.white,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TST.smallTextRegular.copyWith(
              color: isSelected ? CST.white : CST.primary80,
            ),
          ),
          const SizedBox(width: 0.5),
          Icon(
            Icons.star,
            color: isSelected ? Colors.white : CST.primary100,
            size: 18,
          ),
        ],
      ),
      side: const BorderSide(color: CST.primary100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
