import 'package:flutter/material.dart';
import '../colors.dart';
import '../services/user_preference_service.dart';
import '../data/user_data.dart';
import '../models/user_model.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final UserPreferenceService _preferenceService = UserPreferenceService();
  Map<String, List<String>> _reportedUsers = {};
  Map<String, User> _userMap = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadReportedUsers();
  }

  Future<void> _loadReportedUsers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 模拟网络延迟
      await Future.delayed(const Duration(milliseconds: 800));

      final reportedUsers = await _preferenceService.getReportedUsers();

      // 获取所有AI角色数据
      final allUsers = UserData.getUsers();
      final userMap = {for (var user in allUsers) user.userId: user};

      setState(() {
        _reportedUsers = reportedUsers;
        _userMap = userMap;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('加载举报记录失败，请稍后再试')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('举报记录'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _reportedUsers.isEmpty && !_isLoading
              ? _buildEmptyState()
              : _buildReportsList(),
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
            Icons.report_off,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '您还没有举报任何AI角色',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '在AI角色详情页点击举报按钮提交举报',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportsList() {
    final userIds = _reportedUsers.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: userIds.length,
      itemBuilder: (context, index) {
        final userId = userIds[index];
        final reasons = _reportedUsers[userId]!;
        final user = _userMap[userId];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundImage:
                  user != null ? AssetImage(user.avatarPath) : null,
              backgroundColor: user == null ? Colors.orange : null,
              child: user == null
                  ? const Icon(Icons.report, color: Colors.white, size: 20)
                  : null,
            ),
            title: Text(user?.nickname ?? 'AI角色 $userId'),
            subtitle: Text('${reasons.length}个举报'),
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reasons.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final parts = reasons[index].split(': ');
                  final timestamp = parts.first;
                  final reason = parts.length > 1 ? parts.last : '未知原因';

                  return ListTile(
                    dense: true,
                    title: Text(reason),
                    subtitle: Text(
                      '举报时间: $timestamp',
                      style: const TextStyle(fontSize: 12),
                    ),
                    leading: const Icon(Icons.warning, color: Colors.orange),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
