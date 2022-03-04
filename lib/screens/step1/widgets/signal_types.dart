import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vial_app/models/signal_type.dart';
import 'package:vial_app/providers/providers.dart';

class SignalTypes extends StatelessWidget {
  final ReportProvider form;
  const SignalTypes({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SignalType> items = form.signalTypes;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.report_outlined,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          border: InputBorder.none,
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        hint: Text(
          'Tipo de señal',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        buttonHeight: 60,
        dropdownDecoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        isExpanded: true,
        items: items
            .map(
              (item) => DropdownMenuItem<int>(
                value: item.id,
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          form.step1Form.control('type').value = value as int;
        },
      ),
    );
  }
}
