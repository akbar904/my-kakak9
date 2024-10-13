
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [
		{'symbol': 'AAPL', 'price': 150.0, 'change': 1.2},
		{'symbol': 'GOOGL', 'price': 2800.0, 'change': -0.5},
		{'symbol': 'AMZN', 'price': 3400.0, 'change': 2.3},
	];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void fetchSP500Metrics() {
		// Simulating data fetch and notifying listeners.
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Displaying mock data for S&P 500 metrics.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Update',
			description: 'Latest mock data for S&P 500 metrics.',
		);
	}
}
