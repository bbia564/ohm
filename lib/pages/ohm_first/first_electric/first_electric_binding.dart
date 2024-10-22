import 'package:get/get.dart';

import 'first_electric_logic.dart';

class FirstElectricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstElectricLogic());
  }
}
