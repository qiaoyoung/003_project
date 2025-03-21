import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_screen.dart';
import 'screens/main_screen.dart';
import 'screens/text_summarizer_screen.dart';
import 'screens/translator_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/end_user_agreement_screen.dart';
import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qintar',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF8BFFEA),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8BFFEA),
            foregroundColor: Colors.black,
          ),
        ),
        cardColor: const Color(0xFF2C2C2C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8BFFEA),
          secondary: Color(0xFF5CDED0),
          surface: Color(0xFF1E1E1E),
          background: Color(0xFF121212),
          error: Colors.redAccent,
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8BFFEA),
            foregroundColor: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF2C2C2C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8BFFEA),
          secondary: Color(0xFF5CDED0),
          surface: Color(0xFF1E1E1E),
          background: Color(0xFF121212),
          error: Colors.redAccent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/main': (context) => const MainScreen(),
        '/user_list': (context) => const UserListScreen(),
        '/user_detail': (context) => const UserDetailScreen(),
        '/text_summarizer': (context) => const TextSummarizerScreen(),
        '/translator': (context) => const TranslatorScreen(),
        '/agreement': (context) => const EndUserAgreementScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, dynamic>?;

          final defaultUser = User(
            userId: 'ai_assistant',
            nickname: args?['title'] ?? 'AI Assistant',
            avatarPath: 'assets/images/normal_header.png',
            description:
                'I am an intelligent AI assistant that can answer your various questions.',
            gender: 'None',
            age: 0,
            tags: [
              UserTag(name: 'AI', color: const Color(0xFF8BFFEA)),
              UserTag(name: 'Assistant', color: const Color(0xFF5CDED0)),
              UserTag(name: 'Smart', color: const Color(0xFF00D1B2)),
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
