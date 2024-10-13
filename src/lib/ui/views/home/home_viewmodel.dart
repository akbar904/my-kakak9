
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/services/sp500_service.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();
	final _sp500Service = locator<SP500Service>();

	Map<String, dynamic> _sp500Metrics = {};
	Map<String, dynamic> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		setBusy(true);
		_sp500Metrics = await _sp500Service.getMockData();
		setBusy(false);
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Here are some mock metrics: $_sp500Metrics',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Notice',
			description: 'Mock data fetched successfully.',
		);
	}
}
