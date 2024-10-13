
import 'package:flutter/foundation.dart';

class SP500Metric {
	final String companyName;
	final double stockPrice;
	final double priceChange;
	final double percentChange;

	SP500Metric({
		required this.companyName,
		required this.stockPrice,
		required this.priceChange,
		required this.percentChange,
	});

	factory SP500Metric.fromJson(Map<String, dynamic> json) {
		return SP500Metric(
			companyName: json['companyName'] as String,
			stockPrice: json['stockPrice'] as double,
			priceChange: json['priceChange'] as double,
			percentChange: json['percentChange'] as double,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'companyName': companyName,
			'stockPrice': stockPrice,
			'priceChange': priceChange,
			'percentChange': percentChange,
		};
	}
}
