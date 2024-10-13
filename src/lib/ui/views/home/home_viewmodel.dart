
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
	List<Map<String, dynamic>> _sp500MockData = [
		{'symbol': 'AAPL', 'price': 150.00, 'change': 1.5},
		{'symbol': 'MSFT', 'price': 250.00, 'change': -0.5},
		{'symbol': 'GOOGL', 'price': 2800.00, 'change': 2.0},
	];

	List<Map<String, dynamic>> get sp500Metrics => _sp500MockData;

	Future<void> fetchSP500Metrics() async {
		// Simulate a delay for fetching data
		await Future.delayed(Duration(seconds: 1));
		// Here you might update the mock data if needed
		rebuildUi();
	}
}
