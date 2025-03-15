import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;

class UserService {
  static const String _userInfoKey = 'user_info';
  static const String _defaultAvatarPath = 'assets/images/normal_header.png';
  static const List<String> _defaultNames = [
    'Alex',
    'Emma',
    'Noah',
    'Olivia',
    'Liam',
    'Sophia',
    'Jackson',
    'Ava',
    'Lucas',
    'Isabella',
    'Ethan',
    'Mia',
    'Mason',
    'Charlotte',
    'Logan',
    'Amelia',
    'Jacob',
    'Harper',
    'William',
    'Evelyn'
  ];

  // 用户信息模型
  static Map<String, dynamic> _defaultUserInfo() {
    final randomIndex =
        DateTime.now().millisecondsSinceEpoch % _defaultNames.length;
    return {
      'nickname': _defaultNames[randomIndex],
      'avatarPath': _defaultAvatarPath,
      'userId': 'Account78578312',
      'customAvatarPath': '',
    };
  }

  // 获取用户信息
  static Future<Map<String, dynamic>> getUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userInfoString = prefs.getString(_userInfoKey);

      if (userInfoString != null) {
        return json.decode(userInfoString);
      } else {
        // 首次使用，创建默认用户信息
        final defaultInfo = _defaultUserInfo();
        await saveUserInfo(defaultInfo);
        return defaultInfo;
      }
    } catch (e) {
      print('获取用户信息失败: $e');
      return _defaultUserInfo();
    }
  }

  // 保存用户信息
  static Future<bool> saveUserInfo(Map<String, dynamic> userInfo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userInfoKey, json.encode(userInfo));
      return true;
    } catch (e) {
      print('保存用户信息失败: $e');
      return false;
    }
  }

  // 更新用户昵称
  static Future<bool> updateNickname(String nickname) async {
    try {
      final userInfo = await getUserInfo();
      userInfo['nickname'] = nickname;
      return await saveUserInfo(userInfo);
    } catch (e) {
      print('更新昵称失败: $e');
      return false;
    }
  }

  // 保存自定义头像
  static Future<String?> saveCustomAvatar(File imageFile) async {
    try {
      // 获取应用文档目录
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          'user_avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await imageFile.copy('${appDir.path}/$fileName');

      // 更新用户信息
      final userInfo = await getUserInfo();
      userInfo['customAvatarPath'] = savedImage.path;
      await saveUserInfo(userInfo);

      return savedImage.path;
    } catch (e) {
      print('保存头像失败: $e');
      return null;
    }
  }

  // 获取头像文件
  static Future<File?> getAvatarFile() async {
    try {
      final userInfo = await getUserInfo();
      final customPath = userInfo['customAvatarPath'];

      if (customPath != null && customPath.isNotEmpty) {
        final file = File(customPath);
        if (await file.exists()) {
          return file;
        }
      }

      // 如果没有自定义头像或文件不存在，复制默认头像到本地
      return await _getDefaultAvatarFile();
    } catch (e) {
      print('获取头像文件失败: $e');
      return await _getDefaultAvatarFile();
    }
  }

  // 获取默认头像文件
  static Future<File?> _getDefaultAvatarFile() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final defaultAvatarPath = '${appDir.path}/default_avatar.png';
      final defaultAvatarFile = File(defaultAvatarPath);

      if (!await defaultAvatarFile.exists()) {
        // 从资源中复制默认头像
        final byteData = await rootBundle.load(_defaultAvatarPath);
        final buffer = byteData.buffer.asUint8List();
        await defaultAvatarFile.writeAsBytes(buffer);
      }

      return defaultAvatarFile;
    } catch (e) {
      print('获取默认头像失败: $e');
      return null;
    }
  }
}
