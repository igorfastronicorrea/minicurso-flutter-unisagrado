import 'dart:convert';

import 'package:cryptoapp/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CryptoPrice extends StatefulWidget {
  const CryptoPrice({super.key});

  @override
  State<CryptoPrice> createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  String btcValue = '';
  String apiUrl = 'https://api.coincap.io/v2/assets/bitcoin';

  Future<CoinData> fetchData() async {
    var response = await http.get(Uri.parse(apiUrl));
    //var responseMock = await rootBundle.loadString('assets/mock_data.json'); //Deve importar o assets no pubspec.yaml
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final CoinData coinData = CoinData.fromJson(data);

        return coinData;
      } else {
        throw Exception('Falha ao carregar dados da API');
      }
    } catch (error) {
      throw Exception('Falha ao carregar dados da API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.fromLTRB(10, 20, 20, 50),
              child: Text(btcValue),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: ElevatedButton(
              onPressed: () {
                fetchData().then((value) {
                  setState(() {
                    btcValue = value.priceUsd;
                  });
                }).catchError((error) {
                  print("error");
                });
              },
              child: const Text('Carregar valor do BTC'),
            ),
          ),
        ],
      ),
    );
  }
}
