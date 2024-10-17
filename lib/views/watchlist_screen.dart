import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stox/provider/watchlist_provider.dart';

class WatchlistScreen extends StatelessWidget {
   WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WatchlistProvider>(context);
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'watchlist',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        // height: 40,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      // '${stock.name} (${stock.symbol})',
                                      'Stock name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      // 'Type: ${stock.type}',
                                      'Type: stock.type',
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon:
                                      // const FaIcon(FontAwesomeIcons.angleDown),

                                  Icon(
                                  provider.isExpanded(index) ? Icons.expand_less : Icons.expand_more,
                                  color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    provider.toggleExpansion(index); // Use Provider to manage expansion
                                  },
                                ),
                              ],
                            ),
                            AnimatedCrossFade(
                              firstChild: Container(),
                              secondChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  _buildDetailRow(
                                      'Region', 'region', Icons.public),
                                  _buildDetailRow('Market Open',
                                      'stock.marketOpen', Icons.access_time),
                                  _buildDetailRow('Market Close',
                                      'stock.marketClose', Icons.access_time),
                                  _buildDetailRow(
                                      'Timezone', 'stock.timezone', Icons.timer),
                                  _buildDetailRow('Currency', 'stock.currency',
                                      Icons.monetization_on),
                                  _buildDetailRow('Match Score',
                                      'stock.matchScore'.toString(), Icons.star),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          // provider.removeStock(stock.symbol);
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(SnackBar(
                                          //   content: Text(
                                          //       'stock.name removed from Watchlist'),
                                          // ));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              crossFadeState: provider.isExpanded(index)
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 300),
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
            ),
          ),
        ));
  }
  Widget _buildDetailRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          Text(value),
        ],
      ),
    );
  }
}
