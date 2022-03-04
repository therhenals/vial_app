import 'package:flutter/material.dart';

import 'package:vial_app/providers/providers.dart';
import 'package:vial_app/widgets/option.dart';
import 'package:vial_app/widgets/widgets.dart';

class Step3Screen extends StatelessWidget {
  final ReportProvider form;

  const Step3Screen({
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
            'Visibilidad',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Es adecuada?',
            option: form.adequate,
            onChanged: (bool value) {
              form.adequate = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Oculta por vegetación?',
            option: form.vegetation,
            onChanged: (bool value) {
              form.vegetation = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Color opaco?',
            option: form.color,
            onChanged: (bool value) {
              form.color = value;
            },
          ),
          const SizedBox(height: 10),
          Option(
            text: '¿Anclado a un poste?',
            option: form.energyPost,
            onChanged: (bool value) {
              form.energyPost = value;
            },
          ),
          const SizedBox(height: 20),
          ButtonForm(
            icon: Icons.file_upload_outlined,
            text: form.isLoading ? 'Espere...' : 'Reportar',
            onPressed: form.isLoading
                ? null
                : () async {
                    await form.sendReport();
                    form.tabController.animateTo(0);
                  },
          ),
        ],
      ),
    );
  }
}
