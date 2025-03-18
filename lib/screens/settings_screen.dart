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
import 'profile_edit_screen.dart';

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
      setState(() {
        _isUserInfoLoading = true;
      });

      // 加载用户设置数据
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _isNotificationEnabled = prefs.getBool('notification_enabled') ?? true;
        _nickname = prefs.getString('user_nickname') ?? 'Alex Johnson';
        _userId = prefs.getString('user_id') ??
            'Account${DateTime.now().millisecondsSinceEpoch % 100000000}';
        final String? avatarPath = prefs.getString('user_avatar_path');
        if (avatarPath != null && avatarPath.isNotEmpty) {
          _avatarFile = File(avatarPath);
        }
        _isUserInfoLoading = false;
        _isInitialized = true;
      });

      // 加载统计数据
      _loadStatistics();
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

  Future<void> _loadStatistics() async {
    await _loadPreferenceStats();
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

  Future<void> _pickImage(ImageSource source) async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (pickedFile != null) {
        setState(() {
          _avatarFile = File(pickedFile.path);
        });

        // 保存头像路径
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_avatar_path', pickedFile.path);
      }
    } catch (e) {
      if (e.toString().contains('permission')) {
        // 权限错误处理
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Permission Denied'),
            content: Text(source == ImageSource.camera
                ? 'Please grant camera access in your device settings to take a profile picture.'
                : 'Please grant photo library access in your device settings to select a profile picture.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('Open Settings'),
              ),
            ],
          ),
        );
      } else {
        // 其他错误处理
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _showAvatarOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              if (_avatarFile != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Remove photo',
                      style: TextStyle(color: Colors.red)),
                  onTap: () async {
                    Navigator.pop(context);
                    setState(() {
                      _avatarFile = null;
                    });

                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('user_avatar_path');
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _showEditNicknameDialog() {
    final TextEditingController controller =
        TextEditingController(text: _nickname);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Nickname'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter your nickname',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  _nickname = controller.text.trim();
                });

                // 保存昵称
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('user_nickname', _nickname);

                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileEditScreen(
          initialNickname: _nickname,
          initialAvatarFile: _avatarFile,
          onProfileUpdated: (nickname, avatarFile) async {
            setState(() {
              _nickname = nickname;
              _avatarFile = avatarFile;
            });

            // 保存数据
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('user_nickname', nickname);
            if (avatarFile != null) {
              await prefs.setString('user_avatar_path', avatarFile.path);
            } else {
              await prefs.remove('user_avatar_path');
            }
          },
        ),
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: _isUserInfoLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileSection(),
                  // 设置列表
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              builder: (context) =>
                                  const TermsOfServiceScreen(),
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
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                GestureDetector(
                  onTap: _showAvatarOptions,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _avatarFile != null
                            ? FileImage(_avatarFile!)
                            : const AssetImage('assets/images/avatars/1.png')
                                as ImageProvider,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _nickname,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: _showEditNicknameDialog,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'ID: $_userId',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _editProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text('Edit Profile'),
            ),
          ],
        ),
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
