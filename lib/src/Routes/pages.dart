import 'package:app/src/Pages/dashboard/binding.dart';
import 'package:app/src/Pages/dashboard/view.dart';
import 'package:app/src/Routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
