import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'ohm_third_logic.dart';

class OhmThirdPage extends GetView<OhmThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all data', 'About us'];

    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanOHMData();
          break;
        case 1:
          controller.aboutOHMUS(context);
          break;
      }
    });
  }

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
                'Other setting',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ).marginOnly(top: 25),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      _item(0, context),
                      _item(1, context),
                    ].toColumn(
                        separator: Divider(
                      height: 15,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
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
