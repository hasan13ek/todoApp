import 'package:easy_localization/easy_localization.dart';
import 'package:first_lesson/screens/main_page.dart';
import 'package:first_lesson/screens/splash_page.dart';
import 'package:first_lesson/service/storage_service.dart';
import 'package:first_lesson/theme_provider.dart';
import 'package:first_lesson/utils/my_themes.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.getInstance();
  runApp(
    EasyLocalization(
      startLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      child: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Styles.themeData(
          !context.watch<ThemeProvider>().getIsLight(), context),
      themeMode: context.watch<ThemeProvider>().getIsLight()
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
