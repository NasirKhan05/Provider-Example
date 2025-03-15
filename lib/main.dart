import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/count_provider.dart';
import 'package:provider_example/provider/example_one_provider.dart';
import 'package:provider_example/provider/theme_changer_provider.dart';
import 'package:provider_example/screen/count_example.dart';
import 'package:provider_example/screen/dark_theme.dart';
import 'package:provider_example/screen/example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Provider Examples',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
                primarySwatch: Colors.deepPurple,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white
              )
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.yellow,
              primaryColor: Colors.purple,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white
              )
            ),
            home: DarkTheme(),
          );
        }));
  }
}
