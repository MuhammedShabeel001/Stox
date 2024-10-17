import 'package:flutter/material.dart';

class StockInfoContainer extends StatelessWidget {
  final String stockName;
  final String stockType;

  const StockInfoContainer({
    Key? key,
    required this.stockName,
    required this.stockType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stockName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Type: $stockType',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
