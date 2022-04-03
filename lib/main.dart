import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:phonebook_flutter/views/MasterScreen/master_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp will run, but not be shown until initialization completes:
  runApp(const MyApp());
}

void initialization(BuildContext context) async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  After this function completes, the
  // splash screen will be removed.
}

const FlexSchemeData _myFlexScheme = FlexSchemeData(
  name: 'Midnight blue',
  description: 'Midnight blue theme, custom definition of all colors',
  light: FlexSchemeColor(
    primary: Color.fromARGB(255, 182, 0, 0),
    primaryVariant: Color.fromARGB(255, 192, 62, 70),
    secondary: Color(0xFFFF7B00),
    secondaryVariant: Color(0xFFFDB100),
  ),
  dark: FlexSchemeColor(
    primary: Color.fromARGB(255, 255, 78, 78),
    primaryVariant: Color(0xFFaa4848),
    secondary: Color(0xffff7155),
    secondaryVariant: Color(0xFFF1CB9D),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
  
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phone Book App',
        theme:FlexThemeData.light(scheme: FlexScheme.blueWhale),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
        themeMode: ThemeMode.dark,
        home: const MasterScreen(),
      );

  }
}
