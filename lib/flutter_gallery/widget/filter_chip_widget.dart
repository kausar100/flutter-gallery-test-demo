import 'package:flutter/material.dart';

class MyFilterChip extends StatefulWidget {
  const MyFilterChip({super.key});

  @override
  MyFilterChipState createState() => MyFilterChipState();
}

class MyFilterChipState extends State<MyFilterChip> with RestorationMixin {
  final RestorableBool isSelectedElevator = RestorableBool(false);
  final RestorableBool isSelectedWasher = RestorableBool(false);
  final RestorableBool isSelectedFireplace = RestorableBool(false);

  @override
  String get restorationId => 'filter_chip_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(isSelectedElevator, 'selected_elevator');
    registerForRestoration(isSelectedWasher, 'selected_washer');
    registerForRestoration(isSelectedFireplace, 'selected_fireplace');
  }

  @override
  void dispose() {
    isSelectedElevator.dispose();
    isSelectedWasher.dispose();
    isSelectedFireplace.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8.0,
            children: [
              FilterChip(
                label: const Text('Elevator'),
                selected: isSelectedElevator.value,
                onSelected: (value) {
                  setState(() {
                    isSelectedElevator.value = !isSelectedElevator.value;
                  });
                },
              ),
              FilterChip(
                label: const Text('Washer'),
                selected: isSelectedWasher.value,
                onSelected: (value) {
                  setState(() {
                    isSelectedWasher.value = !isSelectedWasher.value;
                  });
                },
              ),
              FilterChip(
                label: const Text('Fireplace'),
                selected: isSelectedFireplace.value,
                onSelected: (value) {
                  setState(() {
                    isSelectedFireplace.value = !isSelectedFireplace.value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
