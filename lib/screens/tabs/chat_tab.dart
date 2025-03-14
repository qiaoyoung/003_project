import 'package:flutter/material.dart';
import '../../colors.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AILetGo'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '您好，我是AILetGo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '我可以帮您回答问题、提供建议或者陪您聊天',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 100,
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '点击下方按钮开始聊天',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 实现聊天功能
        },
        backgroundColor: AppColors.accentColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
