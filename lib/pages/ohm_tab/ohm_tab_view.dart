import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm/pages/ohm_first/ohm_first_view.dart';
import 'package:ohm/pages/ohm_second/ohm_second_view.dart';
import 'package:ohm/pages/ohm_third/ohm_third_view.dart';

import '../ohm_second/ohm_second_logic.dart';
import 'ohm_tab_logic.dart';

class OhmTabPage extends GetView<OhmTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          const OhmFirstPage(),
          OhmSecondPage(),
          OhmThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navOHMBars()),
    );
  }

  Widget _navOHMBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/firstItemUnselect.webp',width: 22,height: 22,),
          activeIcon:Image.asset('assets/firstItemSelected.webp',width: 22,height: 22,),
          label: 'Calculate',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/secondItemUnselect.webp',width: 22,height: 22,),
          activeIcon:Image.asset('assets/secondItemSelected.webp',width: 22,height: 22,),
          label: 'Records',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/thirdItemUnselect.webp',width: 22,height: 22,),
          activeIcon:Image.asset('assets/thirdItemSelected.webp',width: 22,height: 22,),
          label: 'Other',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          OhmSecondLogic ohmSecondLogic = Get.find<OhmSecondLogic>();
          ohmSecondLogic.getData();
        }
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
