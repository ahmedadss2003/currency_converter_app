
import 'package:currency_converter/core/utilts/api_services.dart';
import 'package:currency_converter/core/utilts/styles.dart';
import 'package:currency_converter/features/home/presentation/views/widgets/currency_row.dart';
import 'package:currency_converter/features/home/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  double rate = 0.0;
  double total = 0.0;
  String fromCurrency = "USD";
  String tomCurrency = "EUR";
  TextEditingController controller = TextEditingController();
  List<String> currencies = [];

  @override
  void initState() {
    super.initState();
    getRate(); // Fetch the currencies when the widget is initialized
  }
  Future<void> getRate() async {
    final response = await ApiServices().get(endPoint: fromCurrency);
    final rates = response["rates"] as Map<String, dynamic>;
    setState(() {
      currencies = rates.keys.toList();
      rate = response["rates"][tomCurrency];
    });
  }

void swapCurrencies() {
  setState(() {
    String temp = fromCurrency;
    fromCurrency = tomCurrency;
    tomCurrency = temp;
    getRate() ;
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView( 
              child: Column(
                children: [
                  const SizedBox(height: 90),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(110),
                    child: Image.asset(
                      "assets/images/img.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormFieldWidget(
                    labelText: 'Amount',
                    onChanged: (val) {
                    setState(() {
                      try {
                        total=double.parse(val)*rate;
                      } catch (e) {
                        total = 0;  
                      }
                    });
                  },
                  ),
                  const SizedBox(height: 30),
                  CurrencyRow(
                    currencies: currencies,
                    fromCurrency: fromCurrency,
                    tomCurrency: tomCurrency,
                    onFromChanged: (val) {
                      setState(() {
                        fromCurrency = val!;
                        getRate();
                      });
                    },
                    onToChanged: (val) {
                      setState(() {
                        tomCurrency = val!;
                        getRate();
                      });
                    },
                    onSwap: swapCurrencies,
                  ),
                  const SizedBox(height: 30),
                  Text("Rate: $rate", style: AppStyle.textStyle20),
                  const SizedBox(height: 10),
                  Text(total.toStringAsFixed(3), style: AppStyle.textStyle40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




