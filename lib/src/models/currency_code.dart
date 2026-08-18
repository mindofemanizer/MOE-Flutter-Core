/// ISO 4217 currency code used by commerce-related packages.
// ignore_for_file: constant_identifier_names
enum CurrencyCode {
  IDR('IDR', 'Rp '),
  USD('USD', r'$'),
  EUR('EUR', '€');

  const CurrencyCode(this.code, this.symbol);

  final String code;
  final String symbol;
}
