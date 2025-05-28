import 'package:aero_lounge/generated/assets.dart';
import 'package:flutter/material.dart';

class BackGroundFiller extends StatelessWidget {
  const BackGroundFiller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.8,
        child: Image.asset(
          Assets.assetsOnboardOnboardBackground,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    );
  }
}
