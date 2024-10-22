import 'package:get/get.dart';

import 'ohm_first_logic.dart';

class OhmFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OhmFirstLogic());
  }
}
