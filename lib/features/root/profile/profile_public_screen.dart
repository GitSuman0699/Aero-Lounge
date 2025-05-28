import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePublicScreen extends StatefulWidget {
  const ProfilePublicScreen({super.key});

  @override
  State<ProfilePublicScreen> createState() => _ProfilePublicScreenState();
}

class _ProfilePublicScreenState extends State<ProfilePublicScreen> {
  final List<String> pilotCertificates = [
    'ATP',
    'Commercial',
    'Instrument',
    'Multi-Engine',
  ];

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonWidget(),
                      SvgPicture.asset(
                        Assets.assetsDashboardNotificationIcon,
                        height: 35,
                        width: 35,
                      )
                    ],
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 140,
                                  ),
                                  Column(
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
                                  )
                                ],
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              SpacerHelper.verticalSpaceMedium(),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Certifications',
                                        style: TextTheme.of(context)
                                            .bodyLarge
                                            ?.copyWith(
                                              color: TColors.darkGrey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                      ),
                                      SpacerHelper.verticalSpaceSmall(),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          for (int i = 0;
                                              i < pilotCertificates.length;
                                              i++) ...[
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: TColors.textPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Text(
                                                pilotCertificates[i],
                                                style: TextTheme.of(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                      color: TColors.textWhite,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13,
                                                    ),
                                              ),
                                            )
                                          ]
                                        ],
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      Text(
                                        "Bio",
                                        style: TextTheme.of(context)
                                            .bodyLarge
                                            ?.copyWith(
                                              color: TColors.textSecondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                      ),
                                      SpacerHelper.verticalSpaceSmall(),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                        style: TextStyle(
                                          color: TColors.textSecondary,
                                        ),
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
                                      Text(
                                        "Aviation Network",
                                        style: TextTheme.of(context)
                                            .bodyLarge
                                            ?.copyWith(
                                              color: TColors.textSecondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                      ),
                                      SpacerHelper.verticalSpaceMedium(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: TColors.lightContainer,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets
                                                        .assetsDashboardFlightClubIcon,
                                                    height: 30,
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceSmall(),
                                                  Text(
                                                    'Flight Club',
                                                    style: TextTheme.of(context)
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceExtraSmall(),
                                                  Text(
                                                    "19 Members",
                                                    style: TextTheme.of(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SpacerHelper.horizontalSpaceMedium(),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: TColors.lightContainer,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets
                                                        .assetsDashboardStudyGroupIcon,
                                                    height: 30,
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceSmall(),
                                                  Text(
                                                    'Study Group',
                                                    style: TextTheme.of(context)
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceExtraSmall(),
                                                  Text(
                                                    "15 Members",
                                                    style: TextTheme.of(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SpacerHelper.verticalSpaceMedium(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: TColors.lightContainer,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets
                                                        .assetsAircraftPlaneIcon,
                                                    height: 24,
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceSmall(),
                                                  Text(
                                                    '24',
                                                    style: TextTheme.of(context)
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceExtraSmall(),
                                                  Text(
                                                    "Flights",
                                                    style: TextTheme.of(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SpacerHelper.horizontalSpaceMedium(),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: TColors.lightContainer,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets
                                                        .assetsAircraftClockIcon,
                                                    height: 24,
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceSmall(),
                                                  Text(
                                                    '156',
                                                    style: TextTheme.of(context)
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceExtraSmall(),
                                                  Text(
                                                    "Hours",
                                                    style: TextTheme.of(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SpacerHelper.horizontalSpaceMedium(),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: TColors.lightContainer,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 28,
                                                    color: TColors.textPrimary,
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceSmall(),
                                                  Text(
                                                    '12',
                                                    style: TextTheme.of(context)
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  SpacerHelper
                                                      .verticalSpaceExtraSmall(),
                                                  Text(
                                                    "Airports",
                                                    style: TextTheme.of(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: TColors
                                                              .textSecondary,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SpacerHelper.verticalSpaceLarge(),
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
