
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void fetchSP500Metrics() {
		// Mock data for S&P 500 metrics
		_sp500Metrics = [
			{'symbol': 'AAPL', 'price': 150.55, 'change': 1.25},
			{'symbol': 'GOOGL', 'price': 2800.10, 'change': -15.30},
			{'symbol': 'AMZN', 'price': 3400.50, 'change': 5.45},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Metrics Info',
			description: 'Displaying mock metrics for S&P 500 companies.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'Metrics Notice',
			description: 'S&P 500 metrics are fetched successfully.',
		);
	}
}
