import 'package:flutter/material.dart';
import '../colors.dart';
import '../services/user_preference_service.dart';
import '../data/user_data.dart';
import '../models/user_model.dart';
import 'friend_detail_screen.dart';

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
          const SnackBar(
              content:
                  Text('Failed to load AI Friends, please try again later')),
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
            const SnackBar(
                content: Text(
                    'Failed to remove from AI Friends, please try again later')),
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
                  'Failed to remove from AI Friends, please try again later')),
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
        title: const Text('Remove from AI Friends'),
        content: Text('Are you sure you want to remove $name from AI Friends?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _removeFromFavorites(userId);
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
        title: const Text('My AI Friends'),
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
          // 内容
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
            'You have not added any AI Friends yet',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Click the heart button on the AI character detail page to add them as friends',
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
              user?.nickname ?? 'AI Character $userId',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user?.occupation ?? 'Collected'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 导航到AI好友详情页
              if (user != null) {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => FriendDetailScreen(user: user),
                  ),
                )
                    .then((removed) {
                  // 如果好友被移除，刷新列表
                  if (removed == true) {
                    _loadFavorites();
                  }
                });
              }
            },
          ),
        );
      },
    );
  }
}
