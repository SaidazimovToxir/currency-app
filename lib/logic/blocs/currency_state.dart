abstract class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final List<dynamic> currencies;

  CurrencyLoaded({required this.currencies});
}

final class CurrencyError extends CurrencyState {
  final String errorMsg;

  CurrencyError(this.errorMsg);
}
