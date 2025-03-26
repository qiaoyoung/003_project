import 'package:flutter/material.dart';
import '../colors.dart';
import '../services/user_preference_service.dart';
import '../data/user_data.dart';
import '../models/user_model.dart';

class BlacklistScreen extends StatefulWidget {
  const BlacklistScreen({Key? key}) : super(key: key);

  @override
  State<BlacklistScreen> createState() => _BlacklistScreenState();
}

class _BlacklistScreenState extends State<BlacklistScreen> {
  final UserPreferenceService _preferenceService = UserPreferenceService();
  List<String> _blacklistedUserIds = [];
  Map<String, User> _userMap = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlacklist();
  }

  Future<void> _loadBlacklist() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final blacklist = await _preferenceService.getBlacklistedUserIds();

      // 获取所有AI角色数据
      final allUsers = UserData.getUsers();
      final userMap = {for (var user in allUsers) user.userId: user};

      setState(() {
        _blacklistedUserIds = blacklist;
        _userMap = userMap;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Failed to load blacklist, please try again later')),
        );
      }
    }
  }

  Future<void> _removeFromBlacklist(String userId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final success = await _preferenceService.removeUserFromBlacklist(userId);

      if (success) {
        await _loadBlacklist();
      } else {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'Failed to remove from blacklist, please try again later')),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Failed to remove from blacklist, please try again later')),
        );
      }
    }
  }

  void _showRemoveConfirmation(String userId) {
    final user = _userMap[userId];
    final name = user?.nickname ?? 'AI Character $userId';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove from Blacklist'),
        content: Text('Are you sure you want to remove $name from blacklist?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _removeFromBlacklist(userId);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blacklist'),
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
          _blacklistedUserIds.isEmpty && !_isLoading
              ? _buildEmptyState()
              : _buildBlacklistView(),

          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.block,
            size: 80,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your blacklist is empty',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Click the block button on the AI character detail page to add them to the blacklist',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBlacklistView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 顶部提醒文案
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Text(
            'You will not receive messages from any of the contacts in the list',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),

        // 黑名单列表
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _blacklistedUserIds.length,
            itemBuilder: (context, index) {
              final userId = _blacklistedUserIds[index];
              final user = _userMap[userId];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        user != null ? AssetImage(user.avatarPath) : null,
                    backgroundColor: user == null ? Colors.grey[200] : null,
                    child: user == null
                        ? const Icon(Icons.block, color: Colors.red)
                        : null,
                  ),
                  title: Text(
                    user?.nickname ?? 'AI Character $userId',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () => _removeFromBlacklist(userId),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                    ),
                    child: const Text(
                      'relieve',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
