import 'package:flutter/material.dart';
import 'package:flutter_practical_13/ui/receiver_chat_screen.dart';
import 'package:flutter_practical_13/ui/sender_chat_screen.dart';
import 'package:flutter_practical_13/ui/styles/theme_data.dart';
import 'package:provider/provider.dart';
import 'ui/chat_provider.dart';

final Color primaryColor = Colors.green[200]!;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MessageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Track the current selected tab

  // List of screens (Sender and Receiver)
  final List<Widget> _screens = const [
    SenderScreen(),
    ReceiverScreen(),
  ];

  // Handle tab change
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatter Ji'),
        backgroundColor: primaryColor,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.person : Icons.person_2_outlined, color: _currentIndex == 0 ? Colors.green[900] : Colors.grey,),
            label: 'Sender',
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 1 ? Icons.person : Icons.person_2_outlined, color: _currentIndex == 1 ? Colors.green[900] : Colors.grey,),
            label: 'Receiver',
          ),
        ],
      ),
    );
  }
}