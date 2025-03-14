import 'package:flutter/material.dart';
import '../../colors.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // 模拟历史记录数据
    final List<Map<String, dynamic>> historyItems = [
      {
        'title': '如何提高英语口语水平？',
        'date': '今天 14:30',
        'preview': '要提高英语口语，可以尝试每天练习口语、听英语播客、参加语言交换...',
      },
      {
        'title': '推荐几本科幻小说',
        'date': '今天 10:15',
        'preview': '以下是一些经典科幻小说推荐：《三体》、《基地》系列、《神经漫游者》...',
      },
      {
        'title': '写一首关于春天的诗',
        'date': '昨天 18:45',
        'preview': '春风轻抚大地，万物复苏焕新机。花开绚烂多姿，鸟语婉转动人心...',
      },
      {
        'title': '如何制作提拉米苏',
        'date': '昨天 12:20',
        'preview': '提拉米苏的主要材料包括马斯卡彭奶酪、手指饼干、咖啡、可可粉等...',
      },
      {
        'title': '解释量子力学的基本原理',
        'date': '2024-05-08',
        'preview': '量子力学是描述微观粒子行为的物理理论，其基本原理包括波粒二象性...',
      },
      {
        'title': '帮我写一个简单的Python程序',
        'date': '2024-05-07',
        'preview': '以下是一个简单的Python程序，用于计算斐波那契数列：def fibonacci(n)...',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天历史'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: 实现搜索功能
            },
          ),
        ],
      ),
      body: historyItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '暂无聊天历史',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: historyItems.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return _buildHistoryItem(
                  title: historyItems[index]['title'],
                  date: historyItems[index]['date'],
                  preview: historyItems[index]['preview'],
                );
              },
            ),
    );
  }

  Widget _buildHistoryItem({
    required String title,
    required String date,
    required String preview,
  }) {
    return InkWell(
      onTap: () {
        // TODO: 打开历史聊天详情
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              preview,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
