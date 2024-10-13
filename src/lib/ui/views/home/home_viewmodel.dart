
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	// Mock data for S&P 500 metrics
	final List<Map<String, dynamic>> _sp500Metrics = [
		{'company': 'Company A', 'price': 3500, 'change': '+0.5%'},
		{'company': 'Company B', 'price': 4200, 'change': '-0.2%'},
		{'company': 'Company C', 'price': 3100, 'change': '+1.2%'},
	];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Metrics from S&P 500 displayed',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'S&P 500 Update',
			description: 'Latest mock data shown on home page',
		);
	}
}
