part of 'number_cubit.dart';

@immutable
sealed class NumberState {}

final class NumberInitial extends NumberState {}

final class NumberCubitError extends NumberInitial {
  final String error;
  NumberCubitError(this.error);
}

final class NumberCubitResult extends NumberInitial {
  final int result;
  NumberCubitResult(this.result);
}
