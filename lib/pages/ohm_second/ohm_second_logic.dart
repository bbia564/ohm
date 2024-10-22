import 'package:get/get.dart';
import 'package:ohm/db_ohm/db_ohm.dart';
import 'package:ohm/db_ohm/ohm_entity.dart';

class OhmSecondLogic extends GetxController {

  DBOhm db = Get.find<DBOhm>();

  var list = <OHMEntity>[].obs;

  final list1 = ['Voltage(U)', 'Electricity(I)', 'Resistance(R)'];
  final list2 = ['Electricity', 'Voltage', 'Voltage'];
  final list3 = ['Resistance', 'Resistance', 'Electricity'];

  void getData() async {
    list.value = await db.getAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
