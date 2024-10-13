
import 'dart:async';

class SP500Service {
	Future<Map<String, dynamic>> getMockData() async {
		// Simulate a network call with a delay
		await Future.delayed(Duration(seconds: 1));

		// Return mock S&P 500 metrics data
		return {
			"S&P 500": {
				"index": 4500,
				"change": 15,
				"percentageChange": 0.33
			}
		};
	}
}
