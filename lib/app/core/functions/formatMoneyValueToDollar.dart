import 'package:intl/intl.dart';

String formatMoneyValueToDolar(int value) {
  NumberFormat currencyFormat = new NumberFormat("#,##0", "en_US");
  return currencyFormat.format(double.parse(value.toString()));
}
