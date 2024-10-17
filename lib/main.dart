import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stox/model/stocks_model.dart';
import 'package:stox/provider/watchlist_provider.dart';
import 'package:stox/views/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StockModelAdapter());
  await Hive.openBox<StockModel>('watchlist');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WatchlistProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
