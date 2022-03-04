import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/providers/report_provider.dart';
import 'package:vial_app/screens/detail/widgets/option.dart';
import 'package:vial_app/screens/detail/widgets/signal_image.dart';
import 'package:vial_app/widgets/widgets.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(reportProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SignalImageDetail(
                  id: report.detail.id.toString(),
                  image:
                      'https://storage.googleapis.com/app-nest-990e5.appspot.com/' +
                          report.detail.urlPhoto,
                ),
                const SizedBox(
                  height: 20,
                ),
                Location(
                  lat: report.detail.lat,
                  lng: report.detail.lng,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Conservación',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Esta limpia?',
                  option: report.detail.conservation.clean,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Esta rayada?',
                  option: report.detail.conservation.scratched,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Esta el tablero doblado?',
                  option: report.detail.conservation.foldedBoard,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Esta el poste doblado?',
                  option: report.detail.conservation.bentPost,
                ),
                Text(
                  'Visibilidad',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Es adecuada?',
                  option: report.detail.visibility.adequate,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Oculta por vegetación?',
                  option: report.detail.visibility.vegetation,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Color opaco?',
                  option: report.detail.visibility.color,
                ),
                const SizedBox(height: 10),
                OptionDetail(
                  text: '¿Anclado a un poste?',
                  option: report.detail.visibility.energyPost,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
