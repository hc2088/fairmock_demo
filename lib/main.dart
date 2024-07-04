import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'src/module.fair.dart' as g;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    FairApp(
      delegate: {
        ///此处delegate注册的key名必须与fairwidget页面name的名字一致,
        ///TestFairDelegate只作用于相同名字的fairwidget
      },
      generated: g.FairAppModule(),
      child: const MyApp(),
    ),

    ///需要在此注册需要全局使用的plugin,key名可以随意不做要求
    // plugins: FairExtension.plugins
    //   ..addAll({
    //     'FairBasicPlugin': FairBasicPlugin(),
    //     'FairCommonPlugin': FairCommonPlugin(),
    //   }),
    // jsPlugins: FairExtension.jsPlugins
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: FairWidget(
          name: 'lib_home_page',
          path: "assets/fair/lib_home_page.fair.json",
          data: {
            'fairProps': jsonEncode({"title": "test"}),
          },
        ));
  }
}
