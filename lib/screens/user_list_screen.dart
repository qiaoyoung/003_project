import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../data/user_data.dart';
import '../widgets/user_card.dart';
import '../colors.dart'; // 导入颜色定义
import 'dart:async';
import 'dart:math';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<User> users;
  late Map<String, List<User>> groupedUsers;
  bool isLoading = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  // 用于随机排序的随机数生成器
  final Random _random = Random();
  // 存储每个职业分组应该使用的布局样式
  late Map<String, int> _layoutStyles;

  @override
  void initState() {
    super.initState();
    users = UserData.getUsers();
    _groupUsersByOccupation();
    _assignRandomLayoutStyles();
  }

  // 为每个职业分组分配随机的布局样式
  void _assignRandomLayoutStyles() {
    _layoutStyles = {};
    for (var occupation in groupedUsers.keys) {
      _layoutStyles[occupation] = _random.nextInt(3); // 0, 1, 2 分别对应三种布局
    }
  }

  // 模拟网络请求延迟
  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      users = UserData.getUsers(); // 重新获取数据
      _groupUsersByOccupation();
      // 重新随机分配布局样式
      _assignRandomLayoutStyles();
      isLoading = false;
    });

    return Future.value();
  }

  void _groupUsersByOccupation() {
    groupedUsers = {};

    // 按职业分组
    for (var user in users) {
      if (user.occupation.isEmpty) continue; // 跳过没有职业信息的用户

      if (!groupedUsers.containsKey(user.occupation)) {
        groupedUsers[user.occupation] = [];
      }
      groupedUsers[user.occupation]!.add(user);
    }

    // 移除人数太少的分组
    groupedUsers.removeWhere((key, value) => value.length < 2);

    // 如果没有足够的分组，添加一个"其他职业"分组
    if (groupedUsers.isEmpty) {
      groupedUsers['Other Professions'] = users;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Characters',
          style: TextStyle(color: Colors.black87), // 修改文字颜色为黑色以便于在主题色背景上看清
        ),
        backgroundColor: AppColors.primaryColor, // 使用主题色作为导航栏背景
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundImage.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refreshData,
            child: groupedUsers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: _buildOccupationGroups(),
                  ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> _buildOccupationGroups() {
    List<Widget> groups = [];

    List<String> occupations = groupedUsers.keys.toList();
    occupations.shuffle(_random);

    for (var occupation in occupations) {
      var occupationUsers = groupedUsers[occupation]!;

      groups.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Text(
                  occupation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${occupationUsers.length} people',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // 使用为该职业分配的布局样式
      int layoutStyle = _layoutStyles[occupation] ?? _random.nextInt(3);

      // 根据布局样式选择不同的布局
      switch (layoutStyle) {
        case 0:
          // 标准卡片布局
          groups.add(
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    if (i >= occupationUsers.length) return null;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: UserCard(user: occupationUsers[i]),
                    );
                  },
                  childCount: occupationUsers.length,
                ),
              ),
            ),
          );
          break;

        case 1:
          // 水平滚动布局
          groups.add(
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: occupationUsers.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _buildHorizontalUserCard(occupationUsers[i]),
                    );
                  },
                ),
              ),
            ),
          );
          break;

        case 2:
          // 网格布局
          groups.add(
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    if (i >= occupationUsers.length) return null;
                    return _buildGridUserCard(occupationUsers[i]);
                  },
                  childCount: occupationUsers.length,
                ),
              ),
            ),
          );
          break;
      }
    }

    return groups;
  }

  Widget _buildHorizontalUserCard(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/user_detail',
          arguments: user,
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户头像
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                user.avatarPath,
                height: 120,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${user.age} years · ${user.location}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.occupation,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridUserCard(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/user_detail',
          arguments: user,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 用户头像
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      user.avatarPath,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: const [0.6, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.nickname,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '${user.age} years',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.white30,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  user.location,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.work,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      user.occupation,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
