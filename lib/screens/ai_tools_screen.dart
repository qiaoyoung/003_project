import 'package:flutter/material.dart';
import '../colors.dart';

class AIToolsScreen extends StatelessWidget {
  const AIToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 助手'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '智能 AI 助手',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '选择不同场景，让 AI 为您提供专业服务',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Featured Tool
            _buildFeaturedTool(context),
            const SizedBox(height: 24),

            // Tools Grid
            const Text(
              '专业助手',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildToolsGrid(context),

            const SizedBox(height: 24),
            const Text(
              '生活助手',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildLifeToolsGrid(context),

            const SizedBox(height: 24),
            const Text(
              '学习助手',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildEducationToolsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedTool(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to AI Chat
        Navigator.pushNamed(context, '/chat');
      },
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Icon(
                Icons.chat_bubble_outline,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                    size: 36,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'AI 聊天',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '与智能 AI 角色自由对话',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolsGrid(BuildContext context) {
    final tools = [
      {
        'title': 'AI 聊天',
        'description': '与智能 AI 角色对话',
        'icon': Icons.chat,
        'color': Colors.blue,
        'route': '/chat',
        'prompt':
            'You are a friendly AI assistant who can answer various questions. Please respond in English only.',
      },
      {
        'title': '文本摘要',
        'description': '长文本智能概括',
        'icon': Icons.text_fields,
        'color': Colors.green,
        'route': '/chat',
        'prompt':
            'You are a professional text summarization assistant. Please summarize the following content concisely. Always respond in English only.',
      },
      {
        'title': '翻译助手',
        'description': '多语言智能翻译',
        'icon': Icons.translate,
        'color': Colors.orange,
        'route': '/chat',
        'prompt':
            'You are a professional translation assistant. Please translate the following content. Always respond in English only, except for the translated text.',
      },
      {
        'title': '代码助手',
        'description': '编程问题解答与代码生成',
        'icon': Icons.code,
        'color': Colors.purple,
        'route': '/chat',
        'prompt':
            'You are a professional programming assistant who is proficient in various programming languages. Please help me solve the following problem. Always respond in English only.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildToolCard(
          context,
          title: tool['title'] as String,
          description: tool['description'] as String,
          icon: tool['icon'] as IconData,
          color: tool['color'] as Color,
          route: tool['route'] as String,
          prompt: tool['prompt'] as String,
        );
      },
    );
  }

  Widget _buildLifeToolsGrid(BuildContext context) {
    final tools = [
      {
        'title': '旅行规划',
        'description': '智能旅行路线规划',
        'icon': Icons.flight,
        'color': Colors.blue,
        'route': '/chat',
        'prompt':
            'You are a professional travel advisor. Please help me plan an itinerary for the following destination. Always respond in English only.',
      },
      {
        'title': '菜谱助手',
        'description': '根据食材推荐菜谱',
        'icon': Icons.restaurant,
        'color': Colors.orange,
        'route': '/chat',
        'prompt':
            'You are a professional chef. Please recommend recipes based on the ingredients I provide. Always respond in English only.',
      },
      {
        'title': '创意写作',
        'description': '故事、诗歌创作助手',
        'icon': Icons.edit,
        'color': Colors.purple,
        'route': '/chat',
        'prompt':
            'You are a creative writing assistant. Please help me create stories, poems, or other creative content based on my request. Always respond in English only.',
      },
      {
        'title': '面试准备',
        'description': '面试问题与回答建议',
        'icon': Icons.work,
        'color': Colors.teal,
        'route': '/chat',
        'prompt':
            'You are a professional career coach. Please help me prepare for job interviews by providing sample questions and advice on how to answer them. Always respond in English only.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildToolCard(
          context,
          title: tool['title'] as String,
          description: tool['description'] as String,
          icon: tool['icon'] as IconData,
          color: tool['color'] as Color,
          route: tool['route'] as String,
          prompt: tool['prompt'] as String,
        );
      },
    );
  }

  Widget _buildEducationToolsGrid(BuildContext context) {
    final tools = [
      {
        'title': '数学解题',
        'description': '数学问题解答与步骤',
        'icon': Icons.calculate,
        'color': Colors.red,
        'route': '/chat',
        'prompt':
            'You are a professional math teacher. Please help me solve the following math problem and explain the solution steps in detail. Always respond in English only.',
      },
      {
        'title': '英语学习',
        'description': '英语语法与写作指导',
        'icon': Icons.language,
        'color': Colors.teal,
        'route': '/chat',
        'prompt':
            'You are a professional English teacher. Please help me improve my English writing or answer grammar questions. Always respond in English only.',
      },
      {
        'title': '历史探索',
        'description': '历史事件与人物解析',
        'icon': Icons.history_edu,
        'color': Colors.brown,
        'route': '/chat',
        'prompt':
            'You are a professional historian. Please help me analyze the following historical events or figures. Always respond in English only.',
      },
      {
        'title': '科学实验',
        'description': '科学原理与实验指导',
        'icon': Icons.science,
        'color': Colors.indigo,
        'route': '/chat',
        'prompt':
            'You are a professional science teacher. Please explain the following scientific principles or guide me through experiments. Always respond in English only.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildToolCard(
          context,
          title: tool['title'] as String,
          description: tool['description'] as String,
          icon: tool['icon'] as IconData,
          color: tool['color'] as Color,
          route: tool['route'] as String,
          prompt: tool['prompt'] as String,
        );
      },
    );
  }

  Widget _buildToolCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required String route,
    required String prompt,
  }) {
    return GestureDetector(
      onTap: () {
        // 导航到聊天页面，并传递提示词
        Navigator.pushNamed(
          context,
          route,
          arguments: {
            'prompt': prompt,
            'title': title,
          },
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
