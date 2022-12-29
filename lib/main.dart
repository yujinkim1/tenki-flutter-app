import 'package:flutter/material.dart';
import 'package:tenki/screens/load.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//MARK: ROOT WIDGET
class MyApp extends StatelessWidget {
  //MARK: THEME MODE IS LIGHT? LIGHT : DARK
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            //MARK: REMOVE DEBUG BANNER
            debugShowCheckedModeBanner: false,
            title: 'Tenki',
            theme: ThemeData(fontFamily: "NotoSansKR"),
            //MARK: DEFINED THEME MODE
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const LoadScreen(),
          );
        });
  }
}
