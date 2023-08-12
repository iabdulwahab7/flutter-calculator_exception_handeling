import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final Color clr;
  final VoidCallback onPress;
  const ReusableButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.clr = const Color.fromARGB(255, 130, 128, 128)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: clr,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
