import 'package:get/get.dart';

import 'first_voltage_logic.dart';

class FirstVoltageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstVoltageLogic());
  }
}
