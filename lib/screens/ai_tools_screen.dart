import 'package:flutter/material.dart';
import '../colors.dart';

class AIToolsScreen extends StatelessWidget {
  const AIToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Smart AI Assistant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose different scenarios for professional AI services',
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
              'Professional Assistants',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildToolsGrid(context),

            const SizedBox(height: 24),
            const Text(
              'Lifestyle Assistants',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildLifeToolsGrid(context),

            const SizedBox(height: 24),
            const Text(
              'Learning Assistants',
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
        height: 172,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF8BFFEA),
              const Color(0xFF00D1B2),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                    size: 36,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'AI Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Free conversation with intelligent AI characters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
        'title': 'AI Chat',
        'description': 'Talk with intelligent AI characters',
        'icon': Icons.chat,
        'color': const Color(0xFF8BFFEA),
        'route': '/chat',
        'prompt':
            'You are a friendly AI assistant who can answer various questions. Please respond in English only.',
      },
      {
        'title': 'Text Summarizer',
        'description': 'Intelligent summarization of long texts',
        'icon': Icons.text_fields,
        'color': const Color(0xFF5CDED0),
        'route': '/chat',
        'prompt':
            'You are a professional text summarization assistant. Please summarize the following content concisely. Always respond in English only.',
      },
      {
        'title': 'Translator',
        'description': 'Intelligent multi-language translation',
        'icon': Icons.translate,
        'color': const Color(0xFF00D1B2),
        'route': '/chat',
        'prompt':
            'You are a professional translation assistant. Please translate the following content. Always respond in English only, except for the translated text.',
      },
      {
        'title': 'Code Assistant',
        'description': 'Programming help and code generation',
        'icon': Icons.code,
        'color': const Color(0xFF8BFFEA),
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
        mainAxisExtent: 150,
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
        'title': 'Travel Planning',
        'description': 'Intelligent travel itinerary planning',
        'icon': Icons.flight,
        'color': const Color(0xFF8BFFEA),
        'route': '/chat',
        'prompt':
            'You are a professional travel advisor. Please help me plan an itinerary for the following destination. Always respond in English only.',
      },
      {
        'title': 'Recipe Assistant',
        'description': 'Recipe recommendations based on ingredients',
        'icon': Icons.restaurant,
        'color': const Color(0xFF5CDED0),
        'route': '/chat',
        'prompt':
            'You are a professional chef. Please recommend recipes based on the ingredients I provide. Always respond in English only.',
      },
      {
        'title': 'Creative Writing',
        'description': 'Stories and poetry creation assistant',
        'icon': Icons.edit,
        'color': const Color(0xFF00D1B2),
        'route': '/chat',
        'prompt':
            'You are a creative writing assistant. Please help me create stories, poems, or other creative content based on my request. Always respond in English only.',
      },
      {
        'title': 'Interview Prep',
        'description': 'Interview questions and answer suggestions',
        'icon': Icons.work,
        'color': const Color(0xFF8BFFEA),
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
        mainAxisExtent: 150,
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
        'title': 'Math Solver',
        'description': 'Math problem solutions with steps',
        'icon': Icons.calculate,
        'color': const Color(0xFF8BFFEA),
        'route': '/chat',
        'prompt':
            'You are a professional math teacher. Please help me solve the following math problem and explain the solution steps in detail. Always respond in English only.',
      },
      {
        'title': 'English Learning',
        'description': 'English grammar and writing guidance',
        'icon': Icons.language,
        'color': const Color(0xFF5CDED0),
        'route': '/chat',
        'prompt':
            'You are a professional English teacher. Please help me improve my English writing or answer grammar questions. Always respond in English only.',
      },
      {
        'title': 'History Explorer',
        'description': 'Analysis of historical events and figures',
        'icon': Icons.history_edu,
        'color': const Color(0xFF00D1B2),
        'route': '/chat',
        'prompt':
            'You are a professional historian. Please help me analyze the following historical events or figures. Always respond in English only.',
      },
      {
        'title': 'Science Experiments',
        'description': 'Scientific principles and experiment guidance',
        'icon': Icons.science,
        'color': const Color(0xFF8BFFEA),
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
        mainAxisExtent: 150,
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
                radius: 18,
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
