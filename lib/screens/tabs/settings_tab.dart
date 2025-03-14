import 'package:flutter/material.dart';
import '../../colors.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _isDarkMode = false;
  bool _isNotificationEnabled = true;
  String _selectedLanguage = '简体中文';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('通用设置'),
          _buildSettingItem(
            icon: Icons.language,
            title: '语言',
            subtitle: _selectedLanguage,
            onTap: () {
              _showLanguageSelectionDialog();
            },
          ),
          _buildSwitchItem(
            icon: Icons.dark_mode,
            title: '深色模式',
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          _buildSwitchItem(
            icon: Icons.notifications,
            title: '通知',
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),
          const Divider(),
          _buildSectionTitle('关于'),
          _buildSettingItem(
            icon: Icons.info_outline,
            title: '版本信息',
            subtitle: 'v1.0.0',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.description_outlined,
            title: '用户协议',
            onTap: () {
              // TODO: 打开用户协议
            },
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: '隐私政策',
            onTap: () {
              // TODO: 打开隐私政策
            },
          ),
          const Divider(),
          _buildSectionTitle('账户'),
          _buildSettingItem(
            icon: Icons.logout,
            title: '退出登录',
            titleColor: Colors.red,
            onTap: () {
              // TODO: 实现退出登录
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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

  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('选择语言'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('简体中文'),
              _buildLanguageOption('English'),
              _buildLanguageOption('日本語'),
              _buildLanguageOption('한국어'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      trailing: _selectedLanguage == language
          ? const Icon(
              Icons.check,
              color: AppColors.primaryColor,
            )
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.of(context).pop();
      },
    );
  }
}
