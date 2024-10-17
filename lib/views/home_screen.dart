// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../provider/stock_provider.dart';
// import '../provider/search_provider.dart';
// import '../provider/watchlist_provider.dart';
// import '../widgets/custom_appbar.dart';

// class HomeScreen extends StatelessWidget {
//   final TextEditingController controller = TextEditingController();

//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(180),
//         child: SappBar(
//           searchController: controller,
//           onSearch: (query) {
//             Provider.of<SearchProvider>(context, listen: false)
//                 .setSearchQuery(query);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Consumer2<StockProvider, SearchProvider>(
//           builder: (context, stockProvider, searchProvider, child) {
//             final searchQuery = searchProvider.searchQuery;
//             final stocks = stockProvider.stocks
//                 .where((stock) =>
//                     stock.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
//                     stock.symbol.toLowerCase().contains(searchQuery.toLowerCase()))
//                 .toList();

//             if (stocks.isEmpty) {
//               return const Center(
//                 child: Text('No results found.'),
//               );
//             }

//             return ListView.builder(
//               itemCount: stocks.length,
//               itemBuilder: (context, index) {
//                 final stock = stocks[index];
//                 return Column(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       child: Row(
//                         children: [
//                           Flexible(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               height: 80,
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 18,
//                                 horizontal: 20,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         '${stock.name} (${stock.symbol})',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Type: ${stock.type}',
//                                         style: TextStyle(
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             height: 80,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Center(
//                               child: IconButton(
//                                 onPressed: () {
//                                   Provider.of<WatchlistProvider>(context,
//                                           listen: false)
//                                       .addStock(stock);
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text(
//                                         '${stock.name} added to Watchlist',
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 icon: const FaIcon(
//                                   FontAwesomeIcons.plus,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stox/provider/stock_provider.dart';
import 'package:stox/widgets/loader_animation.dart';
// import '../providers/stock_provider.dart';
// import '../providers/watchlist_provider.dart';
import '../provider/watchlist_provider.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: SappBar(
          searchController: controller,
          onSearch: (query) {
            Provider.of<StockProvider>(context, listen: false).searchStocks(query);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Consumer<StockProvider>(
          builder: (context, provider, child) {
            final stocks = provider.stocks;

            if (stocks.isEmpty) {
              return LoaderAnimation(animation: 'assets/Animation1.json');
            }

            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ListView.builder(
                itemCount: stocks.length,
                itemBuilder: (context, index) {
                  final stock = stocks[index];
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 80,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 320, 
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,  
                                            stock.name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          'Type: ${stock.type}',
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<WatchlistProvider>(context,
                                            listen: false)
                                        .addStock(stock);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '${stock.name} added to Watchlist'),
                                      ),
                                    );
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
