import 'package:bmi_calculator/constants/app_constans.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  double bar_width;
  LeftBar({super.key, required this.bar_width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: bar_width,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
