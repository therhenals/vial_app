import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vial_app/models/report.dart';
import 'package:vial_app/models/signal_type.dart';
import 'package:vial_app/providers/providers.dart';

final reportProvider =
    ChangeNotifierProvider((ref) => ReportProvider(ref.read(apiProvider)));

class ReportProvider extends ChangeNotifier {
  final ApiProvider api;

  ReportProvider(
    this.api,
  );

  late TabController tabController;

  // start step1
  final step1Form = FormGroup({
    'path': FormControl<String>(value: '', validators: [Validators.required]),
    'lat': FormControl<String>(value: '', validators: [Validators.required]),
    'lng': FormControl<String>(value: '', validators: [Validators.required]),
    'type': FormControl<int>(value: null, validators: [Validators.required]),
  });

  String get path => step1Form.control('path').value;
  String get lat => step1Form.control('lat').value;
  String get lng => step1Form.control('lng').value;
  int get type => step1Form.control('type').value;

  set path(String value) {
    step1Form.control('path').value = value;
    notifyListeners();
  }

  set lat(String value) {
    step1Form.control('lat').value = value;
    notifyListeners();
  }

  set lng(String value) {
    step1Form.control('lng').value = value;
    notifyListeners();
  }

  set type(int value) {
    step1Form.control('type').value = value;
    notifyListeners();
  }

  //end step1

  // start step2

  final step2Form = FormGroup({
    'clean': FormControl<bool>(
      value: false,
    ),
    'scratched': FormControl<bool>(
      value: false,
    ),
    'foldedBoard': FormControl<bool>(
      value: false,
    ),
    'bentPost': FormControl<bool>(
      value: false,
    ),
  });

  bool get clean => step2Form.control('clean').value;
  bool get scratched => step2Form.control('scratched').value;
  bool get foldedBoard => step2Form.control('foldedBoard').value;
  bool get bentPost => step2Form.control('bentPost').value;

  set clean(bool value) {
    step2Form.control('clean').value = value;
    notifyListeners();
  }

  set scratched(bool value) {
    step2Form.control('scratched').value = value;
    notifyListeners();
  }

  set foldedBoard(bool value) {
    step2Form.control('foldedBoard').value = value;
    notifyListeners();
  }

  set bentPost(bool value) {
    step2Form.control('bentPost').value = value;
    notifyListeners();
  }

  // end step2

  // start step3

  final step3Form = FormGroup({
    'adequate': FormControl<bool>(
      value: false,
    ),
    'vegetation': FormControl<bool>(
      value: false,
    ),
    'color': FormControl<bool>(
      value: false,
    ),
    'energyPost': FormControl<bool>(
      value: false,
    ),
  });

  bool get adequate => step3Form.control('adequate').value;
  bool get vegetation => step3Form.control('vegetation').value;
  bool get color => step3Form.control('color').value;
  bool get energyPost => step3Form.control('energyPost').value;

  set adequate(bool value) {
    step3Form.control('adequate').value = value;
    notifyListeners();
  }

  set vegetation(bool value) {
    step3Form.control('vegetation').value = value;
    notifyListeners();
  }

  set color(bool value) {
    step3Form.control('color').value = value;
    notifyListeners();
  }

  set energyPost(bool value) {
    step3Form.control('energyPost').value = value;
    notifyListeners();
  }

  // end step3

  setTabController(TabController controller) {
    tabController = controller;
  }

  List<SignalType> signalTypes = [];
  List<ReportModel> reports = [];

  getSignalTypes() async {
    signalTypes.clear();
    final response = await api.get('/signal-types/list');
    final List list = response.data;
    for (var e in list) {
      signalTypes.add(SignalType.fromMap(e));
    }
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> sendReport() async {
    if (step1Form.valid && step2Form.valid && step3Form.valid) {
      isLoading = true;
      File imagefile = File(path);
      final List<int> imagebytes = imagefile.readAsBytesSync();
      String img64 = base64Encode(imagebytes); //convert bytes to base64 string
      await api.post(path: '/reports/create', data: {
        'lat': lat,
        'lng': lng,
        'photo': img64,
        'adequate': adequate,
        'vegetation': vegetation,
        'color': color,
        'energyPost': energyPost,
        'clean': clean,
        'scratched': scratched,
        'foldedBoard': foldedBoard,
        'bentPost': bentPost,
        'typeId': type
      });

      step1Form.value = {
        'path': '',
        'lat': '',
        'lng': '',
        'type': null,
      };
      step2Form.value = {
        'clean': false,
        'scratched': false,
        'foldedBoard': false,
        'bentPost': false,
      };
      step3Form.value = {
        'adequate': false,
        'vegetation': false,
        'color': false,
        'energyPost': false,
      };
      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> getAll() async {
    reports.clear();
    final response = await api.get('/reports/listAll');
    final List list = response.data;
    for (var e in list) {
      print(e);
      reports.add(ReportModel.fromMap(e));
    }
    notifyListeners();
  }

  late ReportModel _detail;

  set detail(ReportModel report) {
    _detail = report;
    notifyListeners();
  }

  ReportModel get detail => _detail;
}
