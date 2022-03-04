import 'package:flutter/material.dart';

class OptionDetail extends StatelessWidget {
  final String text;
  final bool option;

  const OptionDetail({
    Key? key,
    required this.text,
    required this.option,
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
          Text(
            option ? 'Si' : 'No',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
