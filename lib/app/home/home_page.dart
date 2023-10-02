import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/app/home/cubit/number_cubit.dart';
import 'package:task_app/app/home/search_page.dart';

class HomePage extends StatelessWidget {
  final controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumberCubit, NumberState>(
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
                    context.read<NumberCubit>().clearError();
                    context.read<NumberCubit>().findOutlier(controller.text);
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
