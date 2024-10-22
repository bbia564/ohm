import 'package:get/get.dart';

import 'first_resistance_logic.dart';

class FirstResistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstResistanceLogic());
  }
}
