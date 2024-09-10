import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? buttonOnTap;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOnTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: backgroundColor),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
