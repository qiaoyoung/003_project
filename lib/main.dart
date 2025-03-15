import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_screen.dart';
import 'screens/main_screen.dart';
import 'screens/image_generator_screen.dart';
import 'screens/text_summarizer_screen.dart';
import 'screens/translator_screen.dart';
import 'screens/chat_screen.dart';
import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zyphra',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo.shade800,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade700,
            foregroundColor: Colors.white,
          ),
        ),
        cardColor: const Color(0xFF2C2C2C),
        colorScheme: ColorScheme.dark(
          primary: Colors.indigo.shade700,
          secondary: Colors.indigoAccent,
          surface: const Color(0xFF1E1E1E),
          background: const Color(0xFF121212),
          error: Colors.redAccent,
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade700,
            foregroundColor: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF2C2C2C),
        colorScheme: ColorScheme.dark(
          primary: Colors.indigo.shade700,
          secondary: Colors.indigoAccent,
          surface: const Color(0xFF1E1E1E),
          background: const Color(0xFF121212),
          error: Colors.redAccent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/main': (context) => const MainScreen(),
        '/user_list': (context) => const UserListScreen(),
        '/user_detail': (context) => const UserDetailScreen(),
        '/image_generator': (context) => const ImageGeneratorScreen(),
        '/text_summarizer': (context) => const TextSummarizerScreen(),
        '/translator': (context) => const TranslatorScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, dynamic>?;

          final defaultUser = User(
            userId: 'ai_assistant',
            nickname: args?['title'] ?? 'AI 助手',
            avatarPath: 'assets/images/normal_header.png',
            description: '我是一个智能 AI 助手，可以回答您的各种问题。',
            gender: '无',
            age: 0,
            tags: [
              UserTag(name: 'AI', color: Colors.blue),
              UserTag(name: '助手', color: Colors.green),
              UserTag(name: '智能', color: Colors.purple),
            ],
            isOnline: true,
            lastActive: DateTime.now(),
          );

          final bool isFromAITools = args?['prompt'] != null;

          return MaterialPageRoute(
            builder: (context) => ChatScreen(
              user: defaultUser,
              prompt: args?['prompt'],
              title: args?['title'],
              useSystemAvatar: true,
              excludeFromHistory: isFromAITools,
            ),
          );
        }
        return null;
      },
    );
  }
}
