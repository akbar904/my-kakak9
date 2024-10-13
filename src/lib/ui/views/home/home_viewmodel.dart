
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/services/financial_service.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();
	final _financialService = locator<FinancialService>();

	Map<String, dynamic>? _sp500Metrics;

	Map<String, dynamic>? get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		setBusy(true);
		try {
			_sp500Metrics = await _financialService.getSP500Metrics();
		} catch (e) {
			// Handle error
		} finally {
			setBusy(false);
		}
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Here are some metrics from the S&P 500: $_sp500Metrics',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Update',
			description: 'Latest S&P 500 metrics have been fetched.',
		);
	}
}
