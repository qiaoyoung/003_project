import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../data/user_data.dart';
import '../widgets/user_card.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<User> users;
  late List<User> filteredUsers;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    users = UserData.getUsers();
    filteredUsers = users;
  }

  void _filterUsers(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredUsers = users;
      } else {
        filteredUsers = users.where((user) {
          return user.nickname.toLowerCase().contains(query.toLowerCase()) ||
              user.description.toLowerCase().contains(query.toLowerCase()) ||
              user.tags.any((tag) =>
                  tag.name.toLowerCase().contains(query.toLowerCase())) ||
              user.occupation.toLowerCase().contains(query.toLowerCase()) ||
              user.location.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户列表'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索用户...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: _filterUsers,
            ),
          ),
          Expanded(
            child: filteredUsers.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '没有找到匹配的用户',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: UserCard(user: filteredUsers[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '筛选用户',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '性别',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      FilterChip(
                        label: const Text('全部'),
                        selected: searchQuery.isEmpty,
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('');
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      FilterChip(
                        label: const Text('男性'),
                        selected: searchQuery == '男性',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('男性');
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      FilterChip(
                        label: const Text('女性'),
                        selected: searchQuery == '女性',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('女性');
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '民族',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      FilterChip(
                        label: const Text('亚洲人'),
                        selected: searchQuery == '亚洲人',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('亚洲人');
                          }
                        },
                      ),
                      FilterChip(
                        label: const Text('欧洲人'),
                        selected: searchQuery == '欧洲人',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('欧洲人');
                          }
                        },
                      ),
                      FilterChip(
                        label: const Text('非裔美国人'),
                        selected: searchQuery == '非裔美国人',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('非裔美国人');
                          }
                        },
                      ),
                      FilterChip(
                        label: const Text('拉丁裔'),
                        selected: searchQuery == '拉丁裔',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('拉丁裔');
                          }
                        },
                      ),
                      FilterChip(
                        label: const Text('白人'),
                        selected: searchQuery == '白人',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('白人');
                          }
                        },
                      ),
                      FilterChip(
                        label: const Text('印度裔'),
                        selected: searchQuery == '印度裔',
                        onSelected: (selected) {
                          if (selected) {
                            Navigator.pop(context);
                            _filterUsers('印度裔');
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _filterUsers('');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('重置筛选'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
