// ignore_for_file: non_constant_identifier_names

import 'package:bmi_calculator/widget/left_bar.dart';
import 'package:bmi_calculator/widget/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants/app_constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi_Result = 0;
  String _text_Result = "";

  void _calculate_BMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    setState(() {
      _bmi_Result = weight / (height * height);

      if (_bmi_Result > 25) {
        _text_Result = "You're over weight";
      } else if (_bmi_Result < 15) {
        _text_Result = "You're under weight";
      } else {
        _text_Result = "You're fit weight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      color: accentColor,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: accentColor.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 40,
                      color: accentColor,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (() {
                _calculate_BMI();
              }),
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 22,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              _bmi_Result.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 70,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _text_Result.isNotEmpty,
              child: Text(
                _text_Result,
                style: TextStyle(
                  fontSize: 25,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RightBar(bar_width: 30),
            const SizedBox(
              height: 10,
            ),
            RightBar(bar_width: 70),
            const SizedBox(
              height: 10,
            ),
            RightBar(bar_width: 45),
            const SizedBox(
              height: 10,
            ),
            LeftBar(bar_width: 46),
            const SizedBox(
              height: 10,
            ),
            LeftBar(bar_width: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            _bmi_Result = 0;
            _text_Result = "";
            _heightController.text = "";
            _weightController.text = "";
          });
        }),
        backgroundColor: HexColor("#e32636"),
        child: const Icon(
          Icons.loop,
        ),
      ),
    );
  }
}
