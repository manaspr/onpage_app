import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'container_box.dart';
import 'icon_content.dart';

enum Card {
  card_1,
  card_2,
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Card selectedCard = Card.card_1;
  int strnumber = 0;
  int number = 0;

  void incrementCounter() {
    setState(() {
      number++;
    });
  }

  void decrementCounter() {
    setState(() {
      number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c4046),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00aaff),
        title: const Text('One Page App'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: containerBox(
              color: Color(0xFF5c724a),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'NUMBER',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    number.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buttonSection(
                          icon: FontAwesomeIcons.minus,
                          onPressed: decrementCounter),
                      const SizedBox(
                        width: 10.0,
                      ),
                      buttonSection(
                          icon: FontAwesomeIcons.plus,
                          onPressed: incrementCounter),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: containerBox(
              color: Color(0xFF5c724a),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'NUMBER',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    strnumber.toString(),
                    style: kNumberTextStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: strnumber.toDouble(),
                      min: 0.0,
                      max: 500.0,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            strnumber = newValue.round();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = Card.card_1;
                      });
                    },
                    child: containerBox(
                      color: selectedCard == Card.card_1
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.palette,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = Card.card_2;
                      });
                    },
                    child: containerBox(
                      color: selectedCard == Card.card_2
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.palette,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buttonSection(
    {required IconData icon, required VoidCallback onPressed}) {
  return RawMaterialButton(
    fillColor: const Color(0xFFFFFFFF),
    elevation: 0.0,
    child: Icon(icon),
    onPressed: onPressed,
    constraints: const BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    ),
    shape: const CircleBorder(),
  );
}
