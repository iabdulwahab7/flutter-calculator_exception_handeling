import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'constants/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                result.toString(),
                                style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  userInput.toString(),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ReusableButton(
                            title: "AC",
                            clr: Colors.red.shade400,
                            onPress: () {
                              userInput = '';
                              result = '';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "+/-",
                            onPress: () {
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "%",
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "/",
                            clr: Colors.green,
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ReusableButton(
                            title: "7",
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "8",
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "9",
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "x",
                            clr: Colors.green,
                            onPress: () {
                              userInput += '*';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ReusableButton(
                            title: "4",
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "5",
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "6",
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "-",
                            clr: Colors.green,
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ReusableButton(
                            title: "1",
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "2",
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "3",
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "+",
                            clr: Colors.green,
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ReusableButton(
                            title: "0",
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: ".",
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "DEL",
                            clr: Colors.red.shade500,
                            onPress: () {
                              userInput.isNotEmpty
                                  ? userInput = userInput.substring(
                                      0, userInput.length - 1)
                                  : '';
                              setState(() {});
                            },
                          ),
                          ReusableButton(
                            title: "=",
                            clr: Colors.green,
                            onPress: () {
                              userInput.isNotEmpty ? equalButton() : " ";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalButton() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
