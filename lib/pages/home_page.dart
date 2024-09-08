import 'package:calculator/components/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: Container(),
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
                  return CustomButton(
                    buttonText: buttons[index],
                    textColor: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: isOperator(buttons[index])
                        ? Colors.blue[400]
                        : Colors.grey[300],
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
        (input == 'x') ||
        (input == '-') ||
        (input == '+') ||
        (input == '=') ||
        (input == 'C') ||
        (input == 'DEL')) {
      return true;
    }
    return false;
  }
}
