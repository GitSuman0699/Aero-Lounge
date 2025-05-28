import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageViewWidget extends StatefulWidget {
  const ImageViewWidget({super.key});

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  PageController? pageViewController;
  int currentPage = 0;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: pageViewController ??= PageController(initialPage: 0),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            onPageChanged: (value) {
              currentPage = value;
              setState(() {});
            },
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                Assets.assetsAircraftAircraft1,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          right: 20,
          bottom: 10,
          child: SmoothPageIndicator(
            controller: pageViewController ??= PageController(initialPage: 0),
            count: 3,
            axisDirection: Axis.horizontal,
            onDotClicked: (i) async {
              await pageViewController!.animateToPage(
                i,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              currentPage = i;
              setState(() {});
            },
            effect: JumpingDotEffect(
              activeDotColor: TColors.textPrimary,
              dotColor: TColors.white,
              dotHeight: 8,
              dotWidth: 8,
              verticalOffset: 5,
            ),
          ),
        ),
      ],
    );
  }
}
