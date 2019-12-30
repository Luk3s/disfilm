String round(double number, {int fractionDigits = 2}) {
  assert(number != null && fractionDigits != null);

  return number.toStringAsFixed(fractionDigits);
}
