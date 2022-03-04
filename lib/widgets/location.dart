import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  final String lat;
  final String lng;
  final String? image;
  final void Function()? onTap;

  const Location({
    Key? key,
    required this.lat,
    required this.lng,
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: _decorationCard(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _Icon(onTap: onTap),
                const SizedBox(width: 16),
                _Position(lat: lat, lng: lng),
              ],
            ),
          ),
          if (image != null) const Expanded(child: SizedBox()),
          if (image != null) _Image(image: image!),
        ],
      ),
    );
  }

  BoxDecoration _decorationCard() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      );
}

class _Image extends StatelessWidget {
  final String image;
  const _Image({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Image(
        height: 96,
        width: 70,
        fit: BoxFit.cover,
        image: NetworkImage(image),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        child: const Icon(
          Icons.fmd_good_outlined,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class _Position extends StatelessWidget {
  final String lat;
  final String lng;

  const _Position({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lat.isNotEmpty ? 'Lat: $lat' : 'Lat: ...',
          style: cardTextStyle(),
        ),
        Text(
          lng.isNotEmpty ? 'Lng: $lng' : 'Lng: ...',
          style: cardTextStyle(),
        ),
      ],
    );
  }

  TextStyle cardTextStyle() => const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );
}
