import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:language_ch/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

import 'LacaleString.dart';

void main()async {
  await GetStorage.init();
  runApp(MyApp());
}

class Controller extends GetxController {
  final box = GetStorage();


  bool get isDark => box.read('darkmode') ?? true;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  // void changeTheme(bool val) {
  //   box.write('darkmode', val);
  // }
  Locale get localeLang=> box.read("locale")?? Locale('en','EN');
 updatedate(Locale locale){
  box.write("locale", locale);
  Get.back();
  Get.updateLocale(locale);
}

}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(Controller());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: controller.localeLang,
      title: 'Flutter Demo',
      theme: controller.theme,
      home: HomePage(),
    );
  }
}