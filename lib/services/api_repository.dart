import 'dart:convert';

import 'package:cryptoapp/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<CoinData> fetchData() async {
    String apiUrl = 'https://api.coincap.io/v2/assets/bitcoin2';
    var response = await http.get(Uri.parse(apiUrl));

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
}
