import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/view/routes/app_routes.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Locale _locale = const Locale('en');
  //
  // void _changeLanguage(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // locale: _locale,
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('es', 'ES'),
      // ],
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   ...GlobalMaterialLocalizations.delegates,
      //   ...GlobalCupertinoLocalizations.delegates,
      // ],
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.home,
      // home: HomeScreen(onLanguageChange: _changeLanguage,),
    );
  }
}

