import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:language_ch/main.dart';

// class Language {
//   final int id;
//   final String flag;
//   final String name;
//   final String languageCode;
//   final Locale _locale;
//
//
//   Language(
//       {required this.id,
//         required this.flag,
//         required this.name,
//         required this.locale,
//         required this.languageCode});
// //List<Languages>? list = DatabaseConfig().getLanguageList();
// }


class HomePage extends StatelessWidget {

  //  List<Language> languageList=[
  //   Language(id: 1, flag: "US", name: "English", languageCode: "en",locale: Locale('en','US')),
  //   Language(id: 2, flag: "BD", name: "বাংলা", languageCode: "bn",locale: Locale('kn','IN')),
  //   Language(id: 3, flag: "SA", name: "اَلْعَرَبِيَّةُ‎", languageCode: "ar",locale: Locale('hi','IN')),
  //   Language(id: 4, flag: "IN", name: "हिंदी", languageCode: "hi",locale: Locale('hi','IN')),
  // ];
  //
  final List _locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
    {'name':'اَلْعَرَبِيَّةُ‎','locale': Locale('hi','IN')},
  ];

  // updateLanguage(Locale locale){
  //   Get.back();
  //   Get.updateLocale(locale);
  // }

  buildLanguageDialog(BuildContext context){
    showDialog(context: context,

        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(_locale[index]["name"]),
                        onTap: (){
                        print(_locale[index]['name']);
                        Controller().updatedate(_locale[index]['locale']);
                        //updateLanguage(_locale[index]['name']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: _locale.length
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('title'.tr),),
        body: Container(
          alignment: Alignment.center,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('hello'.tr,style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              Text('message'.tr,style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('subscribe'.tr,style: TextStyle(fontSize: 20),),

              ElevatedButton(onPressed: (){
                buildLanguageDialog(context);
              }, child: Text('changelang'.tr)),
            ],
          ),
        )
    );
  }
}