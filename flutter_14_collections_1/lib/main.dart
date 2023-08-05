import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_14_collections_1/test/test.dart';
import 'package:flutter_14_collections_1/home.dart';
import 'package:flutter_14_collections_1/appbar/appbar.dart';
import 'package:flutter_14_collections_1/drawer/drawer.dart';
import 'package:flutter_14_collections_1/drawer/hidden_drawer.dart';
import 'package:flutter_14_collections_1/appbar/sliver_appbar.dart';
import 'package:flutter_14_collections_1/tabbar/tabbar.dart';
import 'package:flutter_14_collections_1/timer/timer.dart';
import 'package:flutter_14_collections_1/pageview/pageview.dart';
import 'package:flutter_14_collections_1/input/textfield.dart';
import 'package:flutter_14_collections_1/animation/animatedicon.dart';
import 'package:flutter_14_collections_1/date_time/date_time_picker.dart';
import 'package:flutter_14_collections_1/date_time/listwheel.dart';
import 'package:flutter_14_collections_1/reorderable/reorderable.dart';
import 'package:flutter_14_collections_1/images/fadeinimages.dart';
import 'package:flutter_14_collections_1/images/heros.dart';
import 'package:flutter_14_collections_1/dialog/aboutdidalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/':(context) => Home(),
        '/test':(context) => TestWidget(),
        '/appbar':(context) => Appbar(),
        '/drawer':(context) => DrawerW(),
        '/hiddendrawer':(context) => HiddenDrawer(),
        '/sliverappbar':(context) => Sliver_(),
        '/tabbar':(context) => Tabbar(),
        '/timer':(context) => TimerPage(),
        '/pageview':(context) => PageViews(),
        '/input':(context) => TextFields(),
        '/ani_icon':(context) => AnimatedIcons2(),
        '/date_time':(context) => DateTimePicker(),
        '/listwheel':(context) => ListWheels(),
        '/reorderable':(context) => Reorderables(),
        '/fadeinimage':(context) => FadeInImages(),
        '/hero':(context) => Heros(),
        '/aboutdialog':(context) => AboutDialogs()
      },
    );
  }
}
