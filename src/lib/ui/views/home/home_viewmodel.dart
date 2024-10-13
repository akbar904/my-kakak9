
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
			{'company': 'Company A', 'price': 3500, 'change': '+1.2%'},
			{'company': 'Company B', 'price': 4200, 'change': '-0.5%'},
			{'company': 'Company C', 'price': 3100, 'change': '+0.8%'},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Info',
			description: 'Displaying mock data for S&P 500 metrics.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Metrics',
			description: 'Here are some mock S&P 500 metrics displayed.',
		);
	}
}
