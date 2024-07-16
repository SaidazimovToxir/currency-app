import 'package:currency_convertor/services/currency_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyServices currencyService;

  CurrencyBloc({required this.currencyService}) : super(CurrencyInitial()) {
    on<GetCurrency>((event, emit) async {
      emit(CurrencyLoading());
      try {
        final currencies = await currencyService.fetchCurrencies();
        emit(CurrencyLoaded(currencies: currencies));
      } catch (e) {
        emit(CurrencyError(e.toString()));
      }
    });
  }
}
