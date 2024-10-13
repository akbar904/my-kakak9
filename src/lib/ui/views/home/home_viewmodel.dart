
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/models/sp500_metric.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<SP500Metric> _metrics = [];

	List<SP500Metric> get metrics => _metrics;

	Future<void> fetchSP500Metrics() async {
		// Simulate fetching mock data
		await Future.delayed(Duration(seconds: 1));
		_metrics = [
			SP500Metric(name: 'Metric 1', value: 100.0),
			SP500Metric(name: 'Metric 2', value: 200.0),
			SP500Metric(name: 'Metric 3', value: 300.0),
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Metrics Loaded',
			description: 'S&P 500 metrics have been loaded successfully',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'Notice',
			description: 'Check out the new S&P 500 metrics!',
		);
	}
}
