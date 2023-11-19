class CoinData {
  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String vwap24Hr;
  String explorer;
  int timestamp;

  CoinData({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.explorer,
    required this.timestamp,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) {
    return CoinData(
      id: json['data']['id'],
      rank: json['data']['rank'],
      symbol: json['data']['symbol'],
      name: json['data']['name'],
      supply: json['data']['supply'],
      maxSupply: json['data']['maxSupply'],
      marketCapUsd: json['data']['marketCapUsd'],
      volumeUsd24Hr: json['data']['volumeUsd24Hr'],
      priceUsd: json['data']['priceUsd'],
      changePercent24Hr: json['data']['changePercent24Hr'],
      vwap24Hr: json['data']['vwap24Hr'],
      explorer: json['data']['explorer'],
      timestamp: json['timestamp'],
    );
  }
}
