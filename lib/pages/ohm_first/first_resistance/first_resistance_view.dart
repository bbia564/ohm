import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../ohm_text_field.dart';
import 'first_resistance_logic.dart';

class FirstResistancePage extends StatefulWidget {
  const FirstResistancePage({Key? key}) : super(key: key);

  @override
  State<FirstResistancePage> createState() => _FirstResistancePageState();
}

class _FirstResistancePageState extends State<FirstResistancePage> with AutomaticKeepAliveClientMixin {
  FirstResistanceLogic controller = Get.put(FirstResistanceLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstResistanceLogic>(builder: (_) {
      return Container(
        child: <Widget>[
          const Text(
            'Voltage(U)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: OHMTextField(
                maxLength: 9,
                value: controller.text1,
                isNumber: true,
                onChange: (value) {
                  controller.text1 = value;
                }),
          ).decorated(
              color: const Color(0xfffcfcfc),
              border: Border.all(color: const Color(0xffd1d1d1)),
              borderRadius: BorderRadius.circular(5)),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Resistance(R)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: OHMTextField(
                maxLength: 9,
                value: controller.text2,
                isNumber: true,
                onChange: (value) {
                  controller.text2 = value;
                }),
          ).decorated(
              color: const Color(0xfffcfcfc),
              border: Border.all(color: const Color(0xffd1d1d1)),
              borderRadius: BorderRadius.circular(5)),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: const Text(
              'Calculate',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
              .decorated(
              color: primaryColor, borderRadius: BorderRadius.circular(25))
              .gestures(onTap: () {
            controller.save(context);
          }),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 122,
            padding: const EdgeInsets.all(12),
            child: <Widget>[
              const Text(
                'Electricity（I）calculate result',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff838383)),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                return Text(
                  controller.result.value,
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                  overflow: TextOverflow.ellipsis,
                );
              })
            ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
          ).decorated(
              color: const Color(0xfff4f6fa),
              borderRadius: BorderRadius.circular(12))
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
