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

  // 滚动到底部的辅助方法
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      try {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } catch (e) {
        // 忽略滚动错误
        debugPrint('滚动错误: $e');
      }
    }
  }

  // 发送系统消息，告知用户当前助手的功能
  void _sendSystemMessage() {
    final title = widget.title ?? 'AI Assistant';
    final systemMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text:
          'Welcome to $title! Please enter your question, and I\'ll provide professional assistance based on my knowledge.',
      isUser: false,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(systemMessage);
    });

    if (!widget.excludeFromHistory) {
      _chatService.saveChatHistory(widget.user.userId, _messages);
    }

    // 滚动到底部
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

        // 滚动到底部
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = '加载聊天记录失败: $e';
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

    // 滚动到底部
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    try {
      // 模拟AI思考时间
      await Future.delayed(
          Duration(milliseconds: 1000 + math.Random().nextInt(2000)));

      // 调用智谱AI API获取回复，传递自定义提示词
      final aiResponse = await _chatService.getAIResponse(
          text, widget.user.description, widget.user.userId, _customPrompt);

      // 创建AI消息对象
      final aiMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: aiResponse,
        isUser: false,
        timestamp: DateTime.now(),
      );

      // 直接添加AI消息到列表
      if (mounted) {
        setState(() {
          _messages.add(aiMessage);
          _isTyping = false;
        });

        if (!widget.excludeFromHistory) {
          await _chatService.saveChatHistory(widget.user.userId, _messages);
        }

        // 滚动到底部
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _errorMessage = '获取AI回复失败: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage)),
        );
      }
    }
  }

  // 获取AI头像
  Widget _getAIAvatar() {
    if (widget.useSystemAvatar) {
      // 使用系统机器人图标
      return CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Icon(
          Icons.smart_toy,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    } else {
      // 使用自定义头像
      return CircleAvatar(
        backgroundImage: AssetImage(widget.user.avatarPath),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 获取从路由参数传递的标题
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
                  title: const Text('AI角色信息'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.user.description),
                        const SizedBox(height: 16),
                        const Text(
                          '这是一个AI生成的角色，不代表真实人物。该角色的所有信息、照片和对话内容均由人工智能创建，仅用于演示和娱乐目的。',
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
                      child: const Text('关闭'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 错误消息
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

          // 消息列表
          Expanded(
            child: _isLoading && _messages.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                    ? const Center(
                        child: Text('Start chatting with the AI assistant!'))
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          return _buildMessageItem(_messages[index]);
                        },
                      ),
          ),

          // 正在输入指示器
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

          // 输入框
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
                      fillColor: Theme.of(context).colorScheme.surfaceVariant,
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
                  child: const Icon(Icons.send),
                ),
              ],
            ),
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
