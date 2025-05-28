import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search aircraft, flights, or pilots...",
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      hintStyle: WidgetStateProperty.all(
        TextTheme.of(context).bodyMedium?.copyWith(
              color: TColors.hintText,
              fontWeight: FontWeight.w500,
              fontSize: 14.5,
            ),
      ),
      constraints: BoxConstraints.tight(
        Size(MediaQuery.of(context).size.width, 48),
      ),
      leading: SvgPicture.asset(
        Assets.assetsDashboardSearchIcon,
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 18),
      ),
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(TColors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
