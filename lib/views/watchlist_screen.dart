import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stox/provider/watchlist_provider.dart';
import 'package:stox/widgets/loader_animation.dart';

class WatchlistScreen extends StatelessWidget {
  WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watchlist',
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
        child: Consumer<WatchlistProvider>(
          builder: (context, provider, child) {
            final watchlist = provider.watchlist;

            if (watchlist.isEmpty) {
              return LoaderAnimation(animation: 'assets/Animation3.json');
            }

            return ListView.builder(
              itemCount: watchlist.length,
              itemBuilder: (context, index) {
                final stock = watchlist[index];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      stock.name, // Display the stock name
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Type: ${stock.type}', // Display stock type
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Delete button visible only when stock is not expanded
                                  if (!provider.isExpanded(index))
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        provider.removeStock(stock.symbol);
                                        
                                      },
                                    ),
                                  // Expand button
                                  IconButton(
                                    icon: Icon(
                                      provider.isExpanded(index)
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      provider.toggleExpansion(index);
                                    },
                                  ),
                                ],
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
                                    'Region', stock.region, Icons.public),
                                _buildDetailRow('Market Open', stock.marketOpen,
                                    Icons.access_time),
                                _buildDetailRow('Market Close',
                                    stock.marketClose, Icons.access_time),
                                _buildDetailRow(
                                    'Timezone', stock.timezone, Icons.timer),
                                _buildDetailRow('Currency', stock.currency,
                                    Icons.monetization_on),
                                _buildDetailRow('Match Score',
                                    stock.matchScore.toString(), Icons.star),
                                SizedBox(height: 8),
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
                    const SizedBox(height: 5),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,
                  size: 16, color: const Color.fromARGB(255, 223, 223, 223)),
              SizedBox(width: 4),
              Text(
                title,
                style:
                    TextStyle(color: const Color.fromARGB(255, 221, 221, 221)),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
