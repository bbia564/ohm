import 'package:get/get.dart';

import 'ohm_second_logic.dart';

class OhmSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OhmSecondLogic());
  }
}
