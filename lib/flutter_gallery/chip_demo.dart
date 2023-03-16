import 'package:flutter/material.dart';

import 'widget/action_chip_widget.dart';
import 'widget/choice_chip_widget.dart';
import 'widget/filter_chip_widget.dart';
import 'widget/input_chip_widget.dart';

class MyChipDemo extends StatefulWidget {
  const MyChipDemo({super.key});

  @override
  State<MyChipDemo> createState() => _MyChipDemoState();
}

class _MyChipDemoState extends State<MyChipDemo> with RestorationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showTitle(_currentSelectedChip.value),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Action Chip'),
                  onTap: () {
                    setState(() {
                      _currentSelectedChip.value = 0;
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text('Choice Chip'),
                  onTap: () {
                    setState(() {
                      _currentSelectedChip.value = 1;
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text('Filter Chip'),
                  onTap: () {
                    setState(() {
                      _currentSelectedChip.value = 2;
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text('Input Chip'),
                  onTap: () {
                    setState(() {
                      _currentSelectedChip.value = 3;
                    });
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: showchip(context, _currentSelectedChip),
    );
  }

  @override
  String? get restorationId => 'chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentSelectedChip, 'select_chip');
  }

  final _currentSelectedChip = RestorableInt(0);

  @override
  void dispose() {
    _currentSelectedChip.dispose();
    super.dispose();
  }

  showchip(BuildContext context, RestorableInt currentSelectedChip) {
    switch (currentSelectedChip.value) {
      case 0:
        return const MyActionChip();
      case 1:
        return const MyChoiceChip();
      case 2:
        return const MyFilterChip();
      case 3:
        return const MyInputChip();
    }
  }

  _showTitle(int value) {
    switch (value) {
      case 0:
        return const Text('Action Chip');
      case 1:
        return const Text('Choice Chip');
      case 2:
        return const Text('Filter Chip');
      case 3:
        return const Text('Input Chip');
    }
  }
}
