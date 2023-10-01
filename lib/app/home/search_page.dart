import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String numbers;

  const SecondPage({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    List<String> numberList = numbers.split(',');
    List<int> intList = numberList.map((e) => int.parse(e.trim())).toList();

    bool allEven = intList.every((e) => e % 2 == 0);
    List<int> filteredList = intList.where((e) => e % 2 == (allEven ? 1 : 0)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wyfiltrowane liczby'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wyfiltrowane liczby to: ${filteredList.join(', ')}',
            ),
          ],
        ),
      ),
    );
  }
}
