import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../model/stocks_model.dart';

class StockService {
  final String _apiKey = apiKey;

  Future<List<StockModel>> searchStocks(String query) async {
    final url = '$baseUrl?function=SYMBOL_SEARCH&keywords=$query&apikey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['bestMatches'];
      if (data != null && data.isNotEmpty) {
        log('API Data: $data'); // Debugging
        return data.map<StockModel>((json) => StockModel.fromJson(json)).toList();
      }
    }
    return [];
  }
}
