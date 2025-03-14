import 'package:flutter/material.dart';
import '../../colors.dart';

class FeaturesTab extends StatelessWidget {
  const FeaturesTab({super.key});

  @override
  Widget build(BuildContext context) {
    // 功能列表
    final List<Map<String, dynamic>> features = [
      {
        'title': '智能聊天',
        'description': '与AI进行自然对话',
        'icon': Icons.chat,
        'color': Colors.blue,
      },
      {
        'title': '文本生成',
        'description': '生成各类文本内容',
        'icon': Icons.text_fields,
        'color': Colors.green,
      },
      {
        'title': '翻译助手',
        'description': '多语言互译',
        'icon': Icons.translate,
        'color': Colors.orange,
      },
      {
        'title': '内容总结',
        'description': '长文本智能摘要',
        'icon': Icons.summarize,
        'color': Colors.purple,
      },
      {
        'title': '创意写作',
        'description': '创意内容生成',
        'icon': Icons.create,
        'color': Colors.red,
      },
      {
        'title': '问答百科',
        'description': '知识问答',
        'icon': Icons.question_answer,
        'color': Colors.teal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('功能中心'),
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
              '探索更多AI功能',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '发现AILetGo的强大功能',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return _buildFeatureCard(
                    title: features[index]['title'],
                    description: features[index]['description'],
                    icon: features[index]['icon'],
                    color: features[index]['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // TODO: 实现功能点击
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
