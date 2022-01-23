import 'package:get/get.dart';
import 'package:getx_ex/Pages/home_page.dart';
import 'routes.dart';

class Pages {
  static String intial_page = HOME_PAGE;
  static var list = [
    GetPage(
        name: HOME_PAGE,
        page: () => const HomePage()
    ),
    GetPage(
        name: PAGE_THREE,
        page: () => const PageThree()
    ),
    GetPage(
        name: PAGE_FOUR,
        page: () => const PageFour()
    )
  ];
}