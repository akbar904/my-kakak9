
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
	const HomeView({super.key});

	@override
	Widget builder(
		BuildContext context,
		HomeViewModel viewModel,
		Widget? child,
	) {
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 25),
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								const Gap(50),
								Column(
									children: [
										const Text(
											'S&P 500 Metrics',
											style: TextStyle(
												fontSize: 35,
												fontWeight: FontWeight.w900,
											),
										),
										const Gap(25),
										if (viewModel.isBusy)
											const CircularProgressIndicator()
										else
											Column(
												children: [
													Text(
														'Index Value: ${viewModel.sp500Metrics['indexValue']}',
														style: const TextStyle(fontSize: 18),
													),
													Text(
														'Change: ${viewModel.sp500Metrics['change']}',
														style: const TextStyle(fontSize: 18),
													),
													Text(
														'Percent Change: ${viewModel.sp500Metrics['percentChange']}%',
														style: const TextStyle(fontSize: 18),
													),
												],
											),
									],
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showDialog,
											child: const Text(
												'Show Dialog',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
										MaterialButton(
											color: Colors.grey,
											onPressed: viewModel.showBottomSheet,
											child: const Text(
												'Show Bottom Sheet',
												style: TextStyle(
													color: Colors.white,
												),
											),
										),
									],
								),
							],
						),
					),
				),
			),
		);
	}

	@override
	HomeViewModel viewModelBuilder(
		BuildContext context,
	) =>
			HomeViewModel();
}
