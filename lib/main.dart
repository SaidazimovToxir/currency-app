import 'package:currency_convertor/logic/blocs/currency_bloc.dart';
import 'package:currency_convertor/logic/blocs/currency_event.dart';
import 'package:currency_convertor/logic/blocs/currency_state.dart';
import 'package:currency_convertor/services/currency_services.dart';
import 'package:currency_convertor/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CurrencyBloc(currencyService: CurrencyServices())
          ..add(GetCurrency()),
        child: const CurrencyListScreen(),
      ),
    );
  }
}

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Currency Converter'),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrencyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrencyLoaded) {
            return ListView.builder(
              itemCount: state.currencies.length,
              itemBuilder: (context, index) {
                final currency = state.currencies[index];
                return ListTile(
                  title: Text(currency['CcyNm_UZ']),
                  subtitle: Text('Rate: ${currency['Rate']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(currency: currency),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is CurrencyError) {
            return const Center(child: Text('Failed to load currencies'));
          }
          return Container();
        },
      ),
    );
  }
}
