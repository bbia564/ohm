import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_ohm/db_ohm.dart';

class FirstResistanceLogic extends GetxController {

  DBOhm db = Get.find<DBOhm>();

  String text1 = '';
  String text2 = '';
  var result = '-'.obs;

  void save(BuildContext context) async {
    if (text1.isEmpty || text2.isEmpty) {
      Fluttertoast.showToast(msg: 'Please complete');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    final num1 = num.tryParse(text1) ?? 0.0;
    final num2 = num.tryParse(text2) ?? 0.0;
    text1 = num1.toString();
    text2 = num2.toString();
    update();
    if (num1 == 0 || num2 == 0) {
      Fluttertoast.showToast(msg: 'Please fill in correctly');
      return;
    }
    result.value = (num1 / num2).toStringAsFixed(2);
    await db.dbBase.insert('ohm', {
      'createTime': DateTime.now().toIso8601String(),
      'type': 1,
      'text1': text1,
      'text2': text2,
      'result': result.value,
    });
    Fluttertoast.showToast(msg: 'The calculation result has been saved');
  }

}
