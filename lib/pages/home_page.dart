import 'package:calculator/components/custom_button.dart';
import 'package:flutter/material.dart';

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
    '+/-',
    '0',
    '.',
    '=',
  ];

  String question = '5 * 5';
  String answer = '25';

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
                  if (index == 17) {
                    return AspectRatio(
                      aspectRatio: 10,
                      child: CustomButton(
                        buttonText: buttons[index],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                        backgroundColor: isOperator(buttons[index])
                            ? const Color.fromARGB(255, 50, 50, 50)
                            : const Color.fromARGB(255, 59, 59, 59),
                      ),
                    );
                  }

                  return CustomButton(
                    buttonText: buttons[index],
                    textColor: Colors.white,
                    backgroundColor: isOperator(buttons[index])
                        ? const Color.fromARGB(255, 50, 50, 50)
                        : const Color.fromARGB(255, 59, 59, 59),
                  );
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
}
