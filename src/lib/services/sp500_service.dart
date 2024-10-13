
import 'dart:async';

class SP500Service {
	Future<Map<String, dynamic>> getMockData() async {
		// Mock data representing S&P 500 metrics
		return Future.delayed(Duration(seconds: 1), () {
			return {
				'indexName': 'S&P 500',
				'currentValue': 4500.00,
				'dailyChange': -0.25,
				'percentChange': -0.0056,
			};
		});
	}
}
