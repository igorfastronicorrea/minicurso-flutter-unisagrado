import 'package:cryptoapp/services/api_repository.dart';
import 'package:flutter/material.dart';

class CryptoPrice extends StatefulWidget {
  const CryptoPrice({super.key});

  @override
  State<CryptoPrice> createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  String btcValue = '';

  String formatTwoDecimalPlaces(price) {
    String formattedPrice = '';
    double priceDouble = double.tryParse(price) ?? 0.0;
    formattedPrice = priceDouble.toStringAsFixed(2);
    return formattedPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                "USD $btcValue",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ApiRepository().fetchData().then((value) {
                  setState(() {
                    btcValue = formatTwoDecimalPlaces(value.priceUsd);
                  });
                }).catchError((error) {
                  print("error");
                });
              },
              child: const Text('Carregar valor do BTC'),
            ),
          ],
        ),
      ),
    );
  }
}
