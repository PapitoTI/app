import 'package:app/src/Pages/dashboard/binding.dart';
import 'package:app/src/Pages/dashboard/view.dart';
import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Pages/splash/binding.dart';
import 'package:app/src/Pages/splash/splash.dart';
import 'package:app/src/Routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.SPLASH;
  static const HomeP = AppRoutes.SPLASH;

  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeBasePage(),
      //binding: HomeBinding(),
    ),
  ];
}
