import 'package:get/route_manager.dart';
import 'package:wallpaper_app/pages/category.dart';
import 'package:wallpaper_app/pages/home_screen.dart';
import 'package:wallpaper_app/pages/wallpaper_page.dart';

appRoutes ()=> [
  GetPage(name: '/',
  page:() => const HomePage(),
    transition: Transition.noTransition,

  ),

  GetPage(name: '/category',
   page: () => const Category(),
   transition: Transition.noTransition,
   ),

  GetPage(name: '/wallpaperPage',
   page: () => const WallpaperPage(),
   transition: Transition.noTransition,
   ),
   

];