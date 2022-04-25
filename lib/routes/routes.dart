import 'package:get/get.dart';
import 'package:test_app/home%20page.dart';

abstract class Routes {
  static final pages = [
    GetPage(name: "/", page: () => HomePage()),
  ];
}
