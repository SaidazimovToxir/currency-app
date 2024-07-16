import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> currency;

  const HomeScreen({super.key, required this.currency});

  @override
  State<HomeScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<HomeScreen> {
  final _amountController = TextEditingController();
  double? _convertedAmount;

  void _convertCurrency() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null) {
      setState(() {
        _convertedAmount = amount * double.parse(widget.currency['Rate']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert ${widget.currency['CcyNm_UZ']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter amount in UZS',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _convertCurrency,
                child: const Text('Convert'),
              ),
            ),
            const SizedBox(height: 20),
            if (_convertedAmount != null)
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: ValueKey<double>(_convertedAmount!),
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Converted Amount: $_convertedAmount ${widget.currency['Ccy']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
