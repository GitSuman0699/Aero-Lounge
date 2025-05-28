import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/notification_button.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                Assets.assetsSplashSplashCloudImage,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerHelper.verticalSpaceMedium(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: NotificationButton(),
                  ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SpacerHelper.verticalSpaceExtraLarge(),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: TColors.grey,
                          image: DecorationImage(
                            image: AssetImage(
                                Assets.assetsOnboardOnboardBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpacerHelper.verticalSpaceSmall(),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 140,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.profilePublicRoute);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "John Dettinger",
                                          textAlign: TextAlign.start,
                                          style: TextTheme.of(context)
                                              .titleMedium
                                              ?.copyWith(
                                                color: TColors.textSecondary,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                        Text(
                                          'john.dettinger@gmail.com',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextTheme.of(context)
                                              .bodySmall
                                              ?.copyWith(
                                                color: TColors.textSecondary,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SpacerHelper.verticalSpaceExtraLarge(),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: TColors.lightContainer,
                                          border: Border.all(
                                            color: TColors.radioBackgroud,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Account Settings',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        TColors.textSecondary,
                                                  ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.profileEditRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Edit Profile Details',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: TColors.lightContainer,
                                          border: Border.all(
                                            color: TColors.radioBackgroud,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Subscription & Billing',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        TColors.textSecondary,
                                                  ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(AppRoutes
                                                    .subscriptionRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Subscription',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(AppRoutes
                                                    .subscriptionPlanRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Change Plan',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(AppRoutes
                                                    .billingHistoryRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Billing History',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: TColors.lightContainer,
                                          border: Border.all(
                                            color: TColors.radioBackgroud,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Support',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        TColors.textSecondary,
                                                  ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.supportRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Submit Ticket',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(AppRoutes
                                                    .supportTicketsRoute);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Track Ticket Status',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: TColors
                                                              .textSecondary,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 18,
                                                    color: TColors.darkGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: TColors.lightContainer,
                                          border: Border.all(
                                            color: TColors.radioBackgroud,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Legal',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        TColors.textSecondary,
                                                  ),
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Privacy Policy',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: TColors
                                                            .textSecondary,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios_sharp,
                                                  size: 18,
                                                  color: TColors.darkGrey,
                                                )
                                              ],
                                            ),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Divider(),
                                            SpacerHelper.verticalSpaceSmall(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Terms of Use',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: TColors
                                                            .textSecondary,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios_sharp,
                                                  size: 18,
                                                  color: TColors.darkGrey,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            AppDiaLogs.logoutDialog(context);
                                            // AppDiaLogs.issueEscalatedDialog(
                                            //     context);
                                          },
                                          child: Text('Logout'),
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceMedium(),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: TElevatedButtonTheme
                                              .lightElevatedButtonTheme.style
                                              ?.copyWith(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              TColors.logoutButtonRed,
                                            ),
                                          ),
                                          onPressed: () {
                                            AppDiaLogs.deleteAccountDialog(
                                                context);
                                          },
                                          child: Text(
                                            'Delete Account',
                                          ),
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceMedium(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -55,
                        left: 24,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(
                            Assets.assetsLoginUserProfilePicture,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
