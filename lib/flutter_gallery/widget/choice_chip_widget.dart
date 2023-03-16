import 'package:flutter/material.dart';

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({super.key});

  @override
  MyChoiceChipState createState() => MyChoiceChipState();
}

class MyChoiceChipState extends State<MyChoiceChip>
    with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);

  @override
  String get restorationId => 'choice_chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'choice_chip');
  }

  @override
  void dispose() {
    _indexSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Wrap(
          children: [
            ChoiceChip(
              label: const Text('Small'),
              selected: _indexSelected.value == 0,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 0 : -1;
                });
              },
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Medium'),
              selected: _indexSelected.value == 1,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 1 : -1;
                });
              },
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Large'),
              selected: _indexSelected.value == 2,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 2 : -1;
                });
              },
            ),
          ],
        ),
      ]),
    );
  }
}
