import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_cubit_state.dart';

class NumberCubit extends Cubit<NumberCubitState> {
  NumberCubit() : super(NumberCubitState());

  Future<void> findOutlier(String inputString) async {
    final input = inputString.split(',').map((e) => int.tryParse(e)).toList();

    if (input.length < 3) {
      emit(NumberCubitError("Lista musi zawierać co najmniej 3 elementy"));
      return;
    }

    if (input.any((e) => e == null)) {
      emit(NumberCubitError("Wprowadź tylko liczby"));
      return;
    }

    final numbers = input.cast<int>();
    final evenCount = numbers.where((n) => n % 2 == 0).length;
    final result = evenCount == 1
        ? numbers.firstWhere((n) => n % 2 == 0)
        : numbers.firstWhere((n) => n % 2 != 0);

    emit(NumberCubitResult(result));
  }
 Future<void> clearError() async {
    emit(NumberCubitState());
  }
}
