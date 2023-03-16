import 'package:flutter/material.dart';

class MyInputChip extends StatefulWidget {
  const MyInputChip({super.key});

  @override
  State<MyInputChip> createState() => _MyInputChipState();
}

class _MyInputChipState extends State<MyInputChip> {
  bool _isvisible = true;
  _showChip() {
    setState(() {
      _isvisible = true;
    });
  }

  _hideChip() {
    setState(() {
      _isvisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: _isvisible,
            child: InputChip(
              onPressed: () {
                print('button is pressed');
              },
              onDeleted: _hideChip,
              avatar: const Icon(
                Icons.directions_bike,
                size: 20,
                color: Colors.black54,
              ),
              deleteIconColor: Colors.black54,
              label: const Text('Biking'),
            ),
          ),
          Visibility(
            visible: !_isvisible,
            child: OutlinedButton(
              onPressed: _showChip,
              child: const Text('Show'),
            ),
          ),
        ],
      ),
    );
  }
}
