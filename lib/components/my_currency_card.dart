import 'package:flutter/material.dart';

class MyCurrencyCard extends StatelessWidget {
  final String currencyName;
  final String currencyCode;
  final Color currencyFlag; // change to string to get image file
  final double toUsdRate; // values from API
  final double convertedValue;
  final double inputValue;
  final VoidCallback containerTapped;
  final VoidCallback flagTapped; // to change currency
  final bool currencyCardIsActive;

  const MyCurrencyCard({
    super.key,
    required this.currencyName,
    required this.currencyCode,
    required this.currencyFlag,
    required this.toUsdRate,
    required this.convertedValue,
    required this.inputValue,
    required this.flagTapped,
    required this.currencyCardIsActive,
    required this.containerTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: GestureDetector(
        onTap: containerTapped,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                // CircleAvatar to display currency flag
                child: GestureDetector(
                  onTap: flagTapped,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: currencyFlag,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Currency Name
                        Text(
                          currencyName,
                          style: const TextStyle(fontSize: 16),
                        ),

                        // Currency Code
                        Text(
                          currencyCode,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // currency output display - result of conversion
                    Container(
                      child: currencyCardIsActive
                          ? const TextField(
                              style: TextStyle(fontSize: 40),
                            ) // needs to be TextField
                          : Text(
                              convertedValue.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ), // display converted value
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
