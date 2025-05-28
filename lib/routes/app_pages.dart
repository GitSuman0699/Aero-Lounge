import 'package:aero_lounge/features/aircraft/aircraft_detail_screen.dart';
import 'package:aero_lounge/features/aircraft/book_aircraft_screen.dart';
import 'package:aero_lounge/features/aircraft/booking_confirm_screen.dart';
import 'package:aero_lounge/features/aircraft/booking_review_screen.dart';
import 'package:aero_lounge/features/aircraft/confirm_details_screen.dart';
import 'package:aero_lounge/features/auth/account_review/account_review_screen.dart';
import 'package:aero_lounge/features/auth/checklist/checklist_screen.dart';
import 'package:aero_lounge/features/auth/login/login_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/create_account_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_1_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_2_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_3_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_4_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_5_screen.dart';
import 'package:aero_lounge/features/auth/profile_setup/profile_setup_6_screen.dart';
import 'package:aero_lounge/features/auth/sign_up/sign_up_screen.dart';
import 'package:aero_lounge/features/notification/notification_screen.dart';
import 'package:aero_lounge/features/root/dashboard/dashboard_screen.dart';
import 'package:aero_lounge/features/root/dashboard/flight_school/flight_school_detail_screen.dart';
import 'package:aero_lounge/features/root/dashboard/flight_school/send_inquiry_screen.dart';
import 'package:aero_lounge/features/on_board/on_board_screen.dart';
import 'package:aero_lounge/features/root/logbook/dispatch_form/dispatch_form_screen.dart';
import 'package:aero_lounge/features/root/logbook/flight_log/add_flight_log_screen.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/add_squawk_screen.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/flight_check_in_screen.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/flight_check_out_screen.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/flight_review_screen.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/upcoming_flight_list_screen.dart';
import 'package:aero_lounge/features/root/profile/edit_profile_screen.dart';
import 'package:aero_lounge/features/root/profile/profile_public_screen.dart';
import 'package:aero_lounge/features/root/root_screen.dart';
import 'package:aero_lounge/features/splash/splash_screen.dart';
import 'package:aero_lounge/features/subscription_and_payment/billing_history_screen.dart';
import 'package:aero_lounge/features/subscription_and_payment/payment_screen.dart';
import 'package:aero_lounge/features/subscription_and_payment/subscription_screen.dart';
import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_screen.dart';
import 'package:aero_lounge/features/support/support_screen.dart';
import 'package:aero_lounge/features/support/support_tickets_screen.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static String get initial => AppRoutes.splashRoute;

  static final pages = <GetPage>[
    // Splash Screen
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Onboarding Screen
    GetPage(
      name: AppRoutes.onboardingRoute,
      page: () => const OnBoardScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Login Screen
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LoginScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Sign Up Screen
    GetPage(
      name: AppRoutes.signUpRoute,
      page: () => const SignUpScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Checklist Screen
    GetPage(
      name: AppRoutes.checklistRoute,
      page: () => const ChecklistScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Create Account Screen
    GetPage(
      name: AppRoutes.createAccountRoute,
      page: () => const CreateAccountScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 1 Screen
    GetPage(
      name: AppRoutes.profileSetup1Route,
      page: () => const ProfileSetup1Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 2 Screen
    GetPage(
      name: AppRoutes.profileSetup2Route,
      page: () => const ProfileSetup2Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 3 Screen
    GetPage(
      name: AppRoutes.profileSetup3Route,
      page: () => const ProfileSetup3Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 4 Screen
    GetPage(
      name: AppRoutes.profileSetup4Route,
      page: () => const ProfileSetup4Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 5 Screen
    GetPage(
      name: AppRoutes.profileSetup5Route,
      page: () => const ProfileSetup5Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Setup 6 Screen
    GetPage(
      name: AppRoutes.profileSetup6Route,
      page: () => const ProfileSetup6Screen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Account Review Screen
    GetPage(
      name: AppRoutes.accountReviewRoute,
      page: () => const AccountReviewScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Subscription Plan Screen
    GetPage(
      name: AppRoutes.subscriptionPlanRoute,
      page: () => const SubscriptionPlanScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Root Screen
    GetPage(
      name: AppRoutes.rootRoute,
      page: () => const RootScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),
    // Dashboard Screen
    GetPage(
      name: AppRoutes.dashboardRoute,
      page: () => const DashboardScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Flight School Detail Screen
    GetPage(
      name: AppRoutes.flightSchoolDetailRoute,
      page: () => const FlightSchoolDetailScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Flight School Send Enquiry Screen
    GetPage(
      name: AppRoutes.flightSchoolSendInquiryRoute,
      page: () => const SendInquiryScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Aircraft Detail Screen
    GetPage(
      name: AppRoutes.aircraftDetailRoute,
      page: () => const AircraftDetailScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Aircraft Booking Screen
    GetPage(
      name: AppRoutes.aircraftBookingRoute,
      page: () => const BookAircraftScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Aircraft Booking Review Screen
    GetPage(
      name: AppRoutes.aircraftBookingReviewRoute,
      page: () => const BookingReviewScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Aircraft Booking Detail Screen
    GetPage(
      name: AppRoutes.aircraftBookingDetailRoute,
      page: () => const ConfirmDetailsScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Aircraft Booking Confirmation Screen
    GetPage(
      name: AppRoutes.aircraftBookingConfirmationRoute,
      page: () => const BookingConfirmScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    //----- Logbook Tab -----
    // Upcoming Flight List Screen
    GetPage(
      name: AppRoutes.upcomingFlightListRoute,
      page: () => const UpcomingFlightListScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Dispatch Form Screen
    GetPage(
      name: AppRoutes.dispatchFormRoute,
      page: () => const DispatchFormScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Flight Check In Screen
    GetPage(
      name: AppRoutes.flightCheckInRoute,
      page: () => const FlightCheckInScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Flight Check Out Screen
    GetPage(
      name: AppRoutes.flightCheckOutRoute,
      page: () => const FlightCheckOutScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Add Squawk Screen
    GetPage(
      name: AppRoutes.addSquawkRoute,
      page: () => const AddSquawkScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Flight Log Review Screen
    GetPage(
      name: AppRoutes.flightReviewRoute,
      page: () => const FlightReviewScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Add Flight Log Screen
    GetPage(
      name: AppRoutes.addFlightLogRoute,
      page: () => const AddFlightLogScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Payment Screen
    GetPage(
      name: AppRoutes.paymentRoute,
      page: () => const PaymentScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Public Screen
    GetPage(
      name: AppRoutes.profilePublicRoute,
      page: () => const ProfilePublicScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Profile Edit Screen
    GetPage(
      name: AppRoutes.profileEditRoute,
      page: () => const EditProfileScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Support Screen
    GetPage(
      name: AppRoutes.supportRoute,
      page: () => const SupportScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Subscription Screen
    GetPage(
      name: AppRoutes.subscriptionRoute,
      page: () => const SubscriptionScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Billing History Screen
    GetPage(
      name: AppRoutes.billingHistoryRoute,
      page: () => const BillingHistoryScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Support Tickets Screen
    GetPage(
      name: AppRoutes.supportTicketsRoute,
      page: () => const SupportTicketsScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.rightToLeft,
    ),

    // Notification Screen
    GetPage(
      name: AppRoutes.notificationRoute,
      page: () => const NotificationScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transition: Transition.upToDown,
    )
  ];
}
