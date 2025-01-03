import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/pages/home_page.dart';
import 'package:recipes_app/pages/main_page.dart';
import 'package:recipes_app/provider/page_provider.dart';
import 'package:recipes_app/provider/recipe_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage()
      ),
    );
  }
}