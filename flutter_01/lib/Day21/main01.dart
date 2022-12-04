import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'picker.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    // 国际化配置
    localizationsDelegates: {
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    },

    // supportedLocales: [Locale('zh', 'CH'), Locale('en', 'US')],
    supportedLocales: [Locale('zh', 'CH')],

    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter 国际化
 */

class DateTimePage extends StatelessWidget {
  const DateTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("时间、日期选择器、国际化"),
      ),
      // body: DateTimePage(),
      body: DateTimePickerPage(),
    );
  }
}
