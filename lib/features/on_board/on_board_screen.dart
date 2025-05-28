import 'package:aero_lounge/features/on_board/components/aircraft_owner_button.dart';
import 'package:aero_lounge/features/on_board/components/continue_button.dart';
import 'package:aero_lounge/features/on_board/components/pilot_button.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Stack(
        children: [
          // Background image
          BackGroundFiller(),

          // Logo
          Positioned(
            top: 130,
            left: 20,
            right: 20,
            child: Image.asset(
              Assets.assetsOnboardOnboardLogo,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.16,
            ),
          ),

          Positioned(
            top: 320,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'I am a...',
                    style: TextTheme.of(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                          color: TColors.textSecondary,
                        ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  PilotButton(),
                  SpacerHelper.verticalSpaceMedium(),
                  AirCraftOwnerButton(),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  ContinueButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
