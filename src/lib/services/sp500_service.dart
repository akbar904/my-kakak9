
import 'dart:async';

class SP500Service {
	Future<Map<String, dynamic>> getMockData() async {
		// Simulate a network delay
		await Future.delayed(Duration(seconds: 1));

		// Return mock data for S&P 500 metrics
		return {
			'symbol': 'SPX',
			'price': 4300.34,
			'change': -12.45,
			'percentChange': -0.29,
			'volume': 3200000,
		};
	}
}
