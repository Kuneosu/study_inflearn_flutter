import 'package:flutter/material.dart';
import 'package:inf_fl/ui/color_st.dart';
import 'package:inf_fl/ui/text_st.dart';

class TwoTab extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onChange;

  const TwoTab({
    super.key,
    required this.labels,
    this.selectedIndex = 0,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChange(0);
            },
            child:
                selectedIndex == 0
                    ? _SelectedTab(text: labels[0])
                    : _UnSelectedTab(text: labels[0]),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChange(1);
            },
            child:
                selectedIndex == 1
                    ? _SelectedTab(text: labels[1])
                    : _UnSelectedTab(text: labels[1]),
          ),
        ),
      ],
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final String text;

  const _SelectedTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CST.primary100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TST.smallerTextBold.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}

class _UnSelectedTab extends StatelessWidget {
  final String text;

  const _UnSelectedTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CST.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TST.smallerTextBold.copyWith(color: CST.primary80)),
        ],
      ),
    );
  }
}
