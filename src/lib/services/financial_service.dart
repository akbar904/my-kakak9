
import 'dart:convert';
import 'package:http/http.dart' as http;

class FinancialService {
	Future<Map<String, dynamic>> getSP500Metrics() async {
		final response = await http.get(Uri.parse('https://api.example.com/sp500metrics'));

		if (response.statusCode == 200) {
			return jsonDecode(response.body) as Map<String, dynamic>;
		} else {
			throw Exception('Failed to load S&P 500 metrics');
		}
	}
}
