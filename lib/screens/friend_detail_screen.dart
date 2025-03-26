import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../colors.dart';
import 'chat_screen.dart';
import '../services/user_preference_service.dart';
import 'dart:math';

class FriendDetailScreen extends StatefulWidget {
  final User user;

  const FriendDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen> {
  bool messageReminder = false;
  bool inBlacklist = false;
  final UserPreferenceService _preferenceService = UserPreferenceService();
  bool _isLoading = false;
  late String _randomId;

  @override
  void initState() {
    super.initState();
    _loadUserPreferences();
    _generateRandomId();
  }

  void _generateRandomId() {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    _randomId =
        List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  }

  Future<void> _loadUserPreferences() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final isBlacklisted =
          await _preferenceService.isUserBlacklisted(widget.user.userId);

      setState(() {
        inBlacklist = isBlacklisted;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading user preferences: $e');
    }
  }

  Future<void> _toggleBlacklist() async {
    setState(() {
      _isLoading = true;
    });

    try {
      bool success;

      if (inBlacklist) {
        success = await _preferenceService
            .removeUserFromBlacklist(widget.user.userId);
      } else {
        success =
            await _preferenceService.addUserToBlacklist(widget.user.userId);
      }

      if (success) {
        setState(() {
          inBlacklist = !inBlacklist;
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(inBlacklist
                ? '${widget.user.nickname} has been added to blacklist'
                : '${widget.user.nickname} has been removed from blacklist'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Operation failed, please try again later'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _removeFriend() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final success =
          await _preferenceService.removeUserFromFavorites(widget.user.userId);

      if (success) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${widget.user.nickname} has been removed from AI Friends'),
            duration: const Duration(seconds: 2),
          ),
        );

        // 返回上一页
        Navigator.pop(context, true); // 传递true表示已移除好友
      } else {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to remove friend, please try again later'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showRemoveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Friend'),
        content: Text(
            'Are you sure you want to remove ${widget.user.nickname} from AI Friends?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _removeFriend();
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showReportDialog() {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Report ${widget.user.nickname}'),
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
                    'Pornographic content', reasonController),
                _buildReportReasonChip(
                    'Political sensitivity', reasonController),
                _buildReportReasonChip('Violence', reasonController),
                _buildReportReasonChip('Scam', reasonController),
                _buildReportReasonChip('Harassment', reasonController),
                _buildReportReasonChip('False information', reasonController),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Other reasons (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
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
              final reason = reasonController.text.trim().isEmpty
                  ? 'No reason provided'
                  : reasonController.text.trim();
              _submitReport(reason);
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildReportReasonChip(
      String reason, TextEditingController controller) {
    return ChoiceChip(
      label: Text(reason),
      selected: controller.text == reason,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            controller.text = reason;
          });
        }
      },
    );
  }

  Future<void> _submitReport(String reason) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final success =
          await _preferenceService.reportUser(widget.user.userId, reason);

      setState(() {
        _isLoading = false;
      });

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.user.nickname} has been reported'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to submit report, please try again later'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showRenameDialog() {
    final TextEditingController controller =
        TextEditingController(text: widget.user.nickname);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Remark Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter remark name',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                // 保存备注名称
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Remark name updated'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 内容延伸到顶部
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0, // 隐藏AppBar
        automaticallyImplyLeading: false,
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

          // 主内容
          SafeArea(
            child: Column(
              children: [
                // 自定义顶部导航栏
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                // 用户头像和简介
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(widget.user.avatarPath),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.user.nickname,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _randomId,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // 发送消息按钮
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.message, color: Colors.white),
                      label: const Text('Message',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5E75FD),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatScreen(user: widget.user),
                            ));
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 设置项列表
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                        bottom: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 备注
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8BF0A4),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  const Icon(Icons.edit, color: Colors.white),
                            ),
                            title: const Text('Remark Name'),
                            subtitle: Text(
                              widget.user.nickname,
                              style: const TextStyle(
                                color: Color(0xFF2BBCFB),
                              ),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: _showRenameDialog,
                          ),

                          const Divider(height: 1),

                          // 个人签名
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF5FB3F9),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  const Icon(Icons.person, color: Colors.white),
                            ),
                            title: const Text('Personal Signature'),
                            subtitle: Text(
                              "A veteran rock musician who also likes extreme sports and cooking",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              // 显示完整签名的对话框
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Personal Signature'),
                                  content: const Text(
                                    "A veteran rock musician who also likes extreme sports and cooking",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const Divider(height: 1),

                          // 消息提醒
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFEC85E),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications,
                                  color: Colors.white),
                            ),
                            title: const Text('Message Reminder'),
                            trailing: Switch(
                              value: messageReminder,
                              onChanged: (value) {
                                setState(() {
                                  messageReminder = value;
                                });
                              },
                              activeColor: AppColors.primaryColor,
                            ),
                          ),

                          const Divider(height: 1),

                          // 黑名单
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8D94AC),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  const Icon(Icons.block, color: Colors.white),
                            ),
                            title: const Text('Join the Blacklist'),
                            trailing: Switch(
                              value: inBlacklist,
                              onChanged: (value) {
                                _toggleBlacklist();
                              },
                              activeColor: AppColors.primaryColor,
                            ),
                          ),

                          const Divider(height: 1),

                          // 举报
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF97A7A),
                                shape: BoxShape.circle,
                              ),
                              child:
                                  const Icon(Icons.flag, color: Colors.white),
                            ),
                            title: const Text('Report'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: _showReportDialog,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 底部删除按钮
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    width: 60,
                    height: 60,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: _showRemoveConfirmationDialog,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF97A7A),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 加载中遮罩
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
}
