import 'package:calculator/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    'X^2',
    '0',
    '.',
    '=',
  ];

  String question = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      answer,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration:
                  const BoxDecoration(border: Border(top: BorderSide())),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    // Delete all the question and answer
                    return CustomButton(
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      backgroundColor: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 50, 50, 50)
                          : const Color.fromARGB(255, 59, 59, 59),
                      buttonOnTap: () {
                        setState(() {
                          question = '';
                          answer = '';
                        });
                      },
                    );
                  } else if (index == 1) {
                    return CustomButton(
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      backgroundColor: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 50, 50, 50)
                          : const Color.fromARGB(255, 59, 59, 59),
                      buttonOnTap: () {
                        setState(() {
                          question = question.substring(0, question.length - 1);
                        });
                      },
                    );
                  } else if (index == 16) {
                    return CustomButton(
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      backgroundColor: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 50, 50, 50)
                          : const Color.fromARGB(255, 59, 59, 59),
                      buttonOnTap: () {
                        setState(() {
                          squareRoot();
                        });
                      },
                    );
                  } else if (index == 19) {
                    return CustomButton(
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      backgroundColor: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 50, 50, 50)
                          : const Color.fromARGB(255, 59, 59, 59),
                      buttonOnTap: () {
                        setState(() {
                          evaluateEquation();
                        });
                      },
                    );
                  } else {
                    return CustomButton(
                      buttonText: buttons[index],
                      textColor: Colors.white,
                      backgroundColor: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 50, 50, 50)
                          : const Color.fromARGB(255, 59, 59, 59),
                      buttonOnTap: () {
                        setState(() {
                          question += buttons[index];
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String input) {
    if ((input == '%') ||
        (input == '/') ||
        (input == '*') ||
        (input == '-') ||
        (input == '+') ||
        (input == '=') ||
        (input == 'AC') ||
        (input == 'DEL')) {
      return true;
    }
    return false;
  }

  void evaluateEquation() {
    String currentQuestion = question;

    Parser p = Parser();
    Expression exp = p.parse(currentQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = '$eval';
  }

  void squareRoot() {
    String currentQuestion = question;
    currentQuestion = '${(currentQuestion)} ^ 2';

    Parser p = Parser();
    Expression exp = p.parse(currentQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = '$eval';
  }
}
