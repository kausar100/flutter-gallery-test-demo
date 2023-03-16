import 'package:flutter/material.dart';

class MyTabsNonScrollable extends StatefulWidget {
  const MyTabsNonScrollable({super.key});

  @override
  _MyTabsNonScrollableState createState() => _MyTabsNonScrollableState();
}

class _MyTabsNonScrollableState extends State<MyTabsNonScrollable>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: tabs.length,
      vsync: this,
    );

    _tabController.addListener(() {
      // When the tab controller's value is updated, make sure to update the
      // tab index value, which is state restorable.
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  final tabs = ['RED', 'ORANGE', 'GREEN', 'BLUE', 'INDIGO', 'PURPLE'];
  final colors = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[tabIndex.value],
      appBar: AppBar(
        title: const Text(
          'Tab demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            Center(
              child: Text(tab, style: const TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );
  }
}
