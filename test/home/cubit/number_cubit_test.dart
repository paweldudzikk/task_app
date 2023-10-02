import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/app/home/cubit/number_cubit.dart';

void main() {
  late NumberCubit sut;

  setUp(() {
    sut = NumberCubit();
  });

  tearDown(() {
    sut.close();
  });

  test('Initial state is NumberCubitState', () {
    expect(sut.state, isA<NumberCubitState>());
  });

  test('findOutlier with less than 3 elements emits NumberCubitError', () {
    sut.findOutlier('1,2').then((_) {
      expect(sut.state, isA<NumberCubitError>());
    });
  });

  test('findOutlier with non-numeric input emits NumberCubitError', () {
    sut.findOutlier('1,2,a').then((_) {
      expect(sut.state, isA<NumberCubitError>());
    });
  });

  test('findOutlier with even outlier returns correct result', () {
    sut.findOutlier('1,2,3,4').then((_) {
      expect(sut.state, isA<NumberCubitResult>());
      expect((sut.state as NumberCubitResult).result, 1);
    });
  });

  test('findOutlier with odd outlier returns correct result', () {
    sut.findOutlier('2,4,5,6').then((_) {
      expect(sut.state, isA<NumberCubitResult>());
      expect((sut.state as NumberCubitResult).result, 5); 
    });
  });

  test('clearError resets the state', () {
    sut.findOutlier('1,2,3,4');
    sut.clearError();
    expect(sut.state, isA<NumberCubitState>());
  });
}
