import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ohm/pages/ohm_first/first_electric/first_electric_view.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'first_resistance/first_resistance_view.dart';
import 'first_voltage/first_voltage_view.dart';
import 'ohm_first_logic.dart';

class OhmFirstPage extends StatefulWidget {
  const OhmFirstPage({Key? key}) : super(key: key);

  @override
  State<OhmFirstPage> createState() => _OhmFirstPageState();
}

class _OhmFirstPageState extends State<OhmFirstPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  const Text(
                    'Ohm calculation',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ).marginOnly(top: 25),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Enter parameters to calculate',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      child: Theme(
                        data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            useMaterial3: true,
                            tabBarTheme: const TabBarTheme(
                                indicatorColor: Colors.transparent)),
                        child: TabBar(
                          tabAlignment: TabAlignment.fill,
                          controller: _tabController,
                          dividerColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          labelPadding: EdgeInsets.zero,
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          indicator: BoxDecoration(
                              color: const Color(0xff404040),
                              borderRadius: BorderRadius.circular(19.5)),
                          tabs: const [
                            SizedBox(
                                width: double.infinity,
                                height: 39,
                                child: Tab(
                                  text: "Voltage",
                                )),
                            SizedBox(
                                width: double.infinity,
                                height: 39,
                                child: Tab(
                                  text: "Electricity",
                                )),
                            SizedBox(
                                width: double.infinity,
                                height: 39,
                                child: Tab(
                                  text: "Resistance",
                                ))
                          ],
                        ),
                      ),
                    ),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 412,
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: TabBarView(
                        controller: _tabController,
                        children:const [
                          FirstElectricPage(),
                          FirstResistancePage(),
                          FirstVoltagePage(),
                        ],
                      ),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12))
                ]
                    .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                    .marginSymmetric(horizontal: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
