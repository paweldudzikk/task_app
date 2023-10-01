import 'package:flutter/material.dart';
import 'package:task_app/app/home/search_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtr Liczb'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: numberController,
                decoration: const InputDecoration(
                    hintText: 'Wpisz liczby oddzielone przecinkami'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String numbers = numberController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(numbers: numbers),
                  ),
                );
              },
              child: const Text('Wyszukaj'),
            ),
          ],
        ),
      ),
    );
  }
}
