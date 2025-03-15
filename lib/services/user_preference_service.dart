import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class UserPreferenceService {
  // 黑名单用户ID列表的键
  static const String _blacklistKey = 'user_blacklist';

  // 举报记录的键
  static const String _reportedUsersKey = 'reported_users';

  // 收藏用户ID列表的键
  static const String _favoritesKey = 'user_favorites';

  // 获取黑名单用户ID列表
  Future<List<String>> getBlacklistedUserIds() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? blacklistJson = prefs.getString(_blacklistKey);

      if (blacklistJson == null) {
        return [];
      }

      final List<dynamic> blacklist = jsonDecode(blacklistJson);
      return blacklist.cast<String>();
    } catch (e) {
      developer.log('获取黑名单失败', error: e);
      return [];
    }
  }

  // 添加用户到黑名单
  Future<bool> addUserToBlacklist(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> blacklist = await getBlacklistedUserIds();

      if (blacklist.contains(userId)) {
        return true; // 用户已在黑名单中
      }

      blacklist.add(userId);
      await prefs.setString(_blacklistKey, jsonEncode(blacklist));
      developer.log('已将用户 $userId 添加到黑名单');
      return true;
    } catch (e) {
      developer.log('添加用户到黑名单失败', error: e);
      return false;
    }
  }

  // 从黑名单中移除用户
  Future<bool> removeUserFromBlacklist(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> blacklist = await getBlacklistedUserIds();

      if (!blacklist.contains(userId)) {
        return true; // 用户不在黑名单中
      }

      blacklist.remove(userId);
      await prefs.setString(_blacklistKey, jsonEncode(blacklist));
      developer.log('已将用户 $userId 从黑名单中移除');
      return true;
    } catch (e) {
      developer.log('从黑名单移除用户失败', error: e);
      return false;
    }
  }

  // 检查用户是否在黑名单中
  Future<bool> isUserBlacklisted(String userId) async {
    final List<String> blacklist = await getBlacklistedUserIds();
    return blacklist.contains(userId);
  }

  // 获取举报记录
  Future<Map<String, List<String>>> getReportedUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? reportedUsersJson = prefs.getString(_reportedUsersKey);

      if (reportedUsersJson == null) {
        return {};
      }

      final Map<String, dynamic> reportedUsers = jsonDecode(reportedUsersJson);

      // 将动态Map转换为<String, List<String>>
      final Map<String, List<String>> result = {};
      reportedUsers.forEach((key, value) {
        if (value is List) {
          result[key] = List<String>.from(value);
        }
      });

      return result;
    } catch (e) {
      developer.log('获取举报记录失败', error: e);
      return {};
    }
  }

  // 举报用户
  Future<bool> reportUser(String userId, String reason) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, List<String>> reportedUsers = await getReportedUsers();

      if (!reportedUsers.containsKey(userId)) {
        reportedUsers[userId] = [];
      }

      // 添加举报原因
      reportedUsers[userId]!
          .add('${DateTime.now().toIso8601String()}: $reason');

      await prefs.setString(_reportedUsersKey, jsonEncode(reportedUsers));
      developer.log('已举报用户 $userId，原因: $reason');
      return true;
    } catch (e) {
      developer.log('举报用户失败', error: e);
      return false;
    }
  }

  // 获取用户的举报原因列表
  Future<List<String>> getUserReportReasons(String userId) async {
    final Map<String, List<String>> reportedUsers = await getReportedUsers();
    return reportedUsers[userId] ?? [];
  }

  // 检查用户是否被举报过
  Future<bool> isUserReported(String userId) async {
    final Map<String, List<String>> reportedUsers = await getReportedUsers();
    return reportedUsers.containsKey(userId) &&
        reportedUsers[userId]!.isNotEmpty;
  }

  // 获取收藏用户ID列表
  Future<List<String>> getFavoriteUserIds() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favoritesJson = prefs.getString(_favoritesKey);

      if (favoritesJson == null) {
        return [];
      }

      final List<dynamic> favorites = jsonDecode(favoritesJson);
      return favorites.cast<String>();
    } catch (e) {
      developer.log('获取收藏列表失败', error: e);
      return [];
    }
  }

  // 添加用户到收藏
  Future<bool> addUserToFavorites(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> favorites = await getFavoriteUserIds();

      if (favorites.contains(userId)) {
        return true; // 用户已在收藏中
      }

      favorites.add(userId);
      await prefs.setString(_favoritesKey, jsonEncode(favorites));
      developer.log('已将用户 $userId 添加到收藏');
      return true;
    } catch (e) {
      developer.log('添加用户到收藏失败', error: e);
      return false;
    }
  }

  // 从收藏中移除用户
  Future<bool> removeUserFromFavorites(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> favorites = await getFavoriteUserIds();

      if (!favorites.contains(userId)) {
        return true; // 用户不在收藏中
      }

      favorites.remove(userId);
      await prefs.setString(_favoritesKey, jsonEncode(favorites));
      developer.log('已将用户 $userId 从收藏中移除');
      return true;
    } catch (e) {
      developer.log('从收藏移除用户失败', error: e);
      return false;
    }
  }

  // 检查用户是否在收藏中
  Future<bool> isUserFavorited(String userId) async {
    final List<String> favorites = await getFavoriteUserIds();
    return favorites.contains(userId);
  }
}
