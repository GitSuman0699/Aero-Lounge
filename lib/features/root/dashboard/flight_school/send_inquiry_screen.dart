import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SendInquiryScreen extends StatefulWidget {
  const SendInquiryScreen({super.key});

  @override
  State<SendInquiryScreen> createState() => _SendInquiryScreenState();
}

class _SendInquiryScreenState extends State<SendInquiryScreen> {
  final sendInquiryFormKey = GlobalKey<FormBuilderState>();

  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'You',
      'subject': 'Interested for Pilot position',
      'message':
          'Interested in discussing available positions for experienced B737 pilots.',
      'timestamp': 'May 6, 2025 11:15 AM',
    },
    {
      'sender': 'SkyWings Flight Academy',
      'subject': null,
      'message':
          'Thanks for reaching out! Could you share more details about your recent experience?',
      'timestamp': 'May 6, 2025 11:30 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        title: Text('Send Inquiry'),
      ),
      body: Stack(
        children: [
          // Background image
          BackGroundFiller(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerHelper.verticalSpace(6),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: TColors.radioBackgroud,
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.assetsDashboardTwinPlaneImage,
                        height: 56,
                        width: 56,
                      ),
                      SpacerHelper.horizontalSpaceMedium(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SkyWings Flight Academy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextTheme.of(context).bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: TColors.textSecondary,
                                    fontSize: 15,
                                  ),
                            ),
                            Text(
                              'Miami International Airport, FL',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: TColors.textSecondary,
                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Row(
                          mainAxisAlignment: message['sender'] == 'You'
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: message['sender'] == 'You'
                                    ? TColors.lightContainer
                                    : TColors.light,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: TColors.radioBackgroud,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message['sender'],
                                    style: TextTheme.of(context)
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: TColors.textSecondary,
                                          fontSize: 15,
                                        ),
                                  ),
                                  message['subject'] != null
                                      ? Text(
                                          'Subject: Interested for Pilot position',
                                          style: TextTheme.of(context)
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: TColors.textSecondary,
                                                fontSize: 13,
                                              ))
                                      : SizedBox.shrink(),
                                  SpacerHelper.verticalSpaceSmall(),
                                  Text(
                                    message['message'],
                                    style: TextTheme.of(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: TColors.textSecondary,
                                          fontSize: 13,
                                        ),
                                  ),
                                  SpacerHelper.verticalSpaceMedium(),
                                  Text(
                                    message['timestamp'],
                                    style: TextTheme.of(context)
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: TColors.textSecondary,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SpacerHelper.verticalSpaceMedium();
                      },
                    ),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SendInqueryForm(
                    //         sendInqueryFormKey: sendInquiryFormKey),
                    //     SpacerHelper.verticalSpaceExtraLarge(),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width,
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           // signUpFormKey.currentState!.save();
                    //           // if (signUpFormKey.currentState!.validate()) {

                    //           // }
                    //         },
                    //         child: Text("Send Inquiry"),
                    //       ),
                    //     ),
                    //     SpacerHelper.verticalSpaceLarge(),
                    //   ],
                    // ),
                  ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.lightContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: TColors.radioBackgroud,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            Assets.assetsLoginAttachmentIcon,
                          ),
                        ),
                        Expanded(
                          child: DataFieldWidget(
                            name: 'keyboard',
                            label: '',
                            hintText: 'Type here...',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SvgPicture.asset(
                            Assets.assetsLoginSendIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
