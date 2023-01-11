String roundIt(var value) {
  try {
    return double.parse(value.toString()).toStringAsFixed(2);
  } catch (e) {
    return '0.00';
  }
}
