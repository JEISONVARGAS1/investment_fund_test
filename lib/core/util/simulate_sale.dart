import 'dart:math';

double simulateSell(double amount) {
  final random = Random();

  bool isProfit = random.nextDouble() < 0.5;

  double percentage;

  if (isProfit) {
    percentage = random.nextDouble() * 0.5;
  } else {
    percentage = -(random.nextDouble() * 0.5);
  }

  return amount + (amount * percentage);
}
