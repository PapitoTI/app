import 'package:app/src/Pages/Dashboard/dashboard.dart';
import 'package:app/src/Pages/Dashboard/dashboardBinding.dart';
import 'package:app/src/Routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => Dashboard(),
      binding: DashboardBinding(),
    ),
  ];
}
