import 'package:chatbot/screens/ai_chat_screen.dart';
import 'package:chatbot/screens/post_screen.dart';
import 'package:chatbot/screens/profile_screen.dart';
import 'package:chatbot/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  final List<Widget> tabs = [
    const AIChatScreen(),
    const PostScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    IconData themeIcon = theme.isDarkTheme
        ? Icons.dark_mode_outlined
        : Icons.light_mode_outlined;
    Color color = theme.isDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text("CBOT", style: TextStyle(color: color)),
        actions: [
          IconButton(
            onPressed: () {
              theme.setTheme(!theme.isDarkTheme);
            },
            icon: Icon(themeIcon, color: color),
          ),
        ],
      ),
      body: tabs[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: color,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        currentIndex: selectedTabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "A.I Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
