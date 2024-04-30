import 'package:cs_transaction_tracker/components/my_currency_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of currencies
  List userCurrencyList = [
    // [currencyName, currencyCode, currencyFlag(img), inputValue, toUsdRate, convertedValue, activeCurrencyCard ]
    ['United States Dollar', 'USD', Colors.red, 1.00, 1.00, 30.00, false],
    ['Cambodian Riel', 'KHR', Colors.purple, 1.00, 4100.00, 4100.00, false],
    ['European Euro', 'EUR', Colors.blue.shade900, 1.00, 1.25, 1.25, false],
    ['Thailand Baht', 'THB', Colors.blue.shade600, 36.00, 36.00, 1.00, false],
  ];

  void changeCurrency(int index) {}

  void changeCurrencyStatus(int index) {
    setState(() {
      // reset the status to false - display Text (convertedValue)
      for (int i = 0; i < userCurrencyList.length; i++) {
        userCurrencyList[i][6] = false;
      }
      // set specific currency status to true - display TextField (inputValue)
      userCurrencyList[index][6] = !userCurrencyList[index][6];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('myCurrency Conversion'),
      ),
      body: ListView.builder(
        itemCount: userCurrencyList.length,
        itemBuilder: (context, index) {
          return MyCurrencyCard(
            currencyName: userCurrencyList[index][0],
            currencyCode: userCurrencyList[index][1],
            currencyFlag: userCurrencyList[index][2],
            convertedValue: userCurrencyList[index][3],
            inputValue: userCurrencyList[index][4],
            flagTapped: () {},
            currencyCardIsActive: userCurrencyList[index][6],
            containerTapped: () {
              // userCurrencyList[index][6] = false;

              changeCurrencyStatus(index);
            },
            toUsdRate: 0.00,
          );
        },
      ),
    );
  }
}
