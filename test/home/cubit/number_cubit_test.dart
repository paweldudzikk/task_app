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

  test('Initial state is NumberInitial', () {
    expect(sut.state, isA<NumberInitial>());
  });

  test('if the string of numbers is <3 findOutlier emits a NumberCubitError',
      () {
    sut.findOutlier('1,2').then((_) {
      expect(sut.state, isA<NumberCubitError>());
    });
  });

  test(
      'if findOutlier finds a letter instead of a number, it emits NumberCubitError',
      () {
    sut.findOutlier('1,2,a').then((_) {
      expect(sut.state, isA<NumberCubitError>());
    });
  });

  test('string of odd numbers returns an odd number', () async {
    await sut.findOutlier('1,3,5,6');
    expect(sut.state, isA<NumberCubitResult>());
    expect((sut.state as NumberCubitResult).result, 6);
  });

  test('string of even numbers returns an odd number', () {
    sut.findOutlier('2,4,5,6').then((_) {
      expect(sut.state, isA<NumberCubitResult>());
      expect((sut.state as NumberCubitResult).result, 5);
    });
  });

  test('clearError resets the state', () {
    sut.findOutlier('1,2,3,4');
    sut.clearError();
    expect(sut.state, isA<NumberInitial>());
  });
}
