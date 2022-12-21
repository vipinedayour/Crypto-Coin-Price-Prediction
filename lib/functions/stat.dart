import 'dart:math';

double findMin(List<double> numbers) {
  return numbers.reduce(min);
}

double findMax(List<double> numbers) {
  return numbers.reduce(max);
}
