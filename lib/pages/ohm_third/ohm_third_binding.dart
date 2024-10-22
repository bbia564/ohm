import 'package:get/get.dart';

import 'ohm_third_logic.dart';

class OhmThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OhmThirdLogic());
  }
}
