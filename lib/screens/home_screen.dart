import 'package:flutter/material.dart';
import '../colors.dart';
import 'chat_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final ChatHistoryScreen _chatHistoryScreen = const ChatHistoryScreen();
  final Widget _placeholderPage = const Scaffold(
    body: Center(
      child: Text('此页面已被移除'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [_placeholderPage, _chatHistoryScreen],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'AI角色',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '聊天历史',
            ),
          ],
        ),
      ),
    );
  }
}
