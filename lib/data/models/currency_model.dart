
class CurrencyModel {
  final String ccy;
  final String rate;

  CurrencyModel({
    required this.ccy,
    required this.rate,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      ccy: json['Ccy'],
      rate: json['Rate'],
    );
  }
}

