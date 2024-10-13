
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
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								const Text(
									'S&P 500 Metrics',
									style: TextStyle(
										fontSize: 35,
										fontWeight: FontWeight.w900,
									),
								),
								const Gap(25),
								Text(
									'S&P 500 Index: ${viewModel.sp500Index}',
									style: const TextStyle(
										fontSize: 20,
										fontWeight: FontWeight.w500,
									),
								),
								const Gap(10),
								Text(
									'Change: ${viewModel.sp500Change}',
									style: const TextStyle(
										fontSize: 18,
										color: Colors.green,
									),
								),
								const Gap(10),
								Text(
									'Change %: ${viewModel.sp500ChangePercent}',
									style: const TextStyle(
										fontSize: 18,
										color: Colors.green,
									),
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
	) => HomeViewModel();
}
