import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bmi_calculator_brain.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int weight = 45;
  int age = 27;
  int height = 165;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //first Expanded
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      myColor: selectedGender == Gender.male
                          ? maleSelectedColor
                          : inActiveCardColor,
                      cardChild: IconContent(
                        text: 'MALE',
                        myIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      myColor: selectedGender == Gender.female
                          ? femaleSelectedColor
                          : inActiveCardColor,
                      cardChild: IconContent(
                        text: 'FEMALE',
                        myIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Second Expanded
          Expanded(
            child: ReusableCard(
              myColor: inActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  //height details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic, ////<-- HERE --> ////
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF4C4F5E),
                      thumbColor: buttonColor,
                    ),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Third Expanded
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    myColor: inActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const FaIcon(FontAwesomeIcons.plus),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const FaIcon(FontAwesomeIcons.minus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    myColor: inActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: const FaIcon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const FaIcon(FontAwesomeIcons.plus),
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              final bmi = calc.getCalculatedBMI();
              final resultText = calc.getResultText();
              final resultDetails = calc.getResultDetails();
              final resultColor;
              print(bmi);

              print(resultText);

              print(resultDetails);
              double result = double.parse(bmi);
              if ((result < 18.5) || (result > 25)) {
                resultColor = femaleSelectedColor;
              } else {
                resultColor = Color.fromARGB(255, 82, 214, 70);
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            resultText: resultText,
                            bmiCalculatedResult: bmi,
                            resultDetail: resultDetails,
                            biColor: resultColor,
                          )));
            },
            child: Container(
              height: 80,
              width: double.infinity,
              color: buttonColor,
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// height = double.parse(newvalue.toStringAsFixed(1));
