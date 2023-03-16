import 'package:flutter/material.dart';

class MyActionChip extends StatelessWidget {
  const MyActionChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        onPressed: () {},
        avatar: const Icon(
          Icons.brightness_5,
          color: Colors.black54,
        ),
        label: const Text('Turn on Lights'),
      ),
    );
  }
}

