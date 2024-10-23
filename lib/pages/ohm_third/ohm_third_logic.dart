import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:ohm/db_ohm/db_ohm.dart';
import 'package:ohm/pages/ohm_second/ohm_second_logic.dart';
import 'package:package_info_plus/package_info_plus.dart';

class OhmThirdLogic extends GetxController {

  DBOhm db = Get.find<DBOhm>();

  cleanOHMData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await db.cleanAllData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutOHMUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/land2.png',
        width: 78,
        height: 78,
      ),
      children: [
        const Text(
            """We can provide you with ohm calculations"""),
      ],
      context: context,
    );
  }

  aboutOHMPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(data: """
#### Data Collection
Our apps do not collect any personal information or user data. All event logs are executed locally on the device and are not transmitted to any external server.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """),
        );
      },
    );
  }

}
