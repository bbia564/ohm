import 'package:get/get.dart';

import 'first_ya_logic.dart';

class FirstYaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
