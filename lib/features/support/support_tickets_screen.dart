import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SupportTicketsScreen extends StatefulWidget {
  const SupportTicketsScreen({super.key});

  @override
  State<SupportTicketsScreen> createState() => _SupportTicketsScreenState();
}

class _SupportTicketsScreenState extends State<SupportTicketsScreen> {
  final List<Map<String, dynamic>> supportTickets = [
    {
      'title': 'Login Issue with Mobile App',
      'submitted': 'Jan 15, 2025',
      'status': 'In Progress',
      'responses': 3,
    },
    {
      'title': 'Payment Failed Error #4592',
      'submitted': 'Jan 14, 2025',
      'status': 'Open',
      'responses': 3,
    },
    {
      'title': 'Account Verification Request',
      'submitted': 'Jan 12, 2025',
      'status': 'Closed',
      'responses': 5,
    },
    {
      'title': 'Feature Request: Dark Mode',
      'submitted': 'Jan 10, 2025',
      'status': 'In Progress',
      'responses': 8,
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
        title: Text('Support Tickets'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.supportRoute);
            },
            icon: Icon(Icons.add),
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
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsRootFilterIcon),
                      SpacerHelper.horizontalSpaceSmall(),
                      Text(
                        'Filter tickets',
                        style: TextTheme.of(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final ticket = supportTickets[index];
                        return Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: TColors.lightContainer,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: TColors.borderSecondary,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      ticket['title']!,
                                      style: TextTheme.of(context)
                                          .bodyMedium
                                          ?.copyWith(
                                            color: TColors.textSecondary,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                  SpacerHelper.horizontalSpaceMedium(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: ticket['status']! == 'Open'
                                          ? TColors.textPrimary
                                          : ticket['status']! == 'Closed'
                                              ? TColors.darkGrey
                                              : TColors.buttonGreen,
                                    ),
                                    child: Center(
                                      child: Text(
                                        ticket['status']!,
                                        style: TextTheme.of(context)
                                            .bodySmall
                                            ?.copyWith(
                                              color: TColors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SpacerHelper.verticalSpaceExtraSmall(),
                              Text(
                                'Submitted: ${ticket['submitted']}',
                                style:
                                    TextTheme.of(context).bodyMedium?.copyWith(
                                          color: TColors.textSecondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.assetsLoginMessageIcon,
                                  ),
                                  SpacerHelper.horizontalSpaceSmall(),
                                  Text(
                                    '${ticket['responses']!} responses',
                                    style: TextTheme.of(context)
                                        .bodyMedium
                                        ?.copyWith(
                                          color: TColors.textSecondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SpacerHelper.verticalSpaceMedium();
                      },
                      itemCount: supportTickets.length,
                    ),
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
