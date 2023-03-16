import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({super.key});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> with RestorationMixin {
  @override
  Widget build(BuildContext context) {
    final banner = MaterialBanner(
      content: const Text(
        'This is from your password security management. You should change your password!',
      ),
      leading: _showLeading.value
          ? const Icon(
              Icons.privacy_tip,
              color: Colors.green,
            )
          : null,
      actions: [
        if (_showMultipleActions.value)
          TextButton(
              onPressed: () {
                setState(() {
                  _displayBanner.value = false;
                });
              },
              child: const Text('Dismiss')),
        TextButton(
            onPressed: () {
              setState(() {
                _displayBanner.value = false;
              });
            },
            child: const Text('OK'))
      ],
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          tooltip: 'Open navigation menu',
        ),
        title: const Text("Appbar"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: _displayBanner.value
                      ? const Text('Hide banner')
                      : const Text('Show banner'),
                  onTap: () {
                    setState(() {
                      _displayBanner.value = !_displayBanner.value;
                    });
                  },
                ),
                if (_displayBanner.value)
                  PopupMenuItem(
                    child: _showMultipleActions.value
                        ? const Text('Hide multiple options')
                        : const Text('Show multiple options'),
                    onTap: () {
                      setState(() {
                        _showMultipleActions.value =
                            !_showMultipleActions.value;
                      });
                    },
                  ),
                if (_displayBanner.value)
                  PopupMenuItem(
                    child: _showLeading.value
                        ? const Text('Hide leading icon')
                        : const Text('Show leading icon'),
                    onTap: () {
                      setState(() {
                        _showLeading.value = !_showLeading.value;
                      });
                    },
                  ),
              ];
            },
          )
        ],
      ),
      body: _displayBanner.value ? Center(child: banner) : null,
    );
  }

  @override
  String? get restorationId => 'banner_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_displayBanner, 'display_banner');
    registerForRestoration(_showMultipleActions, 'show_multiple_actions');
    registerForRestoration(_showLeading, 'show_leading');
  }

  final RestorableBool _displayBanner = RestorableBool(true);
  final RestorableBool _showMultipleActions = RestorableBool(true);
  final RestorableBool _showLeading = RestorableBool(true);

  @override
  void dispose() {
    _displayBanner.dispose();
    _showMultipleActions.dispose();
    _showLeading.dispose();
    super.dispose();
  }
}