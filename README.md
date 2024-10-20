# Stox App

## Overview

The Stox App is a Flutter-based application that allows users to search for stocks, add them to their watchlist, and view current stock prices. It leverages the Alphavantage API for stock data and uses Hive for local storage, providing a seamless user experience with caching and efficient API calls.

## Features

- **Search Stocks**: Quickly find stocks using a search bar with debouncing for efficient API requests.
- **Watchlist Management**: Add or remove stocks from your personal watchlist.
- **Real-Time Updates**: View current stock prices fetched from the Alphavantage API.
- **Local Caching**: Store stock data locally using Hive to minimize API calls and improve performance.

## Tech Stack

- **Flutter**: UI framework for building the app.
- **Dart**: Programming language used in the app.
- **Provider**: State management solution for Flutter.
- **Hive**: Lightweight and fast NoSQL database for local storage.
- **Alphavantage API**: Source for stock market data.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/stock_watchlist_app.git
   cd stock_watchlist_app
