import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String text;

  const ButtonForm({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(width: 5),
          Text(text)
        ],
      ),
      onPressed: onPressed,
    );
  }
}
