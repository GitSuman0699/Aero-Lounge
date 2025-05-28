import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SupportLink extends StatelessWidget {
  const SupportLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: 'Need help? ',
          style: TextTheme.of(context).titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: TColors.textSecondary,
              ),
          children: <TextSpan>[
            TextSpan(
              text: 'Contact support',
              style: TextTheme.of(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: TColors.backIcon,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
