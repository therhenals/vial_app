import 'package:flutter/material.dart';

import 'package:vial_app/providers/providers.dart';
import 'package:vial_app/widgets/option.dart';
import 'package:vial_app/widgets/widgets.dart';

class Step2Screen extends StatelessWidget {
  final ReportProvider form;

  const Step2Screen({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Conservación',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Esta limpia?',
            option: form.clean,
            onChanged: (bool value) {
              form.clean = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Esta rayada?',
            option: form.scratched,
            onChanged: (bool value) {
              form.scratched = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Esta el tablero doblado?',
            option: form.foldedBoard,
            onChanged: (bool value) {
              form.foldedBoard = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Esta el poste doblado?',
            option: form.bentPost,
            onChanged: (bool value) {
              form.bentPost = value;
            },
          ),
          const SizedBox(height: 20),
          ButtonForm(
            icon: Icons.arrow_forward,
            text: 'Siguiente',
            onPressed: () {
              form.tabController.animateTo(2);
            },
          ),
        ],
      ),
    );
  }
}
