import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/app/home/cubit/number_cubit_cubit.dart';
import 'package:task_app/app/home/search_page.dart';

class FirstPage extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberCubit, NumberCubitState>(
      listener: (context, state) {
        if (state is NumberCubitResult) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(result: state.result),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Wyszukaj wartość odstającą')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(labelText: 'Wprowadź liczby'),
                ),
                if (state is NumberCubitError)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<NumberCubit>(context).clearError();
                    BlocProvider.of<NumberCubit>(context)
                        .findOutlier(controller.text);
                  },
                  child: const Text('Wyszukaj'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
