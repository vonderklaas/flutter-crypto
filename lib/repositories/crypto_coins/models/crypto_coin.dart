import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin(
      {required this.name, required this.iconUrl, required this.priceInUSD});

  final String name;
  final String iconUrl;
  final double priceInUSD;

  @override
  List<Object?> get props => [name, priceInUSD, iconUrl];
}
