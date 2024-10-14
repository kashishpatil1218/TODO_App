import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_adv/provider/home_provider.dart';
import 'package:todo_app_adv/provider/theme_provider.dart';
import 'package:todo_app_adv/screens/home_Page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).isDark)?ThemeMode.dark:ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}

