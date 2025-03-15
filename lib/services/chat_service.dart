import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/message_model.dart';
import 'dart:developer' as developer;
import 'dart:math' as math;

class ChatService {
  // 智谱AI API配置
  static const String apiKey =
      'fdbdf7918bba477598cd866a3e88c81d.sGE1O1iuwJSuLRTu';
  static const String apiUrl =
      'https://open.bigmodel.cn/api/paas/v4/chat/completions';

  // 获取AI回复
  Future<String> getAIResponse(
      String userMessage, String userDescription, String userId,
      [String? customPrompt]) async {
    try {
      // 获取历史消息作为上下文
      final messages = await getChatHistory(userId);
      developer.log('获取历史消息: ${messages.length} 条');

      // 构建系统提示词
      String systemPrompt;
      if (customPrompt != null && customPrompt.isNotEmpty) {
        // 使用自定义提示词
        systemPrompt = customPrompt;
      } else {
        // 使用默认提示词
        systemPrompt =
            'You are an AI character with the following description: $userDescription. '
            'Please respond in English, keeping your responses consistent with your character. '
            'Be friendly, engaging, and maintain the personality traits described above. '
            'IMPORTANT: Keep your responses brief and concise, typically 1-3 short sentences. '
            'Occasionally use emojis to express emotions. '
            'Sometimes make small typing errors to seem more human. '
            'Avoid long explanations and overly formal language. '
            'Respond as if you are texting casually with a friend.';
      }

      // 确保系统提示词包含使用英文回复的指令
      if (!systemPrompt.toLowerCase().contains('english')) {
        systemPrompt += ' Always respond in English only.';
      }

      // 构建请求体
      final Map<String, dynamic> requestBody = {
        'model': 'glm-4-flash',
        'messages': [
          {'role': 'system', 'content': systemPrompt},
          // 添加最近的3条消息作为上下文，减少上下文长度
          ...messages.reversed
              .take(3)
              .map((message) => {
                    'role': message.isUser ? 'user' : 'assistant',
                    'content': message.text,
                  })
              .toList()
              .reversed,
          {
            'role': 'user',
            'content': userMessage,
          },
        ],
        'temperature': 0.8, // 增加温度以提高创造性
        'top_p': 0.9,
        'max_tokens': 150, // 减少最大token数，限制回复长度
      };

      developer.log('发送API请求: $userMessage');

      // 发送请求
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(requestBody),
      );

      // 处理响应
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String aiResponse = responseData['choices'][0]['message']['content'];

        // 对AI回复进行后处理，增加人性化特征
        aiResponse = _postProcessAIResponse(aiResponse);

        developer.log('收到API响应: $aiResponse');
        return aiResponse;
      } else {
        developer.log('API请求失败: ${response.statusCode} ${response.body}',
            error: response.body);
        throw Exception('API请求失败: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      developer.log('获取AI回复出错', error: e);
      // 如果API调用失败，返回一个友好的错误消息
      return "I'm sorry, I couldn't process your message at the moment. Could you try again later?";
    }
  }

  // 对AI回复进行后处理，增加人性化特征
  String _postProcessAIResponse(String response) {
    // 确保回复不会太长
    if (response.length > 150) {
      // 尝试在句子结束处截断
      final sentenceEndRegex = RegExp(r'[.!?](\s|$)');
      final matches =
          sentenceEndRegex.allMatches(response.substring(0, 150)).toList();

      if (matches.isNotEmpty) {
        // 找到150字符内的最后一个句子结束点
        final lastMatch = matches.last;
        final endIndex = lastMatch.end;
        response = response.substring(0, endIndex);
      } else {
        // 如果没找到合适的断句点，就截取前120个字符
        response = response.substring(0, 120) + '...';
      }
    }

    // 随机决定是否添加小错误
    if (math.Random().nextDouble() < 0.2) {
      response = _addTypingError(response);
    }

    // 随机决定是否添加表情符号
    if (math.Random().nextDouble() < 0.3) {
      response = _addEmoji(response);
    }

    // 确保回复不以空格开头或结尾
    response = response.trim();

    // 如果回复为空，返回一个默认回复
    if (response.isEmpty) {
      return "I'm here! What would you like to talk about?";
    }

    return response;
  }

  // 添加打字错误，模拟人类打字
  String _addTypingError(String text) {
    if (text.length < 10) return text;

    final random = math.Random();
    final words = text.split(' ');

    if (words.length < 3) return text;

    // 随机选择一个单词进行修改
    final wordIndex = random.nextInt(words.length);
    final word = words[wordIndex];

    if (word.length < 4) return text;

    // 随机选择错误类型
    final errorType = random.nextInt(3);

    try {
      switch (errorType) {
        case 0: // 交换两个相邻字母
          if (word.length < 3) return text;
          final charIndex = random.nextInt(word.length - 2) + 1;
          final chars = word.split('');
          final temp = chars[charIndex];
          chars[charIndex] = chars[charIndex + 1];
          chars[charIndex + 1] = temp;
          words[wordIndex] = chars.join('');
          break;
        case 1: // 重复一个字母
          final charIndex = random.nextInt(word.length);
          final chars = word.split('');
          chars.insert(charIndex, chars[charIndex]);
          words[wordIndex] = chars.join('');
          break;
        case 2: // 省略一个字母
          final charIndex = random.nextInt(word.length);
          final chars = word.split('');
          chars.removeAt(charIndex);
          words[wordIndex] = chars.join('');
          break;
      }
    } catch (e) {
      // 如果出现任何错误，直接返回原文本
      developer.log('添加打字错误失败', error: e);
      return text;
    }

    return words.join(' ');
  }

  // 添加表情符号
  String _addEmoji(String text) {
    final emojis = [
      '😊',
      '😄',
      '👍',
      '❤️',
      '😉',
      '🙂',
      '😁',
      '🤔',
      '😅',
      '🙃',
      '😌',
      '😎'
    ];
    final random = math.Random();

    // 随机选择一个表情
    final emoji = emojis[random.nextInt(emojis.length)];

    // 随机决定表情放在开头还是结尾
    if (random.nextBool()) {
      return '$emoji $text';
    } else {
      return '$text $emoji';
    }
  }

  // 获取聊天历史
  Future<List<Message>> getChatHistory(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? chatHistoryJson = prefs.getString('chat_history_$userId');

      if (chatHistoryJson == null) {
        developer.log('未找到用户 $userId 的聊天历史');
        return [];
      }

      final List<dynamic> chatHistoryList = jsonDecode(chatHistoryJson);
      final messages =
          chatHistoryList.map((item) => Message.fromJson(item)).toList();
      developer.log('获取到用户 $userId 的聊天历史: ${messages.length} 条消息');
      return messages;
    } catch (e) {
      developer.log('获取聊天历史出错', error: e);
      // 如果读取失败，返回空列表
      return [];
    }
  }

  // 保存聊天历史
  Future<void> saveChatHistory(String userId, List<Message> messages) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> messageJsonList =
          messages.map((message) => message.toJson()).toList();

      final String jsonString = jsonEncode(messageJsonList);
      await prefs.setString('chat_history_$userId', jsonString);
      developer.log('保存用户 $userId 的聊天历史: ${messages.length} 条消息');

      // 打印所有键，用于调试
      final keys = prefs.getKeys();
      developer.log('SharedPreferences 中的所有键: $keys');
    } catch (e) {
      // 保存失败时记录错误
      developer.log('保存聊天历史失败', error: e);
    }
  }

  // 获取所有聊天历史记录
  Future<Map<String, List<Message>>> getAllChatHistories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, List<Message>> allChats = {};

      // 获取所有键
      final Set<String> keys = prefs.getKeys();
      developer.log('SharedPreferences 中的所有键: $keys');

      // 筛选出聊天历史的键
      final chatKeys =
          keys.where((key) => key.startsWith('chat_history_')).toList();
      developer.log('找到聊天历史键: $chatKeys');

      // 遍历所有聊天历史键
      for (final key in chatKeys) {
        final String userId = key.replaceFirst('chat_history_', '');
        final List<Message> messages = await getChatHistory(userId);
        allChats[userId] = messages;
      }

      developer.log('获取到所有聊天历史: ${allChats.length} 个用户');
      return allChats;
    } catch (e) {
      developer.log('获取所有聊天历史出错', error: e);
      // 如果读取失败，返回空Map
      return {};
    }
  }

  // 删除聊天历史
  Future<void> deleteChatHistory(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('chat_history_$userId');
      developer.log('删除用户 $userId 的聊天历史');
    } catch (e) {
      developer.log('删除聊天历史失败', error: e);
    }
  }
}
