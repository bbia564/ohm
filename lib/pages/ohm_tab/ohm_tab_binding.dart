import 'package:get/get.dart';

import '../ohm_first/ohm_first_logic.dart';
import '../ohm_second/ohm_second_logic.dart';
import '../ohm_third/ohm_third_logic.dart';
import 'ohm_tab_logic.dart';

class OhmTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OhmTabLogic());
    Get.lazyPut(() => OhmFirstLogic());
    Get.lazyPut(() => OhmSecondLogic());
    Get.lazyPut(() => OhmThirdLogic());
  }
}
