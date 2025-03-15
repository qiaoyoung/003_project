import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/user_service.dart';
import '../services/user_preference_service.dart';
import 'favorites_screen.dart';
import 'blacklist_screen.dart';
import 'reports_screen.dart';
import 'version_info_screen.dart';
import 'terms_of_service_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;
  bool _isLoading = false;

  // 用户信息
  String _nickname = '';
  String _userId = 'Account78578312';
  File? _avatarFile;
  bool _isUserInfoLoading = false;
  bool _isInitialized = false;

  // 用户偏好服务
  final UserPreferenceService _preferenceService = UserPreferenceService();

  // 统计数据
  int _favoritesCount = 0;
  int _blacklistCount = 0;
  int _reportedCount = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    if (!_isInitialized) {
      await _loadUserInfo();
      await _loadSettings();
      await _loadPreferenceStats();
      setState(() {
        _isInitialized = true;
      });
    }
  }

  Future<void> _loadPreferenceStats() async {
    try {
      final favorites = await _preferenceService.getFavoriteUserIds();
      final blacklist = await _preferenceService.getBlacklistedUserIds();
      final reportedUsers = await _preferenceService.getReportedUsers();

      if (mounted) {
        setState(() {
          _favoritesCount = favorites.length;
          _blacklistCount = blacklist.length;
          _reportedCount = reportedUsers.length;
        });
      }
    } catch (e) {
      print('Loading user preference statistics failed: $e');
    }
  }

  Future<void> _loadUserInfo() async {
    try {
      // 获取用户信息
      final userInfo = await UserService.getUserInfo();
      final avatarFile = await UserService.getAvatarFile();

      if (mounted) {
        setState(() {
          _nickname = userInfo['nickname'];
          _userId = userInfo['userId'];
          _avatarFile = avatarFile;
        });
      }
    } catch (e) {
      // 错误处理，但不显示加载状态
      print('Loading user information failed: $e');
    }
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (mounted) {
        setState(() {
          _isNotificationEnabled =
              prefs.getBool('isNotificationEnabled') ?? true;
        });
      }
    } catch (e) {
      // 错误处理，但不显示加载状态
      print('Loading settings failed: $e');
    }
  }

  Future<void> _saveSettings(String key, dynamic value) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();

      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      switch (key) {
        case 'isNotificationEnabled':
          await prefs.setBool(key, value as bool);
          setState(() {
            _isNotificationEnabled = value;
          });
          break;
      }

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Settings saved')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // 错误处理
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to save settings, please try again later')),
        );
      }
    }
  }

  Future<void> _pickImage() async {
    try {
      setState(() {
        _isUserInfoLoading = true;
      });

      // 直接使用ImagePicker，它会自动处理权限请求
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      // 如果用户取消了选择，image将为null
      if (image != null) {
        // 保存图片
        final savedPath = await UserService.saveCustomAvatar(File(image.path));
        if (savedPath != null) {
          setState(() {
            _avatarFile = File(savedPath);
          });
        }
      }

      setState(() {
        _isUserInfoLoading = false;
      });
    } catch (e) {
      setState(() {
        _isUserInfoLoading = false;
      });

      if (mounted) {
        // 检查错误是否与权限相关
        if (e.toString().toLowerCase().contains('permission') ||
            e.toString().toLowerCase().contains('access') ||
            e.toString().toLowerCase().contains('denied')) {
          // 显示权限错误
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                  'Gallery access permission is required to select an avatar. Please allow access in settings.'),
              action: SnackBarAction(
                label: 'Open Settings',
                onPressed: () {
                  openAppSettings();
                },
              ),
            ),
          );
        } else {
          // 显示一般错误
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to select avatar: ${e.toString()}')),
          );
        }
      }
    }
  }

  void _editNickname() {
    final TextEditingController controller =
        TextEditingController(text: _nickname);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Nickname'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter new nickname',
              border: OutlineInputBorder(),
            ),
            maxLength: 20,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newNickname = controller.text.trim();
                if (newNickname.isNotEmpty) {
                  Navigator.of(context).pop();

                  setState(() {
                    _isUserInfoLoading = true;
                  });

                  // 模拟网络延迟
                  await Future.delayed(const Duration(milliseconds: 800));

                  // 保存新昵称
                  final success = await UserService.updateNickname(newNickname);

                  setState(() {
                    if (success) {
                      _nickname = newNickname;
                    }
                    _isUserInfoLoading = false;
                  });

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(success
                              ? 'Nickname updated'
                              : 'Failed to update nickname')),
                    );
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FavoritesScreen(),
      ),
    );
  }

  void _navigateToBlacklist() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BlacklistScreen(),
      ),
    );
  }

  void _navigateToReports() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ReportsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 确保数据已初始化
    _initializeData();

    return Scaffold(
      body: Stack(
        children: [
          // 主内容
          CustomScrollView(
            slivers: [
              // 顶部AppBar - 移除标题
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                automaticallyImplyLeading: false, // 移除返回按钮
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: _buildUserInfoHeader(),
                  ),
                ),
                // 移除标题
              ),

              // 设置列表
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 8),
                  _buildSectionTitle('General Settings'),
                  _buildSwitchItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    value: _isNotificationEnabled,
                    onChanged: (value) {
                      _saveSettings('isNotificationEnabled', value);
                    },
                  ),
                  const Divider(),
                  _buildSectionTitle('My Collections & Management'),
                  _buildSettingItem(
                    icon: Icons.favorite,
                    title: 'My Favorites',
                    subtitle: '$_favoritesCount AI characters favorited',
                    onTap: _navigateToFavorites,
                  ),
                  _buildSettingItem(
                    icon: Icons.block,
                    title: 'Blacklist',
                    subtitle: '$_blacklistCount AI characters blacklisted',
                    onTap: _navigateToBlacklist,
                  ),
                  _buildSettingItem(
                    icon: Icons.report,
                    title: 'Report Records',
                    subtitle: '$_reportedCount AI characters reported',
                    onTap: _navigateToReports,
                  ),
                  const Divider(),
                  _buildSectionTitle('About'),
                  _buildSettingItem(
                    icon: Icons.info_outline,
                    title: 'Version Info',
                    subtitle: 'v1.0.0',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const VersionInfoScreen(),
                        ),
                      );
                    },
                  ),
                  _buildSettingItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TermsOfServiceScreen(),
                        ),
                      );
                    },
                  ),
                  _buildSettingItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ]),
              ),
            ],
          ),

          // 加载指示器 - 仅在特定操作时显示
          if (_isLoading || _isUserInfoLoading)
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

  Widget _buildUserInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: _avatarFile != null
                        ? Image.file(
                            _avatarFile!,
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          )
                        : Image.asset(
                            'assets/images/normal_header.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _editNickname,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _nickname,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _userId,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? AppColors.textPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
      ),
    );
  }

  void _showVersionInfoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Version Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Current Version: v1.0.0'),
              SizedBox(height: 8),
              Text('Build Date: 2025-03-15'),
              SizedBox(height: 16),
              Text('New Features:'),
              SizedBox(height: 4),
              Text('• Brand new user interface'),
              Text('• Optimized AI chat experience'),
              Text('• More AI characters added'),
              Text('• Fixed known issues'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VersionInfoScreen(),
                  ),
                );
              },
              child: const Text('View Details'),
            ),
          ],
        );
      },
    );
  }
}
