import 'dart:math';

String handledPositivityMakeMoney() {
  double probabilidad = _handledPositivityMakeMoney();
  return "${(probabilidad * 100).toStringAsFixed(2)}%";
}

double _handledPositivityMakeMoney() {
  final random = Random();
  double valor = random.nextDouble() - 0.5;

  return valor;
}
