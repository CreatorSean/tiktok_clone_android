import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicksInt = 0;

  void _increase() {
    setState(() {
      _clicksInt = _clicksInt + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$_clicksInt",
            style: const TextStyle(
              fontSize: Sizes.size48,
            ),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text('+'),
          )
        ],
      ),
    );
  }
}
