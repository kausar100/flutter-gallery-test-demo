import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuDemo extends StatelessWidget {
  const CupertinoContextMenuDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        // automaticallyImplyLeading: false,
        middle: Text(
          'Context Menu',
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Dismiss',
                    ),
                  ),
                ],
                child: const FlutterLogo(size: 200),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Tap and hold the Flutter logo to see the context menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
