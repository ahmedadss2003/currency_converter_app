import 'package:currency_converter/features/home/presentation/views/widgets/custom_drop_down_menue.dart';
import 'package:flutter/material.dart';

class CurrencyRow extends StatelessWidget {
  const CurrencyRow({
    super.key,
    required this.currencies,
    required this.fromCurrency,
    required this.tomCurrency,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onSwap,
  });

  final List<String> currencies;
  final String fromCurrency;
  final String tomCurrency;
  final Function(String?) onFromChanged;
  final Function(String?) onToChanged;
  final VoidCallback onSwap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        currencies.isEmpty
            ? const CircularProgressIndicator()
            : CustomFromDropButtonMenue(
                onChanged: onFromChanged,
                value: fromCurrency,
                currencyList: currencies,
              ),
        const Spacer(),
        IconButton(
          onPressed: onSwap,
          icon: const Icon(Icons.swap_horiz),
        ),
        const Spacer(),
        currencies.isEmpty
            ? const CircularProgressIndicator()
            : CustomFromDropButtonMenue(
                onChanged: onToChanged,
                value: tomCurrency,
                currencyList: currencies,
              ),
      ],
    );
  }
}
