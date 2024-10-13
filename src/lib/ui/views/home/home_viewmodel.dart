
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	Map<String, dynamic> _sp500Metrics = {};

	Map<String, dynamic> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		// Mock data for S&P 500 metrics
		_sp500Metrics = {
			'index': 4500.00,
			'change': -15.32,
			'percentChange': -0.34,
		};
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Info',
			description: 'The current index is ${_sp500Metrics['index']}',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Notice',
			description: 'The S&P 500 index has changed by ${_sp500Metrics['percentChange']}%',
		);
	}
}
