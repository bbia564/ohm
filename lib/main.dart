import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm/db_ohm/db_ohm.dart';
import 'package:ohm/pages/ohm_first/first_ya/first_ya_binding.dart';
import 'package:ohm/pages/ohm_first/first_ya/first_ya_view.dart';
import 'package:ohm/pages/ohm_first/ohm_first_binding.dart';
import 'package:ohm/pages/ohm_first/ohm_first_view.dart';
import 'package:ohm/pages/ohm_first/ohm_first_you.dart';
import 'package:ohm/pages/ohm_second/ohm_second_binding.dart';
import 'package:ohm/pages/ohm_second/ohm_second_view.dart';
import 'package:ohm/pages/ohm_tab/ohm_tab_binding.dart';
import 'package:ohm/pages/ohm_tab/ohm_tab_view.dart';
import 'package:ohm/pages/ohm_third/ohm_third_binding.dart';
import 'package:ohm/pages/ohm_third/ohm_third_view.dart';

Color primaryColor = const Color(0xff5977f7);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBOhm().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routs,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Routs = [
  GetPage(name: '/', page: () => const FirstYaView(), binding: FirstYaBinding()),
  GetPage(name: '/ohmTab', page: () => OhmTabPage(), binding: OhmTabBinding()),
  GetPage(name: '/ohmYou', page: () => const OhmFirstYou()),
  GetPage(name: '/ohmFirst', page: () => const OhmFirstPage(),binding: OhmFirstBinding()),
  GetPage(name: '/ohmSecond', page: () => OhmSecondPage(),binding: OhmSecondBinding()),
  GetPage(name: '/ohmThird', page: () => OhmThirdPage(), binding: OhmThirdBinding()),
];
