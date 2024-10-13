
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/services/financial_service.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();
	final _financialService = locator<FinancialService>();

	Map<String, dynamic>? sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		setBusy(true);
		try {
			sp500Metrics = await _financialService.getSP500Metrics();
		} catch (e) {
			_dialogService.showCustomDialog(
				variant: DialogType.error,
				title: 'Error',
				description: 'Failed to fetch S&P 500 metrics: $e',
			);
		} finally {
			setBusy(false);
		}
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Steve Rocks!',
			description: 'Check out the S&P 500 metrics!',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Metrics',
			description: sp500Metrics != null ? sp500Metrics.toString() : 'No data available',
		);
	}
}
