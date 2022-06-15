import 'package:bmi_calculator/constants/app_constans.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  double bar_width;
  RightBar({super.key, required this.bar_width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: bar_width,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
