import 'package:chatbot/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ChatBot",
          style: TextStyle(
            color: theme.isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              theme.setTheme(!theme.isDarkTheme);
            },
            icon: Icon(
              theme.isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: theme.isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Center(child: Text("Home Screen")),
    );
  }
}
