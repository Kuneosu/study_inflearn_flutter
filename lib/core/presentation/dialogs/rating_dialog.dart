import 'package:flutter/material.dart';
import 'package:inf_fl/core/presentation/components/small_button.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final int score;
  final String actionName;
  final void Function(int score) onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.score,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.title,
          style: TST.smallTextRegular,
        ),
      ),
      content: RatingBar(
        value: _value,
        onChange: (int value) {
          setState(() {
            _value = value;
          });
        },
      ),
      actions: [
        SmallButton(
          widget.actionName,
          color: CST.rating,
          textStyle: TST.smallerTextRegular,
          onPressed: () {
            widget.onChange(_value);
          },
        ),
      ],
    );
  }
}

class RatingBar extends StatelessWidget {
  final int value;
  final void Function(int value) onChange;

  const RatingBar({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTapDown: (_) {
              onChange(index + 1);
            },
            child: Icon(
              value - 1 >= index ? Icons.star : Icons.star_border_outlined,
              size: 30,
              color: CST.rating,
            ),
          );
        },
      ),
    );
  }
}
