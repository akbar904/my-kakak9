
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/services/financial_service.dart';

class HomeViewModel extends BaseViewModel {
	final _financialService = locator<FinancialService>();

	Map<String, dynamic>? _sp500Metrics;
	Map<String, dynamic>? get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		setBusy(true);
		try {
			_sp500Metrics = await _financialService.getSP500Metrics();
		} catch (error) {
			// Handle error accordingly
		} finally {
			setBusy(false);
			rebuildUi();
		}
	}
}
