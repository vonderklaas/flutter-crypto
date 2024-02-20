import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto List'),
  '/coin': (context) => const CryptoCoinScreen()
};
