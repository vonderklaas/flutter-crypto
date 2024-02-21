import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID&tsyms=USD');
    final data = response.data as Map<String, dynamic>;

    List<CryptoCoin> cryptoCurrenciesList = [];

    if (data.containsKey('RAW')) {
      data['RAW'].forEach((key, value) {
        final priceInUSD = value['USD']['PRICE'];
        final cryptoIconUrl = value['USD']['IMAGEURL'];
        final cryptoCoin = CryptoCoin(
            name: key,
            priceInUSD: priceInUSD,
            iconUrl: 'https://www.cryptocompare.com/$cryptoIconUrl');
        cryptoCurrenciesList.add(cryptoCoin);
      });
    }

    return cryptoCurrenciesList;
  }
}
