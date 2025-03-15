import 'package:flutter/material.dart';
import '../colors.dart';
import '../services/user_preference_service.dart';
import '../data/user_data.dart';
import '../models/user_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final UserPreferenceService _preferenceService = UserPreferenceService();
  List<String> _favoriteUserIds = [];
  Map<String, User> _userMap = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final favorites = await _preferenceService.getFavoriteUserIds();

      // 获取所有AI角色数据
      final allUsers = UserData.getUsers();
      final userMap = {for (var user in allUsers) user.userId: user};

      setState(() {
        _favoriteUserIds = favorites;
        _userMap = userMap;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('加载收藏列表失败，请稍后再试')),
        );
      }
    }
  }

  Future<void> _removeFromFavorites(String userId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final success = await _preferenceService.removeUserFromFavorites(userId);

      if (success) {
        await _loadFavorites();
      } else {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('移除收藏失败，请稍后再试')),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('移除收藏失败，请稍后再试')),
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
        title: const Text('移除收藏'),
        content: Text('确定要将$name从收藏中移除吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _removeFromFavorites(userId);
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
        title: const Text('我的收藏'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _favoriteUserIds.isEmpty && !_isLoading
              ? _buildEmptyState()
              : _buildFavoritesList(),
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
            Icons.favorite_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '您还没有收藏任何AI角色',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '在AI角色详情页点击收藏按钮添加到收藏',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _favoriteUserIds.length,
      itemBuilder: (context, index) {
        final userId = _favoriteUserIds[index];
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
              backgroundColor: user == null ? Colors.pink[100] : null,
              child: user == null
                  ? const Icon(Icons.favorite, color: Colors.pink)
                  : null,
            ),
            title: Text(
              user?.nickname ?? 'AI角色 $userId',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user?.occupation ?? '已收藏'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => _showRemoveConfirmation(userId),
            ),
            onTap: () {
              // 导航到AI角色详情页
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => UserDetailScreen(userId: userId),
              //   ),
              // );
            },
          ),
        );
      },
    );
  }
}
