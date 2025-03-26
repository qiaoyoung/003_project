import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';
import 'chat_screen.dart';
import '../services/user_preference_service.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final UserPreferenceService _userPreferenceService = UserPreferenceService();
  bool _isBlacklisted = false;
  bool _isReported = false;
  bool _isFavorited = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 在initState中不能直接使用context，所以我们在didChangeDependencies中加载数据
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserPreferences();
  }

  Future<void> _loadUserPreferences() async {
    if (!mounted) return;

    final User user = ModalRoute.of(context)!.settings.arguments as User;

    setState(() {
      _isLoading = true;
    });

    final isBlacklisted =
        await _userPreferenceService.isUserBlacklisted(user.userId);
    final isReported = await _userPreferenceService.isUserReported(user.userId);
    final isFavorited =
        await _userPreferenceService.isUserFavorited(user.userId);

    if (!mounted) return;

    setState(() {
      _isBlacklisted = isBlacklisted;
      _isReported = isReported;
      _isFavorited = isFavorited;
      _isLoading = false;
    });
  }

  Future<void> _toggleBlacklist(User user) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    // 模拟网络延时
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    bool success;
    if (_isBlacklisted) {
      success =
          await _userPreferenceService.removeUserFromBlacklist(user.userId);
    } else {
      success = await _userPreferenceService.addUserToBlacklist(user.userId);
    }

    if (!mounted) return;

    if (success) {
      setState(() {
        _isBlacklisted = !_isBlacklisted;
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isBlacklisted
                ? '${user.nickname} has been added to blacklist'
                : '${user.nickname} has been removed from blacklist'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Operation failed, please try again later'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _toggleFavorite(User user) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    // 模拟网络延时
    await Future.delayed(const Duration(milliseconds: 1000));

    if (!mounted) return;

    bool success;
    if (_isFavorited) {
      success =
          await _userPreferenceService.removeUserFromFavorites(user.userId);
    } else {
      success = await _userPreferenceService.addUserToFavorites(user.userId);
    }

    if (!mounted) return;

    if (success) {
      setState(() {
        _isFavorited = !_isFavorited;
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isFavorited
                ? '${user.nickname} has been added to AI Friends'
                : '${user.nickname} has been removed from AI Friends'),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Operation failed, please try again later'),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showReportDialog(User user) {
    final TextEditingController _reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Report ${user.nickname}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please select a reason:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildReportReasonChip(
                    'Pornographic content', _reasonController),
                _buildReportReasonChip(
                    'Political sensitivity', _reasonController),
                _buildReportReasonChip('Violence', _reasonController),
                _buildReportReasonChip('Scam', _reasonController),
                _buildReportReasonChip('Harassment', _reasonController),
                _buildReportReasonChip('False information', _reasonController),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                hintText: 'Other reasons (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final reason = _reasonController.text.trim().isEmpty
                  ? 'No reason specified'
                  : _reasonController.text.trim();

              // 先关闭对话框
              Navigator.of(context).pop();

              // 然后在主界面处理举报逻辑
              _submitReport(user, reason);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  // 将举报提交逻辑分离到单独的方法
  Future<void> _submitReport(User user, String reason) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    // 模拟网络延时
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    final success =
        await _userPreferenceService.reportUser(user.userId, reason);

    if (!mounted) return;

    setState(() {
      if (success) {
        _isReported = true;
      }
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success
              ? 'Report submitted successfully, thank you for your feedback'
              : 'Report failed, please try again later'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildReportReasonChip(
      String reason, TextEditingController controller) {
    return ChoiceChip(
      label: Text(reason),
      selected: controller.text == reason,
      onSelected: (selected) {
        if (selected) {
          controller.text = reason;
        } else if (controller.text == reason) {
          controller.text = '';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 顶部应用栏
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                actions: [
                  // 收藏按钮
                  IconButton(
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorited ? Colors.red : Colors.white,
                    ),
                    tooltip: _isFavorited
                        ? 'Remove from Favorites'
                        : 'Add to Favorites',
                    onPressed: _isLoading ? null : () => _toggleFavorite(user),
                  ),
                  // 拉黑按钮
                  IconButton(
                    icon: Icon(
                      _isBlacklisted
                          ? Icons.person_off
                          : Icons.person_off_outlined,
                      color: _isBlacklisted ? Colors.red : Colors.white,
                    ),
                    tooltip: _isBlacklisted
                        ? 'Remove from Blacklist'
                        : 'Add to Blacklist',
                    onPressed: _isLoading ? null : () => _toggleBlacklist(user),
                  ),
                  // 举报按钮
                  IconButton(
                    icon: Icon(
                      _isReported ? Icons.report : Icons.report_outlined,
                      color: _isReported ? Colors.orange : Colors.white,
                    ),
                    tooltip: _isReported ? 'Reported' : 'Report',
                    onPressed: _isLoading || _isReported
                        ? null
                        : () => _showReportDialog(user),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // 用户头像作为背景
                      Image.asset(
                        user.avatarPath,
                        fit: BoxFit.cover,
                      ),
                      // 渐变遮罩
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      // 用户基本信息
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.nickname,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  user.location,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '${user.age} years old',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 用户详细信息
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 黑名单提示（如果用户在黑名单中）
                      if (_isBlacklisted)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.red.withOpacity(0.3)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.warning_amber_rounded,
                                  color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'This user has been added to your blacklist. You will no longer receive messages from this user.',
                                  style: TextStyle(
                                    color: Colors.red.shade300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      // 个人描述
                      Text(
                        'Personal Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 标签
                      Text(
                        'Tags',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: user.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: tag.color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tag.name,
                              style: TextStyle(
                                fontSize: 14,
                                color: tag.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 24),

                      // AI生成内容
                      Text(
                        'AI Generated Content',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'This is an AI-generated character and does not represent a real person. All information, photos, and conversation content for this character are created by artificial intelligence for educational and entertainment purposes only.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'You can interact with this AI character, but please remember that it is only a virtual character.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 基本信息
                      Text(
                        'Basic Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoItem(
                          context, Icons.work, 'Occupation', user.occupation),
                      _buildInfoItem(
                          context, Icons.person, 'Gender', user.gender),
                      _buildInfoItem(
                          context, Icons.cake, 'Age', '${user.age} years old'),
                      _buildInfoItem(
                          context, Icons.public, 'Ethnicity', user.ethnicity),
                      _buildInfoItem(context, Icons.location_city, 'Background',
                          user.background),
                      _buildInfoItem(context, Icons.access_time, 'Last Active',
                          _formatLastActive(user.lastActive)),
                      _buildInfoItem(context, Icons.message, 'Message Count',
                          '${user.messageCount} messages'),

                      const SizedBox(height: 24),

                      // 互动选项
                      Text(
                        'Interaction Options',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 互动按钮
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isBlacklisted
                              ? null
                              : () {
                                  // 开始对话，跳转到聊天页面
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChatScreen(user: user),
                                    ),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBackgroundColor:
                                Colors.grey.withOpacity(0.3),
                          ),
                          child: Text(
                            _isBlacklisted
                                ? 'Blacklisted, Cannot Chat'
                                : 'Start AI Conversation',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _isBlacklisted ? Colors.grey : null,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // 收藏按钮
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed:
                              _isLoading ? null : () => _toggleFavorite(user),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                                color: _isFavorited ? Colors.red : null,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _isFavorited
                                    ? 'Remove from AI Friends'
                                    : 'Add to AI Friends',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isFavorited ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 免责声明
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Disclaimer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'All AI characters in this application are fictional, and any resemblance to real persons is purely coincidental. AI-generated content may be inaccurate or inappropriate, and we make no guarantees regarding its accuracy or appropriateness.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 加载指示器
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatLastActive(DateTime lastActive) {
    final now = DateTime.now();
    final difference = now.difference(lastActive);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('yyyy-MM-dd').format(lastActive);
    }
  }
}
