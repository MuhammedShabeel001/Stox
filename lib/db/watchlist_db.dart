import 'package:hive/hive.dart';
import 'package:stox/model/stocks_model.dart';

class WhishlistDb{
  static const String watchlistBox = 'watchlist';

  Future<void> addStock(StockModel stock) async{
    var box = await Hive.openBox<StockModel>(watchlistBox);
    box.put(stock.symbol, stock);
  }

  Future<List<StockModel>> getWatchlist() async{
    var box = await Hive.openBox<StockModel>(watchlistBox);
    return box.values.toList();
  }

  Future<void> removeStock(String symbol) async{
    var box = await Hive.openBox<StockModel>(watchlistBox);
    box.delete(symbol);
  }
  
}