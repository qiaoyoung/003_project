import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';
import '../services/chat_service.dart';
import 'dart:math' as math;

class ChatScreen extends StatefulWidget {
  final User user;
  final String? prompt;
  final String? title;
  final bool useSystemAvatar;
  final bool excludeFromHistory;

  const ChatScreen({
    Key? key,
    required this.user,
    this.prompt,
    this.title,
    this.useSystemAvatar = false,
    this.excludeFromHistory = false,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();
  List<Message> _messages = [];
  bool _isLoading = false;
  bool _isTyping = false;
  String? _customPrompt;
  String _errorMessage = '';
  // Flag to control disclaimer visibility
  bool _showDisclaimer = true;

  @override
  void initState() {
    super.initState();
    _customPrompt = widget.prompt;

    if (!widget.excludeFromHistory) {
      _loadChatHistory();
    }

    // 如果有提示词，自动发送一条系统消息
    if (widget.prompt != null && widget.prompt!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _sendSystemMessage();
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll to bottom of the chat
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      try {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } catch (e) {
        // Ignore scroll errors
        debugPrint('Scroll error: $e');
      }
    }
  }

  // 发送系统消息，告知用户当前助手的功能
  void _sendSystemMessage() {
    final title = widget.title ?? 'AI Assistant';

    // 基于不同工具类型生成专业欢迎语
    String welcomeMessage;

    if (title.contains('Chat')) {
      welcomeMessage =
          'Hello! I\'m your AI chat assistant. How can I help you today?';
    } else if (title.contains('Text Summarizer')) {
      welcomeMessage =
          'Welcome to the Text Summarizer. Please paste the content you\'d like me to summarize, and I\'ll create a concise summary highlighting the key points.';
    } else if (title.contains('Translator')) {
      welcomeMessage =
          'Welcome to the Language Translator. Please provide the text you want to translate and specify the target language if needed.';
    } else if (title.contains('Code')) {
      welcomeMessage =
          'Welcome to the Code Assistant. I can help you with programming tasks, code generation, debugging, or explaining code concepts. What would you like help with?';
    } else if (title.contains('Travel')) {
      welcomeMessage =
          'Welcome to Travel Planning! Share your destination interests and preferences, and I\'ll help create a personalized travel itinerary for you.';
    } else if (title.contains('Recipe')) {
      welcomeMessage =
          'Welcome to the Recipe Assistant! Let me know what ingredients you have or what type of dish you\'d like to make, and I\'ll provide recipe suggestions.';
    } else if (title.contains('Writing')) {
      welcomeMessage =
          'Welcome to Creative Writing! I\'m here to help with your writing projects. What kind of creative content would you like to work on today?';
    } else if (title.contains('Interview')) {
      welcomeMessage =
          'Welcome to Interview Preparation! Please tell me about the position you\'re interviewing for, and I\'ll help you prepare with relevant questions and advice.';
    } else if (title.contains('Math')) {
      welcomeMessage =
          'Welcome to the Math Solver. Please share the math problem you\'re working on, and I\'ll guide you through the solution step by step.';
    } else if (title.contains('English')) {
      welcomeMessage =
          'Welcome to English Learning! I can help with grammar, vocabulary, writing, or conversation practice. What aspect of English would you like to work on?';
    } else if (title.contains('History')) {
      welcomeMessage =
          'Welcome to History Explorer! What historical period, event, or figure would you like to learn more about?';
    } else if (title.contains('Science')) {
      welcomeMessage =
          'Welcome to Science Experiments! I can suggest experiments and explain scientific concepts. What scientific topic are you interested in exploring?';
    } else {
      welcomeMessage =
          'Welcome to $title! Please enter your question, and I\'ll provide specialized assistance based on my knowledge.';
    }

    final systemMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: welcomeMessage,
      isUser: false,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(systemMessage);
    });

    if (!widget.excludeFromHistory) {
      _chatService.saveChatHistory(widget.user.userId, _messages);
    }

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  Future<void> _loadChatHistory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final messages = await _chatService.getChatHistory(widget.user.userId);

      if (mounted) {
        setState(() {
          _messages = messages;
          _isLoading = false;
        });

        // Scroll to bottom
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to load chat history: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage)),
        );
      }
    }
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final userMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
      _messageController.clear();
      _isTyping = true;
      _errorMessage = '';
    });

    if (!widget.excludeFromHistory) {
      await _chatService.saveChatHistory(widget.user.userId, _messages);
    }

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    try {
      // Simulate AI thinking time
      await Future.delayed(
          Duration(milliseconds: 1000 + math.Random().nextInt(2000)));

      // Call ZhiPu AI API to get a response, passing custom prompt
      final aiResponse = await _chatService.getAIResponse(
          text, widget.user.description, widget.user.userId, _customPrompt);

      // Create AI message object
      final aiMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: aiResponse,
        isUser: false,
        timestamp: DateTime.now(),
      );

      // Directly add AI message to list
      if (mounted) {
        setState(() {
          _messages.add(aiMessage);
          _isTyping = false;
        });

        if (!widget.excludeFromHistory) {
          await _chatService.saveChatHistory(widget.user.userId, _messages);
        }

        // Scroll to bottom
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _errorMessage = 'Failed to get AI response: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage)),
        );
      }
    }
  }

  // Get AI avatar
  Widget _getAIAvatar() {
    if (widget.useSystemAvatar) {
      // Use system robot icon
      return CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Icon(
          Icons.smart_toy,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    } else {
      // Use custom avatar
      return CircleAvatar(
        backgroundImage: AssetImage(widget.user.avatarPath),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenTitle = widget.title ?? widget.user.nickname;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            _getAIAvatar(),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                screenTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('AI Character Information'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.user.description),
                        const SizedBox(height: 16),
                        const Text(
                          'This is an AI-generated character and does not represent a real person. All information, photos, and conversations with this character are created by artificial intelligence for educational and entertainment purposes only.',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
          // 内容
          Column(
            children: [
              // Disclaimer banner
              if (_showDisclaimer)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.amber.shade700,
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'For entertainment purposes only. This app does not provide financial, medical, or legal services.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            _showDisclaimer = false;
                          });
                        },
                      )
                    ],
                  ),
                ),
              // Error message
              if (_errorMessage.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red.withOpacity(0.1),
                  width: double.infinity,
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // Message list
              Expanded(
                child: _isLoading && _messages.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : _messages.isEmpty
                        ? const Center(
                            child:
                                Text('Start chatting with the AI assistant!'))
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(16),
                            itemCount: _messages.length,
                            itemBuilder: (context, index) {
                              return _buildMessageItem(_messages[index]);
                            },
                          ),
              ),

              // Typing indicator
              if (_isTyping)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: _getAIAvatar(),
                      ),
                      const SizedBox(width: 12),
                      const Text('Typing...'),
                    ],
                  ),
                ),

              // Input box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.surfaceVariant,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _isTyping ? null : _sendMessage(),
                        enabled: !_isTyping,
                      ),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: _isTyping ? null : _sendMessage,
                      mini: true,
                      backgroundColor: const Color(0xFF2BBCFB), // 使用主题色
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Message message) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            SizedBox(
              width: 32,
              height: 32,
              child: _getAIAvatar(),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(
                      color: isUser
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      color: isUser
                          ? Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.7)
                          : Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 12),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(time.year, time.month, time.day);

    if (messageDate == today) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      return '${time.month}/${time.day} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}
