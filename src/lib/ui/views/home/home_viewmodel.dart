
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];
	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		// Simulating a network call to fetch mock S&P 500 data
		await Future.delayed(Duration(seconds: 1));
		_sp500Metrics = [
			{'company': 'Company A', 'price': 100.0, 'change': 1.5},
			{'company': 'Company B', 'price': 150.0, 'change': -0.5},
			{'company': 'Company C', 'price': 200.0, 'change': 2.0},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Information',
			description: 'This is a mock S&P 500 data display.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Metrics',
			description: 'Displaying S&P 500 metrics using mock data.',
		);
	}
}
