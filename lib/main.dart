import 'dart:async';

import 'package:flutter/material.dart';
import 'flutter_gallery/chip_demo.dart';
import 'flutter_gallery/app_bar.dart';
import 'flutter_gallery/bottom_app_bar.dart';

import 'flutter_gallery/bottom_navigation.dart';
import 'flutter_gallery/context_menu_demo.dart';
import 'flutter_gallery/pickers_demo.dart';
import 'flutter_gallery/tab_demo.dart';
import 'flutter_gallery/toggle_btns.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Tab Page Selector'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _index = 0;

  final List<Widget> _icons = const [
    Icon(Icons.home, size: 100),
    Icon(Icons.settings, size: 100),
    Icon(Icons.person, size: 100),
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _icons.length,
        vsync: this,
        initialIndex: _index,
        animationDuration: const Duration(seconds: 3));

    _tabController.addListener(() {
      setState(() {});
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      (_index != _icons.length - 1) ? _index++ : _index = 0;
      _tabController.animateTo(_index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(controller: _tabController, children: _icons),
          //Used Positioned widget to position TabPageSelector at the bottom of screen.
          Positioned(
            bottom: MediaQuery.of(context).size.height * .25,
            child: TabPageSelector(
              color: Colors.black38,
              controller: _tabController,
              indicatorSize: 16,
              selectedColor: Colors.blue,
            ),
          ),
        ],
      ),
      // Center(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CupertinoPickerDemo(),
          ));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
