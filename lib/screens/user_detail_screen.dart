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
                ? '已将${user.nickname}加入黑名单'
                : '已将${user.nickname}从黑名单中移除'),
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
            content: Text('操作失败，请稍后重试'),
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
                ? '已将${user.nickname}添加到收藏'
                : '已将${user.nickname}从收藏中移除'),
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
            content: const Text('操作失败，请稍后重试'),
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
        title: Text('举报 ${user.nickname}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('请选择举报原因：'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildReportReasonChip('色情低俗', _reasonController),
                _buildReportReasonChip('政治敏感', _reasonController),
                _buildReportReasonChip('暴力血腥', _reasonController),
                _buildReportReasonChip('诈骗信息', _reasonController),
                _buildReportReasonChip('侮辱谩骂', _reasonController),
                _buildReportReasonChip('虚假信息', _reasonController),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                hintText: '其他原因（选填）',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              final reason = _reasonController.text.trim().isEmpty
                  ? '未指定原因'
                  : _reasonController.text.trim();

              // 先关闭对话框
              Navigator.of(context).pop();

              // 然后在主界面处理举报逻辑
              _submitReport(user, reason);
            },
            child: const Text('提交'),
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
          content: Text(success ? '举报成功，感谢您的反馈' : '举报失败，请稍后重试'),
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
                    tooltip: _isFavorited ? '取消收藏' : '添加到收藏',
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
                    tooltip: _isBlacklisted ? '移出黑名单' : '加入黑名单',
                    onPressed: _isLoading ? null : () => _toggleBlacklist(user),
                  ),
                  // 举报按钮
                  IconButton(
                    icon: Icon(
                      _isReported ? Icons.report : Icons.report_outlined,
                      color: _isReported ? Colors.orange : Colors.white,
                    ),
                    tooltip: _isReported ? '已举报' : '举报',
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
                                  '${user.age}岁',
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
                                  '该用户已被您加入黑名单，您将不会再收到来自该用户的消息。',
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
                        '个人描述',
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
                        '标签',
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
                        'AI生成内容',
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
                              '这是一个AI生成的角色，不代表真实人物。该角色的所有信息、照片和对话内容均由人工智能创建，仅用于演示和娱乐目的。',
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
                              '您可以与此AI角色进行互动，但请记住这只是一个虚拟角色。',
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
                        '基本信息',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoItem(
                          context, Icons.work, '职业', user.occupation),
                      _buildInfoItem(context, Icons.person, '性别', user.gender),
                      _buildInfoItem(context, Icons.cake, '年龄', '${user.age}岁'),
                      _buildInfoItem(
                          context, Icons.public, '民族', user.ethnicity),
                      _buildInfoItem(
                          context, Icons.location_city, '背景', user.background),
                      _buildInfoItem(context, Icons.access_time, '最近活跃',
                          _formatLastActive(user.lastActive)),
                      _buildInfoItem(context, Icons.message, '消息数',
                          '${user.messageCount}条'),

                      const SizedBox(height: 24),

                      // 互动选项
                      Text(
                        '互动选项',
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
                            _isBlacklisted ? '已拉黑，无法对话' : '开始AI对话',
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
                                _isFavorited ? '取消收藏' : '添加到收藏',
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
                              '免责声明',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '本应用中的所有AI角色均为虚构，任何与现实人物的相似之处纯属巧合。AI生成的内容可能存在不准确或不适当的情况，我们不对其准确性或适当性做任何保证。',
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
      return '刚刚';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else {
      return DateFormat('yyyy-MM-dd').format(lastActive);
    }
  }
}
