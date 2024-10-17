import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/stocks_model.dart';

class WatchlistProvider with ChangeNotifier {
  final Box<StockModel> _watchlistBox = Hive.box<StockModel>('watchlist');

  List<StockModel> _watchlist = [];
  List<bool> _expandedStates = [];

  List<StockModel> get watchlist => _watchlist;

  bool isExpanded(int index) =>
      _expandedStates.length > index ? _expandedStates[index] : false;

  WatchlistProvider() {
    loadWatchlist();
  }

  void loadWatchlist() {
    _watchlist = _watchlistBox.values.toList();
    _expandedStates = List<bool>.filled(_watchlist.length, false);
    notifyListeners();
  }

  void addStock(StockModel stock) {
    _watchlistBox.put(stock.symbol, stock);
    _watchlist = _watchlistBox.values.toList();
    _expandedStates.add(false);
    notifyListeners();
  }

  // void removeStock(String symbol) {
  //   final index = _watchlist.indexWhere((stock) => stock.symbol == symbol);
  //   if (index != -1) {
  //     _watchlistBox.delete(symbol);
  //     _watchlist.removeAt(index);
  //     _expandedStates.removeAt(index);
  //     notifyListeners();
  //   }
  // }

  void removeStock(String symbol) {
  // Reset all expanded states before removing the stock
  _expandedStates = List<bool>.filled(_watchlist.length, false); 
  
  final index = _watchlist.indexWhere((stock) => stock.symbol == symbol);
  if (index != -1) {
    _watchlistBox.delete(symbol); // Remove from Hive
    _watchlist.removeAt(index); // Remove from the local list
    _expandedStates.removeAt(index); // Remove the expansion state as well
    notifyListeners();
  }
}

  void toggleExpansion(int index) {
    if (index < _expandedStates.length) {
      _expandedStates[index] = !_expandedStates[index];
      notifyListeners();
    }
  }
}
