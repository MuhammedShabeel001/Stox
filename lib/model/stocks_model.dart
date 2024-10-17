import 'package:hive/hive.dart';

part 'stocks_model.g.dart';

@HiveType(typeId: 0)
class StockModel {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String region;

  @HiveField(4)
  final String marketOpen;

  @HiveField(5)
  final String marketClose;

  @HiveField(6)
  final String timezone;

  @HiveField(7)
  final String currency;

  @HiveField(8)
  final String matchScore;

  StockModel({
    required this.symbol,
    required this.name,
    required this.type,
    required this.region,
    required this.marketOpen,
    required this.marketClose,
    required this.timezone,
    required this.currency,
    required this.matchScore,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      symbol: json['1. symbol'] as String,
      name: json['2. name'] as String,
      type: json['3. type'] as String,
      region: json['4. region'] as String,
      marketOpen: json['5. marketOpen'] as String,
      marketClose: json['6. marketClose'] as String,
      timezone: json['7. timezone'] as String,
      currency: json['8. currency'] as String,
      matchScore: json['9. matchScore'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'type': type,
      'region': region,
      'marketOpen': marketOpen,
      'marketClose': marketClose,
      'timezone': timezone,
      'currency': currency,
      'matchScore': matchScore,
    };
  }
}
