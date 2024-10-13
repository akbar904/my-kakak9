
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void fetchSP500Metrics() {
		// Mock data for S&P 500 metrics
		_sp500Metrics = [
			{'name': 'Apple', 'price': 150.00, 'change': '+1.5%'},
			{'name': 'Microsoft', 'price': 280.00, 'change': '-0.5%'},
			{'name': 'Tesla', 'price': 700.00, 'change': '+2.0%'},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Steve Rocks!',
			description: 'Check out the latest S&P 500 metrics!',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Update',
			description: 'Here are the latest metrics.',
		);
	}
}
