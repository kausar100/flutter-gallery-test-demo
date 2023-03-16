import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'widget/bottomappbar_widget.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({super.key});

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> with RestorationMixin {
  final _showFab = RestorableBool(true); //fab-> floating action button
  final _showNotch = RestorableBool(true);
  final _currentFabLocation = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Appbar')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 90),
        children: [
          SwitchListTile(
              title: const Text('Floating Action Button'),
              value: _showFab.value,
              onChanged: (value) {
                setState(() {
                  _showFab.value = value;
                });
              }),
          if (_showFab.value)
            SwitchListTile(
                title: const Text('Notch'),
                value: _showNotch.value,
                onChanged: (value) {
                  setState(() {
                    _showNotch.value = value;
                  });
                }),
          if (_showFab.value)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Floating Action Button Position',
                textScaleFactor: 1.2,
              ),
            ),
          if (_showFab.value)
            Column(
              children: [
                RadioListTile(
                  title: const Text('Docked-end'),
                  value: 0,
                  groupValue: _currentFabLocation.value,
                  onChanged: (value) {
                    setState(() {
                      _currentFabLocation.value = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Docked-center'),
                  value: 1,
                  groupValue: _currentFabLocation.value,
                  onChanged: (value) {
                    setState(() {
                      _currentFabLocation.value = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Float-end'),
                  value: 2,
                  groupValue: _currentFabLocation.value,
                  onChanged: (value) {
                    setState(() {
                      _currentFabLocation.value = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Float-center'),
                  value: 3,
                  groupValue: _currentFabLocation.value,
                  onChanged: (value) {
                    setState(() {
                      _currentFabLocation.value = value!;
                    });
                  },
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: _showFab.value
          ? Semantics(
              container: true,
              sortKey: const OrdinalSortKey(0),
              child: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Create',
                child: const Icon(Icons.add),
              ),
            )
          : null,
      floatingActionButtonLocation: _fabLocations[_currentFabLocation.value],
      bottomNavigationBar: BottomAppBarWidget(
          fabLocation: _fabLocations[_currentFabLocation.value],
          shape: _showNotch.value ? const CircularNotchedRectangle() : null),
    );
  }

  @override
  String? get restorationId => 'bottom_appbar';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_showFab, 'show_fab');
    registerForRestoration(_showNotch, 'show_notch');
    registerForRestoration(_currentFabLocation, 'fab_location');
  }

  @override
  void dispose() {
    _showFab.dispose();
    _showNotch.dispose();
    _currentFabLocation.dispose();
    super.dispose();
  }

  static final _fabLocations = [
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.centerFloat,
  ];
}
