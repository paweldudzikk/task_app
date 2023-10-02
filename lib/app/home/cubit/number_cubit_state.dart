part of 'number_cubit.dart';

@immutable
class NumberCubitState {}

class NumberCubitError extends NumberCubitState {
  final String error;
  NumberCubitError(this.error);
}

class NumberCubitResult extends NumberCubitState {
  final int result;
  NumberCubitResult(this.result);
}