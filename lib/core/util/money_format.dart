import 'package:intl/intl.dart';

String moneyFormat(double value) {
  return '\$${NumberFormat('#,##0.00', 'es').format(value)}';
}
