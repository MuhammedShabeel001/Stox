import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: 15,
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
                        child: Row(
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
                              icon: const FaIcon(FontAwesomeIcons.angleDown),

                              // Icon(
                              // provider.isExpanded(index) ? Icons.expand_less : Icons.expand_more,
                              // color: Theme.of(context).primaryColor,
                              // ),
                              onPressed: () {
                                // provider.toggleExpansion(index); // Use Provider to manage expansion
                              },
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
}
