import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';
import '../services/chat_service.dart';
import '../data/user_data.dart';
import '../colors.dart'; // 导入颜色定义
import 'chat_screen.dart';
import 'dart:async';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen>
    with WidgetsBindingObserver {
  final ChatService _chatService = ChatService();
  Map<String, List<Message>> _allChatHistories = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAllChatHistories();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadAllChatHistories();
    }
  }

  // 加载所有聊天历史，模拟网络延迟
  Future<void> _loadAllChatHistories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final allChats = await _chatService.getAllChatHistories();
      setState(() {
        _allChatHistories = allChats;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load chat history: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor, // 使用主题色作为导航栏背景
        elevation: 0,
        title: const Text(
          'Chat History',
          style: TextStyle(color: Colors.black87), // 修改文字颜色为黑色以便于在主题色背景上看清
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _loadAllChatHistories,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _allChatHistories.isEmpty
                ? _buildEmptyState()
                : _buildChatHistoryList(),
      ),
    );
  }

  Widget _buildEmptyState() {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 80,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                const Text(
                  'No Chat Records',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start a conversation with AI characters, records will appear here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user_list');
                  },
                  icon: const Icon(Icons.people),
                  label: const Text('Choose AI Characters'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatHistoryList() {
    // 获取所有用户数据
    final List<User> allUsers = UserData.getUsers();

    // 创建一个包含聊天记录的用户列表
    final List<MapEntry<String, List<Message>>> chatEntries =
        _allChatHistories.entries.toList();

    // 按最后一条消息的时间排序
    chatEntries.sort((a, b) {
      final DateTime lastTimeA = a.value.isNotEmpty
          ? a.value.last.timestamp
          : DateTime.fromMillisecondsSinceEpoch(0);
      final DateTime lastTimeB = b.value.isNotEmpty
          ? b.value.last.timestamp
          : DateTime.fromMillisecondsSinceEpoch(0);
      return lastTimeB.compareTo(lastTimeA); // 降序排列
    });

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: chatEntries.length,
      itemBuilder: (context, index) {
        final String userId = chatEntries[index].key;
        final List<Message> messages = chatEntries[index].value;

        // 查找对应的用户
        final User user = allUsers.firstWhere(
          (user) => user.userId == userId,
          orElse: () => allUsers[0], // 如果找不到，返回第一个用户作为默认值
        );

        // 如果消息为空，跳过
        if (messages.isEmpty) {
          return const SizedBox.shrink();
        }

        // 获取最后一条消息和时间
        final Message lastMessage = messages.last;
        final String lastMessagePreview = lastMessage.text.length > 30
            ? '${lastMessage.text.substring(0, 30)}...'
            : lastMessage.text;

        return Dismissible(
          key: Key(userId),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Chat History'),
                content: Text(
                    'Are you sure you want to delete all chat history with ${user.nickname}? This action cannot be undone.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Delete'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) async {
            await _chatService.deleteChatHistory(userId);
            setState(() {
              _allChatHistories.remove(userId);
            });
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Chat history with ${user.nickname} has been deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Undo delete operation
                      _chatService.saveChatHistory(userId, messages);
                      _loadAllChatHistories();
                    },
                  ),
                ),
              );
            }
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(user: user),
                  ),
                ).then((_) => _loadAllChatHistories()); // 返回时刷新列表
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // 用户头像
                    CircleAvatar(
                      backgroundImage: AssetImage(user.avatarPath),
                      radius: 28,
                    ),
                    const SizedBox(width: 16),
                    // 用户信息和最后消息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                user.nickname,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _formatTime(lastMessage.timestamp),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lastMessagePreview,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.7),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(time.year, time.month, time.day);

    if (messageDate == today) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return '${time.month}/${time.day}';
    }
  }
}
