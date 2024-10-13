
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	// Mock S&P 500 metrics data
	final List<Map<String, dynamic>> _sp500Metrics = [
		{'name': 'Company A', 'price': 150.0, 'change': 1.5},
		{'name': 'Company B', 'price': 250.0, 'change': -0.5},
		{'name': 'Company C', 'price': 350.0, 'change': 2.0},
	];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void fetchSP500Metrics() {
		// In a real application, this method would fetch data from an API or database.
		// For now, we're using mock data defined in _sp500Metrics.
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Displaying mock S&P 500 metrics data',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Notice',
			description: 'This is a mock representation of S&P 500 metrics.',
		);
	}
}
