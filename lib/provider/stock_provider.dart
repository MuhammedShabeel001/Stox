import 'package:flutter/material.dart';

import '../model/stocks_model.dart';
import '../services/stock_services.dart';

class StockProvider with ChangeNotifier {
  List<StockModel> _stock = [];
  final StockService _stockService = StockService();

  List<StockModel> get stocks => _stock;

  Future<void> searchStocks(String query) async {
    if (query.isNotEmpty) {
      _stock = await _stockService.searchStocks(query);
      notifyListeners();
    } else {
      _stock = [];
      notifyListeners();
    }
  }
}
