import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perhitungan_kubus/page/keliling_kubus.dart';
import 'package:perhitungan_kubus/page/luas_kubus.dart';
import 'package:perhitungan_kubus/page/volume_kubus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  String titleToolbar;
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    appBar(){
      return AppBar(
        title: Text(
            'Perhitungan Kubus'
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Image.asset('assets/keliling_kubus.png', width: 25,), text: "Keliling"),
            Tab(icon: Image.asset('assets/luas_kubus.png', width: 18,), text: "Luas"),
            Tab(icon: Image.asset('assets/box_26.png', width: 20,), text: "Volume")
          ],
        ),
      );
    }


    body(){
      return TabBarView(
        controller: tabController,
        children: [
          KelilingKubus(),
          LuasKubus(),
          VolumeKubus()
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}

