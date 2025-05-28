import 'package:aero_lounge/routes/app_pages.dart';
import 'package:aero_lounge/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aero Lounge',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
