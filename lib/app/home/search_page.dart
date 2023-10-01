import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int result;

  const ResultScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wynik')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$result',
              style: const TextStyle(fontSize: 100),
            ),
          ),
        ],
      ),
    );
  }
}
