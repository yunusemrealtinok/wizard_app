import 'package:get/get.dart';

import '../modules/favorites_page/bindings/favorites_page_binding.dart';
import '../modules/favorites_page/views/favorites_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info_page/bindings/info_page_binding.dart';
import '../modules/info_page/views/info_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INFO_PAGE,
      page: () => const InfoPageView(),
      binding: InfoPageBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES_PAGE,
      page: () => const FavoritesPageView(),
      binding: FavoritesPageBinding(),
    ),
  ];
}
