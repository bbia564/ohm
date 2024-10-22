import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'first_ya_logic.dart';

class FirstYaView extends GetView<PageLogic> {
  const FirstYaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.connelly.value
              ? const CircularProgressIndicator(color: Colors.blue)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.pvud();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
