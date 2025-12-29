import 'package:chatbot/providers/theme_provider.dart';
import 'package:chatbot/screens/register_screen.dart';
import 'package:chatbot/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).loadThemePreference().then((_) => super.initState());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CBOT',
          theme: AppTheme.themeData(
            isDarkTheme: value.isDarkTheme,
            context: context,
          ),
          home: const RegisterScreen(),
        );
      },
    );
  }
}
