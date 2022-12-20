String convertIt(String value) {
  double a = double.parse(value);
  if (a > 1000000000000) {
    int result = (a / 1000000000000).round();
    return "$result T";
  } else if (a > 1000000000) {
    int result = (a / 1000000000).round();
    return "$result B";
  } else if (a > 1000000) {
    int result = (a / 1000000).round();
    return "$result M";
  } else if (a > 1000) {
    int result = (a / 1000).round();
    return "$result K";
  } else {
    return value;
  }
}
