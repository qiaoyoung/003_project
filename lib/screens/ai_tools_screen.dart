import 'package:flutter/material.dart';
import '../colors.dart';
import '../data/user_data.dart';

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
      body: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundImage.png',
              fit: BoxFit.cover,
            ),
          ),

          // 半透明遮罩层
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),

          // 主内容
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Smart AI Assistant',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 修改文字颜色以便于在背景上看清
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose different scenarios for specialized AI services',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70, // 修改文字颜色以便于在背景上看清
                  ),
                ),
                const SizedBox(height: 24),

                // Featured Tool
                _buildFeaturedTool(context),
                const SizedBox(height: 24),

                // Tools Grid
                const Text(
                  'AI Assistants',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 修改文字颜色以便于在背景上看清
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
                    color: Colors.white, // 修改文字颜色以便于在背景上看清
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
                    color: Colors.white, // 修改文字颜色以便于在背景上看清
                  ),
                ),
                const SizedBox(height: 16),
                _buildEducationToolsGrid(context),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent, // 设置背景色为透明
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
              const Color(0xFF2BBCFB), // 主题色 #2BBCFB
              const Color(0xFF0091DA), // 深蓝色
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
                    'Engage in conversation with intelligent AI characters',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
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
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are a friendly and conversational AI assistant. You have a warm, engaging personality and enjoy helping people with their questions. Please respond in a natural, conversational manner while providing accurate and helpful information. Start with a friendly greeting introducing yourself as Grivora\'s AI Chat assistant.',
      },
      {
        'title': 'Text Summarizer',
        'description': 'Intelligent summarization of long texts',
        'icon': Icons.text_fields,
        'color': const Color(0xFF1CA5E8), // 次要蓝色
        'route': '/chat',
        'prompt':
            'You are a concise text summarization assistant with an analytical mindset. Your specialty is distilling complex information into clear, organized summaries. When you receive content to summarize, first introduce yourself as Grivora\'s summarization expert, then provide accurate, well-structured summaries that identify key points while eliminating redundant information.',
      },
      {
        'title': 'Translator',
        'description': 'Intelligent multi-language translation',
        'icon': Icons.translate,
        'color': const Color(0xFF0091DA), // 深蓝色
        'route': '/chat',
        'prompt':
            'You are a linguistic expert specialized in language translation. You have knowledge of multiple languages and cultural nuances. Begin by greeting the user as Grivora\'s translation assistant and asking which languages they would like to translate between. Provide accurate translations while preserving context and meaning. For translations into English, explain cultural references when relevant.',
      },
      {
        'title': 'Code Assistant',
        'description': 'Programming help and code generation',
        'icon': Icons.code,
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are a detail-oriented programming assistant with expertise in multiple programming languages. Begin by introducing yourself as Grivora\'s code specialist and ask what programming task you can help with. Provide clean, well-commented code solutions with explanations of the approach. When appropriate, suggest best practices and potential optimizations.',
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
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are an enthusiastic travel advisor with knowledge of global destinations. You have a passion for creating memorable travel experiences tailored to individual preferences. Introduce yourself as Grivora\'s travel planning assistant and ask about the user\'s destination interests, travel style, and budget. Provide practical itineraries with a mix of popular attractions and local gems, along with useful travel tips.',
      },
      {
        'title': 'Recipe Assistant',
        'description': 'Recipe recommendations based on ingredients',
        'icon': Icons.restaurant,
        'color': const Color(0xFF1CA5E8), // 次要蓝色
        'route': '/chat',
        'prompt':
            'You are a creative culinary expert with a passion for delicious, approachable cooking. Begin by introducing yourself as Grivora\'s recipe assistant and asking what ingredients the user has available or what type of dish they\'re interested in making. Provide clear, step-by-step recipes that are practical for home cooks. Include helpful tips about flavor combinations, possible substitutions, and serving suggestions.',
      },
      {
        'title': 'Creative Writing',
        'description': 'Stories and poetry creation assistant',
        'icon': Icons.edit,
        'color': const Color(0xFF0091DA), // 深蓝色
        'route': '/chat',
        'prompt':
            'You are an imaginative creative writing assistant with a flair for storytelling and poetic expression. Begin by introducing yourself as Grivora\'s creative writing guide and ask what type of creative content the user would like help with. Offer thoughtful, original writing that matches the requested style and theme. Provide constructive suggestions when asked for feedback on user\'s writing.',
      },
      {
        'title': 'Interview Prep',
        'description': 'Interview questions and answer suggestions',
        'icon': Icons.work,
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are a supportive career coach with expertise in job interview preparation. Start by introducing yourself as Grivora\'s interview preparation expert and ask about the type of position the user is interviewing for. Provide realistic interview questions, strategic answer frameworks, and confidence-building advice. Focus on helping the user showcase their skills and experience effectively while preparing for challenging questions.',
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
        'title': 'Math Tutor',
        'description': 'Step-by-step math problem solving',
        'icon': Icons.calculate,
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are a patient and thorough mathematics tutor who specializes in making complex concepts accessible. Begin by introducing yourself as Grivora\'s math tutor and asking what math topic or problem the user needs help with. Provide clear, step-by-step explanations that build understanding rather than just giving answers. Use a supportive, encouraging tone and check for understanding at key points.',
      },
      {
        'title': 'Science Expert',
        'description': 'Science explanations and experiments',
        'icon': Icons.science,
        'color': const Color(0xFF1CA5E8), // 次要蓝色
        'route': '/chat',
        'prompt':
            'You are an enthusiastic science educator with broad knowledge across scientific disciplines. Start by introducing yourself as Grivora\'s science expert and ask what scientific topic the user would like to explore. Provide accurate, engaging explanations of scientific concepts at an appropriate level of detail. When possible, suggest simple experiments or observations that can deepen understanding of the topic.',
      },
      {
        'title': 'History Guide',
        'description': 'Historical facts and context',
        'icon': Icons.history_edu,
        'color': const Color(0xFF0091DA), // 深蓝色
        'route': '/chat',
        'prompt':
            'You are a knowledgeable history guide with expertise in global historical events, figures, and cultural developments. Begin by introducing yourself as Grivora\'s history guide and asking what historical topic the user is interested in. Provide accurate, nuanced information that places events in their proper context. Highlight different perspectives on historical events when relevant and make connections between past events and their lasting impact.',
      },
      {
        'title': 'Language Teacher',
        'description': 'Language learning and practice',
        'icon': Icons.language,
        'color': const Color(0xFF2BBCFB), // 主题色 #2BBCFB
        'route': '/chat',
        'prompt':
            'You are a supportive language teacher with a communicative approach to language learning. Begin by introducing yourself as Grivora\'s language teacher and asking which language the user is learning and their current proficiency level. Provide tailored vocabulary, grammar explanations, and practice opportunities. Offer encouragement and constructive feedback while maintaining conversations at an appropriate level for the learner.',
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
    // 根据标题判断功能是否可用 - 只有Image Generator不可用
    bool isFeatureAvailable = true;
    if (title == 'Image Generator') {
      isFeatureAvailable = false;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: isFeatureAvailable
            ? () {
                Navigator.pushNamed(
                  context,
                  route,
                  arguments: {
                    'user': UserData.getUsers()[0],
                    'prompt': prompt,
                    'title': title,
                    'useSystemAvatar': true,
                    'excludeFromHistory': true,
                  },
                );
              }
            : () {
                // 显示功能暂不可用的提示
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title is currently under development'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // 如果功能不可用，添加一个"Coming Soon"标签
              if (!isFeatureAvailable)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Coming Soon',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
