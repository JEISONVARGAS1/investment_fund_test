double handledCalculatePercent(double initialValue, double finalValue) {
  if (initialValue == 0) return 0;

  final result = ((finalValue - initialValue) / initialValue) * 100;
  return double.parse(result.toStringAsFixed(2));
}
 