import 'package:flutter/material.dart';

class SignalImageDetail extends StatelessWidget {
  final String image;
  final String id;
  const SignalImageDetail({
    Key? key,
    required this.image,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image(
            width: size.width * 0.50,
            height: size.height * 0.35,
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: _IdTag(
              id: id,
            ),
          ),
        ],
      ),
    );
  }
}

class _IdTag extends StatelessWidget {
  final String id;

  const _IdTag({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 30,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '#$id',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
