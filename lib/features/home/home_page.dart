// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../locator/locator.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  final controller = locator.get<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Transaction History',
                    style: AppTextStyles.mediumText18,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.inputLabelText,
                  )
                ],
              )),
          Expanded(
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    if (controller.state is HomeLoadingState) {
                      return const CustomCircularProgressIndicator(
                        color: AppColors.bluedarkOne,
                      );
                    }

                    if (controller.state is HomeErrorState)
                      return Center(
                        child: Text('An error has ocurred'),
                      );

                    if (controller.transactions.isEmpty)
                      return Center(
                        child: Text('There is no transactions'),
                      );

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.transactions.length,
                      itemBuilder: ((context, index) {
                        final item = controller.transactions[index];

                        final color = item.value.isNegative
                            ? AppColors.outcome
                            : AppColors.income;
                        final value = "\$ ${item.value.toStringAsFixed(2)}";
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: AppColors.antiFlashWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.monetization_on_outlined,
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: AppTextStyles.mediumText16w500,
                          ),
                          subtitle: Text(
                            DateTime.fromMicrosecondsSinceEpoch(item.date)
                                .toString(),
                            style: AppTextStyles.mediumText16w500,
                          ),
                          trailing: Text(
                            value,
                            style:
                                AppTextStyles.mediumText18.apply(color: color),
                          ),
                        );
                      }),
                    );
                  })),
        ],
      ),
    );
  }
}
