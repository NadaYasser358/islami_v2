import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan2/home/home_page.dart';
import 'package:quraan2/home/tabs/quraan/sura_details.dart';
import 'package:quraan2/providers/most_recent_provider.dart';
import 'package:quraan2/style/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>MostRecentProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.dark,
      routes: {
        SuraDetails.routeName:(context)=>SuraDetails()
      },
    );
  }
}
