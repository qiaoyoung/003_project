import 'package:flutter/material.dart';

class UserTag {
  final String name;
  final Color color;

  UserTag({required this.name, required this.color});
}

class User {
  final String userId;
  final String nickname;
  final String avatarPath;
  final String gender;
  final int age;
  final String description;
  final List<UserTag> tags;
  final String occupation;
  final String location;
  final bool isOnline;
  final DateTime lastActive;
  final int messageCount;
  final bool isPremium;
  final String ethnicity;
  final String background;

  User({
    required this.userId,
    required this.nickname,
    required this.avatarPath,
    required this.gender,
    required this.age,
    required this.description,
    required this.tags,
    this.occupation = '',
    this.location = '',
    this.isOnline = false,
    DateTime? lastActive,
    this.messageCount = 0,
    this.isPremium = false,
    this.ethnicity = '',
    this.background = '',
  }) : lastActive = lastActive ?? DateTime.now();

  User copyWith({
    String? userId,
    String? nickname,
    String? avatarPath,
    String? gender,
    int? age,
    String? description,
    List<UserTag>? tags,
    String? occupation,
    String? location,
    bool? isOnline,
    DateTime? lastActive,
    int? messageCount,
    bool? isPremium,
    String? ethnicity,
    String? background,
  }) {
    return User(
      userId: userId ?? this.userId,
      nickname: nickname ?? this.nickname,
      avatarPath: avatarPath ?? this.avatarPath,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      occupation: occupation ?? this.occupation,
      location: location ?? this.location,
      isOnline: isOnline ?? this.isOnline,
      lastActive: lastActive ?? this.lastActive,
      messageCount: messageCount ?? this.messageCount,
      isPremium: isPremium ?? this.isPremium,
      ethnicity: ethnicity ?? this.ethnicity,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickname': nickname,
      'avatarPath': avatarPath,
      'gender': gender,
      'age': age,
      'description': description,
      'tags': tags
          .map((tag) => {'name': tag.name, 'color': tag.color.value})
          .toList(),
      'occupation': occupation,
      'location': location,
      'isOnline': isOnline,
      'lastActive': lastActive.toIso8601String(),
      'messageCount': messageCount,
      'isPremium': isPremium,
      'ethnicity': ethnicity,
      'background': background,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      nickname: json['nickname'],
      avatarPath: json['avatarPath'],
      gender: json['gender'],
      age: json['age'],
      description: json['description'],
      tags: (json['tags'] as List)
          .map((tag) => UserTag(
                name: tag['name'],
                color: Color(tag['color']),
              ))
          .toList(),
      occupation: json['occupation'] ?? '',
      location: json['location'] ?? '',
      isOnline: json['isOnline'] ?? false,
      lastActive: json['lastActive'] != null
          ? DateTime.parse(json['lastActive'])
          : DateTime.now(),
      messageCount: json['messageCount'] ?? 0,
      isPremium: json['isPremium'] ?? false,
      ethnicity: json['ethnicity'] ?? '',
      background: json['background'] ?? '',
    );
  }
}
