import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/constants/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Booking Confirmed',
      'message': 'Your flight for June 6th, 2025 is confirmed.',
      'time': '2m ago',
      'seen': false,
    },
    {
      'title': 'Subscription Renewal',
      'message': 'Your premium subscription will renew in 3 days.',
      'time': '1h ago',
      'seen': true,
    },
    {
      'title': 'System Maintenance',
      'message': 'Scheduled maintenance on July 1st, 2025.',
      'time': '5h ago',
      'seen': true,
    },
    {
      'title': 'Payment Successful',
      'message': 'Your payment of \$99.99 has been processed.',
      'time': '1d ago',
      'seen': true,
    },
    {
      'title': 'New Features Available',
      'message': 'Check out our latest app updates and improvements.',
      'time': '2d ago',
      'seen': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        centerTitle: true,
        title: Text('Notifications'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: NotificationButton(),
          ),
        ],
      ),
      body: Stack(
        children: [
          BackGroundFiller(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SpacerHelper.verticalSpaceLarge(),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: TColors.lightContainer,
                              borderRadius: BorderRadius.circular(8),
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
                                    Row(
                                      children: [
                                        switch (index) {
                                          0 => SvgPicture.asset(
                                              Assets
                                                  .assetsCreateAccountInformationIcon,
                                              colorFilter: ColorFilter.mode(
                                                TColors.textPrimary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          1 => SvgPicture.asset(
                                              Assets
                                                  .assetsAircraftBackClockIcon,
                                              colorFilter: ColorFilter.mode(
                                                TColors.textPrimary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          2 => SvgPicture.asset(
                                              Assets
                                                  .assetsCreateAccountWarningIcon,
                                              colorFilter: ColorFilter.mode(
                                                TColors.textPrimary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          3 => SvgPicture.asset(
                                              Assets
                                                  .assetsAircraftPaymentTickIcon,
                                              height: 24,
                                              width: 24,
                                              colorFilter: ColorFilter.mode(
                                                TColors.textPrimary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          4 => SvgPicture.asset(
                                              Assets
                                                  .assetsCreateAccountInformationIcon,
                                              colorFilter: ColorFilter.mode(
                                                TColors.textPrimary,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          _ => SizedBox.shrink(),
                                        },
                                        SpacerHelper.horizontalSpaceSmall(),
                                        Text(
                                          notification['title']!,
                                          style: TextTheme.of(context)
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: TColors.textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          notification['time']!,
                                          style: TextTheme.of(context)
                                              .labelMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: TColors.textSecondary,
                                                fontSize: 13,
                                              ),
                                        ),
                                        notification['seen']! == false
                                            ? SpacerHelper
                                                .horizontalSpaceExtraSmall()
                                            : SizedBox.shrink(),
                                        notification['seen']! == false
                                            ? Icon(
                                                Icons.circle,
                                                color: TColors.borderRed,
                                                size: 10,
                                              )
                                            : SizedBox.shrink(),
                                      ],
                                    ),
                                  ],
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Expanded(
                                      child: Text(
                                        notification['message']!,
                                        style: TextTheme.of(context)
                                            .labelLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: TColors.textSecondary,
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SpacerHelper.verticalSpaceSmall();
                        },
                        itemCount: notifications.length),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
