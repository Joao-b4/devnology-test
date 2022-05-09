import 'package:intl/intl.dart';

String convertDoubleToCurrency(double currency){
  NumberFormat formatter = NumberFormat.simpleCurrency();
  return formatter.format(currency);
}