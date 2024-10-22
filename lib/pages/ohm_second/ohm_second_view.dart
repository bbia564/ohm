import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'ohm_second_logic.dart';

class OhmSecondPage extends GetView<OhmSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.webp',
            width: double.infinity,
            height: 496,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: <Widget>[
              const Text(
                'Records',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ).marginOnly(top: 25),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Obx(() {
                    return controller.list.value.isEmpty
                        ? const Center(
                            child: Text('No data'),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.list.value.length,
                            itemBuilder: (_, index) {
                              final entity = controller.list.value[index];
                              return Container(
                                child: <Widget>[
                                  <Widget>[
                                    <Widget>[
                                      Text(
                                        controller.list1[entity.type],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${controller.list2[entity.type]}: ${entity.text1}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                      Text(
                                        '${controller.list3[entity.type]}: ${entity.text2}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    ].toColumn(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start),
                                    const SizedBox(width: 5,),
                                    Expanded(
                                        child: Text(
                                      entity.result,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ))
                                  ].toRow(),
                                  Divider(
                                    height: 15,
                                    color: Colors.grey.withOpacity(0.3),
                                  )
                                ].toColumn(),
                              );
                            });
                  }),
                )
                    .decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10))
                    .marginSymmetric(vertical: 10),
              )
            ]
                .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                .marginSymmetric(horizontal: 15),
          )
        ],
      ),
    );
  }
}
