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
          const SnackBar(content: Text('加载黑名单失败，请稍后再试')),
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
            const SnackBar(content: Text('移除黑名单失败，请稍后再试')),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('移除黑名单失败，请稍后再试')),
        );
      }
    }
  }

  void _showRemoveConfirmation(String userId) {
    final user = _userMap[userId];
    final name = user?.nickname ?? 'AI角色 $userId';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('移除黑名单'),
        content: Text('确定要将$name从黑名单中移除吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _removeFromBlacklist(userId);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('黑名单'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
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
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '您的黑名单为空',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '在AI角色详情页点击拉黑按钮将其加入黑名单',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlacklistView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _blacklistedUserIds.length,
      itemBuilder: (context, index) {
        final userId = _blacklistedUserIds[index];
        final user = _userMap[userId];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundImage:
                  user != null ? AssetImage(user.avatarPath) : null,
              backgroundColor: user == null ? Colors.red[100] : null,
              child: user == null
                  ? const Icon(Icons.block, color: Colors.red)
                  : null,
            ),
            title: Text(
              user?.nickname ?? 'AI角色 $userId',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user?.occupation ?? '已加入黑名单'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => _showRemoveConfirmation(userId),
            ),
          ),
        );
      },
    );
  }
}
