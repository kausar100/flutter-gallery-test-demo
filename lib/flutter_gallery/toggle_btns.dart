import 'package:flutter/material.dart';

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({super.key});

  @override
  MyToggleButtonState createState() => MyToggleButtonState();
}

class MyToggleButtonState extends State<MyToggleButton> with RestorationMixin {
  final isSelected = [
    RestorableBool(false),
    RestorableBool(true),
    RestorableBool(false),
  ];

  @override
  String get restorationId => 'toggle_button_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isSelected[0], 'first_item');
    registerForRestoration(isSelected[1], 'second_item');
    registerForRestoration(isSelected[2], 'third_item');
  }

  @override
  void dispose() {
    for (final restorableBool in isSelected) {
      restorableBool.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Various versions have evolved over the years, sometimes by accident, sometimes on purpose',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    fontWeight: isSelected[0].value ? FontWeight.bold : null,
                    fontStyle: isSelected[1].value ? FontStyle.italic : null,
                    decoration:
                        isSelected[2].value ? TextDecoration.underline : null,
                  )),
            ),
            ToggleButtons(
              onPressed: (index) {
                setState(() {
                  isSelected[index].value = !isSelected[index].value;
                });
              },
              isSelected: isSelected.map((element) => element.value).toList(),
              children: const [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_underline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
