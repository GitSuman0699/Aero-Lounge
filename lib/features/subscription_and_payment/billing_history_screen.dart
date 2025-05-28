import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BillingHistoryScreen extends StatefulWidget {
  const BillingHistoryScreen({super.key});

  @override
  State<BillingHistoryScreen> createState() => _BillingHistoryScreenState();
}

class _BillingHistoryScreenState extends State<BillingHistoryScreen> {
  final List<Map<String, String>> paymentHistory = [
    {
      'date': 'January 15, 2025',
      'status': 'Paid',
      'amount': '\$29.99',
    },
    {
      'date': 'December 15, 2024',
      'status': 'Paid',
      'amount': '\$29.99',
    },
    {
      'date': 'November 15, 2024',
      'status': 'Failed',
      'amount': '\$29.99',
    },
    {
      'date': 'October 15, 2024',
      'status': 'Paid',
      'amount': '\$29.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            Assets.assetsCreateAccountBackIcon,
            height: 25,
            width: 25,
          ),
        ),
        centerTitle: true,
        title: Text('Billing History'),
      ),
      body: Stack(
        children: [
          BackGroundFiller(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerHelper.verticalSpaceLarge(),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final payment = paymentHistory[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      payment['date']!,
                                      style: TextTheme.of(context)
                                          .bodyMedium
                                          ?.copyWith(
                                            color: TColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                payment['status']! == "Failed"
                                                    ? TColors.logoutButtonRed
                                                    : TColors.buttonGreen,
                                          ),
                                          child: Center(
                                            child: Text(
                                              payment['status']!,
                                              style: TextTheme.of(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: TColors.white,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        SpacerHelper.horizontalSpaceMedium(),
                                        InkWell(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            Assets.assetsLoginDownloadIcon,
                                            colorFilter: ColorFilter.mode(
                                              payment['status']! == "Failed"
                                                  ? TColors.darkGrey
                                                  : TColors.textSecondary,
                                              BlendMode.srcIn,
                                            ),
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SpacerHelper.verticalSpaceExtraSmall(),
                                Text(
                                  payment['amount']!,
                                  style: TextTheme.of(context)
                                      .titleMedium
                                      ?.copyWith(
                                        color: TColors.textPrimary,
                                        fontWeight: FontWeight.w900,
                                      ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SpacerHelper.verticalSpaceSmall();
                        },
                        itemCount: paymentHistory.length),
                    SpacerHelper.verticalSpaceLarge(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
