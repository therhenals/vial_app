import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:vial_app/providers/providers.dart';
import 'package:vial_app/screens/step1/widgets/signal_types.dart';
import 'package:vial_app/widgets/widgets.dart';

class Step1Screen extends StatelessWidget {
  final ReportProvider form;

  const Step1Screen({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SignalImage(
              form: form,
            ),
            const SizedBox(height: 20),
            Location(
              lat: form.lat,
              lng: form.lng,
              onTap: () async {
                final position = await _determinePosition();
                form.lat = position.latitude.toString();
                form.lng = position.longitude.toString();
              },
            ),
            const SizedBox(height: 20),
            SignalTypes(
              form: form,
            ),
            const SizedBox(height: 20),
            ButtonForm(
              icon: Icons.arrow_forward,
              text: 'Siguiente',
              onPressed: () {
                form.tabController.animateTo(1);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
