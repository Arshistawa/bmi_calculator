import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String? resultText; //underweight
  final String? bmiCalculatedResult; //22
  final String? resultDetail; //'You are underweight'
  final Color? biColor;

  const ResultPage(
      {super.key,
      required this.resultText,
      required this.bmiCalculatedResult,
      required this.resultDetail,
      required this.biColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Expanded(
                  child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Expanded(
              flex: 7,
              child: ReusableCard(
                myColor: inActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultText!,
                      style: TextStyle(
                          letterSpacing: 2,
                          color: biColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiCalculatedResult!,
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Normal BMI range:',
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                    const Text(
                      '18.5 - 25 kg/m\u00b2',
                      style: TextStyle(fontSize: 19),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      resultDetail!,
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                height: 80,
                width: double.infinity,
                color: maleSelectedColour,
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Text(
                    'RE-CALCULATE YOUR BMI',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
