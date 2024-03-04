import 'dart:math';

abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a + b);
  }
}

class SubCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a - b);
  }
}

class MultiCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a * b);
  }
}

class DivCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = stack.removeLast();
    stack.add(a / b);
  }
}

class PowCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = stack.removeLast();
    num c = pow(a, b);
    stack.add(c);
  }
}

class SqrtCommand implements Command {
  @override
  void apply(List<num> stack) {
    num a = stack.removeLast();
    num b = sqrt(a);
    stack.add(b);
  }
}
