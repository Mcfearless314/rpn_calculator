import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/BLL/calc.dart';


void main() {
  test('Testing addition', () {
    final stack = [5, 5];
    AddCommand().apply(stack);
    expect(stack, [10]);
  });

  test('Testing subtraction', () {
    final stack = [10, 5];
    SubCommand().apply(stack);
    expect(stack, [5]);
  });

  test('Testing multiplication', () {
    final stack = [10, 5];
    MultiCommand().apply(stack);
    expect(stack, [50]);
  });

  test('Testing division', () {
    final stack = [10, 5];
    DivCommand().apply(stack);
    expect(stack, [2]);
  });

  test('Testing SquareRoot', () {
    final List<double>  stack = [25];
    SqrtCommand().apply(stack);
    expect(stack, [5.0]);
  });

  test('Testing Power of', () {
    final stack = [5,2];
    PowCommand().apply(stack);
    expect(stack, [25.0]);
  });
}
