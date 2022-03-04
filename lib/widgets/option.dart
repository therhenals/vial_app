import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final void Function(bool) onChanged;
  final String text;
  final bool option;

  const Option({
    Key? key,
    required this.text,
    required this.option,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            inactiveTrackColor: Colors.red[100],
            value: option,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
