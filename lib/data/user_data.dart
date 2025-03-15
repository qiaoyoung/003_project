import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'dart:math';

class UserData {
  static final Random _random = Random(42); // 使用固定种子，确保每次生成相同的随机数
  static List<User>? _cachedUsers; // 缓存用户数据

  // 生成随机标签
  static List<UserTag> _generateRandomTags(
      String description, String gender, String ethnicity, String background) {
    final List<String> possibleTags = [];

    // 从描述中提取关键词作为标签
    if (description.contains('眼镜')) possibleTags.add('眼镜');
    if (description.contains('微笑')) possibleTags.add('微笑');
    if (description.contains('职业装') || description.contains('西装'))
      possibleTags.add('职业人士');
    if (description.contains('运动')) possibleTags.add('运动爱好者');
    if (description.contains('篮球')) possibleTags.add('篮球');
    if (description.contains('长发') || description.contains('卷发'))
      possibleTags.add('长发');
    if (description.contains('短发')) possibleTags.add('短发');
    if (description.contains('珍珠')) possibleTags.add('时尚');
    if (description.contains('餐厅')) possibleTags.add('美食家');
    if (description.contains('胡子')) possibleTags.add('胡子');
    if (description.contains('牛仔')) possibleTags.add('休闲风格');
    if (description.contains('城市')) possibleTags.add('城市生活');
    if (description.contains('夏装')) possibleTags.add('夏日风情');
    if (description.contains('海滩')) possibleTags.add('海滩爱好者');
    if (description.contains('光头')) possibleTags.add('光头');
    if (description.contains('图书馆')) possibleTags.add('阅读爱好者');
    if (description.contains('耳机') || description.contains('音乐'))
      possibleTags.add('音乐爱好者');
    if (description.contains('录音棚')) possibleTags.add('音乐人');
    if (description.contains('会议室')) possibleTags.add('商务人士');
    if (description.contains('瑜伽')) possibleTags.add('瑜伽爱好者');
    if (description.contains('健身房')) possibleTags.add('健身爱好者');
    if (description.contains('皮夹克') || description.contains('摩托车'))
      possibleTags.add('机车爱好者');
    if (description.contains('实验室')) possibleTags.add('科研人员');
    if (description.contains('冲浪')) possibleTags.add('冲浪爱好者');
    if (description.contains('海浪')) possibleTags.add('海洋爱好者');
    if (description.contains('帽子')) possibleTags.add('帽子控');
    if (description.contains('冬装') || description.contains('雪山'))
      possibleTags.add('冬季运动');
    if (description.contains('军装') || description.contains('军营'))
      possibleTags.add('军人');
    if (description.contains('厨师')) possibleTags.add('厨师');
    if (description.contains('滑雪')) possibleTags.add('滑雪爱好者');
    if (description.contains('太阳镜')) possibleTags.add('时尚达人');
    if (description.contains('沙滩')) possibleTags.add('沙滩爱好者');
    if (description.contains('摇滚')) possibleTags.add('摇滚乐迷');
    if (description.contains('咖啡馆')) possibleTags.add('咖啡爱好者');
    if (description.contains('登山')) possibleTags.add('登山爱好者');
    if (description.contains('程序员')) possibleTags.add('程序员');
    if (description.contains('工装') || description.contains('工地'))
      possibleTags.add('建筑工人');
    if (description.contains('和服')) possibleTags.add('传统文化');
    if (description.contains('樱花')) possibleTags.add('樱花爱好者');
    if (description.contains('法庭')) possibleTags.add('法律人士');
    if (description.contains('波西米亚')) possibleTags.add('波西米亚风格');
    if (description.contains('艺术')) possibleTags.add('艺术爱好者');
    if (description.contains('潜水')) possibleTags.add('潜水爱好者');
    if (description.contains('珊瑚礁')) possibleTags.add('海洋探险家');
    if (description.contains('音乐节')) possibleTags.add('音乐节爱好者');
    if (description.contains('礼服') || description.contains('红毯'))
      possibleTags.add('时尚达人');
    if (description.contains('足球')) possibleTags.add('足球爱好者');

    // 添加性别标签
    possibleTags.add(gender);

    // 添加民族标签
    if (ethnicity.isNotEmpty) {
      possibleTags.add(ethnicity);
    }

    // 添加背景标签
    if (background.isNotEmpty && !possibleTags.contains(background)) {
      possibleTags.add(background);
    }

    // 随机选择3-5个标签
    final int tagCount =
        min(possibleTags.length, _random.nextInt(3) + 3); // 3-5个标签
    final List<String> selectedTags = [];

    while (selectedTags.length < tagCount && possibleTags.isNotEmpty) {
      final String tag =
          possibleTags.removeAt(_random.nextInt(possibleTags.length));
      selectedTags.add(tag);
    }

    // 为标签分配颜色
    return selectedTags.map((tag) {
      final List<Color> tagColors = [
        Colors.blue.shade400,
        Colors.green.shade400,
        Colors.orange.shade400,
        Colors.purple.shade400,
        Colors.red.shade400,
        Colors.teal.shade400,
        Colors.pink.shade400,
        Colors.indigo.shade400,
      ];

      return UserTag(
        name: tag,
        color: tagColors[_random.nextInt(tagColors.length)],
      );
    }).toList();
  }

  // 生成随机昵称
  static String _generateNickname(
      String gender, int age, String ethnicity, String description) {
    final List<String> maleFirstNames = [
      '小明',
      '大卫',
      '杰克',
      '迈克',
      '亚历克斯',
      '托马斯',
      '李',
      '王',
      '张',
      '刘',
      '约翰',
      '萨姆',
      '拉吉',
      '卡洛斯',
      '安东尼奥',
      '哈桑',
      '阿里',
      '山田',
      '田中',
      '佐藤'
    ];
    final List<String> femaleFirstNames = [
      '小红',
      '莉莉',
      '艾米',
      '索菲亚',
      '玛丽亚',
      '安娜',
      '王',
      '李',
      '张',
      '刘',
      '珍妮',
      '萨曼莎',
      '普丽亚',
      '伊莎贝拉',
      '加布里埃拉',
      '法蒂玛',
      '阿依莎',
      '佐藤',
      '铃木',
      '高桥'
    ];

    final List<String> lastNames = [
      '史密斯',
      '约翰逊',
      '威廉姆斯',
      '布朗',
      '琼斯',
      '加西亚',
      '罗德里格斯',
      '李',
      '王',
      '张',
      '陈',
      '杨',
      '黄',
      '赵',
      '吴',
      '周',
      '徐',
      '孙',
      '马',
      '朱',
      '胡',
      '林',
      '郭',
      '何',
      '高',
      '罗',
      '郑',
      '梁',
      '谢',
      '宋',
      '唐',
      '许',
      '韩',
      '冯',
      '邓',
      '曹',
      '彭',
      '曾',
      '萧',
      '田',
      '董',
      '袁',
      '潘',
      '蔡',
      '苏',
      '魏',
      '吕',
      '丁',
      '沈',
      '姚',
      '崔',
      '钟',
      '谭',
      '陆',
      '汪',
      '范',
      '金',
      '石',
      '廖',
      '贾',
      '夏',
      '韦',
      '付',
      '方',
      '白',
      '邹',
      '孟',
      '熊',
      '秦',
      '邱',
      '江',
      '尹',
      '薛',
      '闫',
      '段',
      '雷',
      '侯',
      '龙',
      '史',
      '陶',
      '黎',
      '贺',
      '顾',
      '毛',
      '郝',
      '龚',
      '邵',
      '万',
      '钱',
      '严',
      '覃',
      '武',
      '戴',
      '莫',
      '孔',
      '向',
      '汤'
    ];

    final List<String> nicknamePrefixes = [
      '快乐的',
      '阳光',
      '微笑',
      '智慧',
      '勇敢',
      '温柔',
      '活力',
      '梦想',
      '创意',
      '自由',
      '星光',
      '海洋',
      '山峰',
      '森林',
      '花朵',
      '雨滴',
      '雪花',
      '彩虹',
      '月光',
      '阳光',
      '微风',
      '雷电',
      '云朵',
      '星星',
      '流星',
      '宇宙',
      '地球',
      '火焰',
      '冰雪',
      '沙漠'
    ];

    final List<String> nicknameSuffixes = [
      '探险家',
      '旅行者',
      '梦想家',
      '思考者',
      '创造者',
      '观察者',
      '收藏家',
      '追梦人',
      '守护者',
      '冒险家',
      '猎人',
      '战士',
      '魔法师',
      '骑士',
      '国王',
      '王后',
      '公主',
      '王子',
      '精灵',
      '巫师',
      '龙骑士',
      '海盗',
      '忍者',
      '武士',
      '侠客',
      '剑客',
      '弓箭手',
      '法师',
      '牧师',
      '德鲁伊'
    ];

    // 根据描述选择合适的后缀
    final List<String> contextualSuffixes = [];
    if (description.contains('运动') ||
        description.contains('篮球') ||
        description.contains('足球')) {
      contextualSuffixes.addAll(['运动员', '球员', '冠军', '教练']);
    }
    if (description.contains('音乐') || description.contains('耳机')) {
      contextualSuffixes.addAll(['音乐家', '歌手', '作曲家', 'DJ', '鼓手', '吉他手']);
    }
    if (description.contains('厨师') || description.contains('餐厅')) {
      contextualSuffixes.addAll(['大厨', '美食家', '品鉴师', '烹饪师']);
    }
    if (description.contains('程序员') || description.contains('实验室')) {
      contextualSuffixes.addAll(['工程师', '科学家', '研究员', '黑客', '极客']);
    }
    if (description.contains('法庭')) {
      contextualSuffixes.addAll(['律师', '法官', '辩护人']);
    }
    if (description.contains('艺术') || description.contains('波西米亚')) {
      contextualSuffixes.addAll(['艺术家', '设计师', '创作者', '诗人']);
    }

    String firstName;
    if (gender == '男性') {
      firstName = maleFirstNames[_random.nextInt(maleFirstNames.length)];
    } else {
      firstName = femaleFirstNames[_random.nextInt(femaleFirstNames.length)];
    }

    final String lastName = lastNames[_random.nextInt(lastNames.length)];

    // 生成昵称的几种方式
    final int nicknameType = _random.nextInt(5);

    switch (nicknameType) {
      case 0:
        // 真实姓名风格
        return '$lastName$firstName';
      case 1:
        // 前缀+名字
        return '${nicknamePrefixes[_random.nextInt(nicknamePrefixes.length)]}$firstName';
      case 2:
        // 名字+后缀
        final List<String> allSuffixes = [
          ...nicknameSuffixes,
          ...contextualSuffixes
        ];
        return '$firstName${allSuffixes[_random.nextInt(allSuffixes.length)]}';
      case 3:
        // 前缀+后缀
        final List<String> allSuffixes = [
          ...nicknameSuffixes,
          ...contextualSuffixes
        ];
        return '${nicknamePrefixes[_random.nextInt(nicknamePrefixes.length)]}${allSuffixes[_random.nextInt(allSuffixes.length)]}';
      case 4:
        // 英文字母+数字组合
        final String letters = 'abcdefghijklmnopqrstuvwxyz';
        final String randomLetters = String.fromCharCodes(List.generate(
                2, (_) => letters.codeUnitAt(_random.nextInt(letters.length))))
            .toUpperCase();
        final int randomNumber = _random.nextInt(1000);
        return '$randomLetters$randomNumber$firstName';
      default:
        return '$lastName$firstName';
    }
  }

  // 生成随机地点
  static String _generateLocation() {
    final List<String> cities = [
      '纽约',
      '洛杉矶',
      '伦敦',
      '巴黎',
      '东京',
      '首尔',
      '悉尼',
      '多伦多',
      '柏林',
      '罗马',
      '马德里',
      '阿姆斯特丹',
      '新加坡',
      '曼谷',
      '迪拜',
      '莫斯科',
      '孟买',
      '开罗',
      '里约热内卢',
      '墨西哥城',
      '温哥华',
      '奥斯陆',
      '斯德哥尔摩',
      '赫尔辛基',
      '布拉格',
      '维也纳',
      '布达佩斯',
      '华沙',
      '雅典',
      '苏黎世'
    ];

    return cities[_random.nextInt(cities.length)];
  }

  // 生成随机职业
  static String _generateOccupation(String description) {
    final List<String> occupations = [
      '软件工程师',
      '医生',
      '教师',
      '律师',
      '设计师',
      '会计师',
      '市场营销',
      '销售',
      '客服',
      '人力资源',
      '研究员',
      '作家',
      '记者',
      '摄影师',
      '艺术家',
      '音乐家',
      '厨师',
      '健身教练',
      '导游',
      '飞行员',
      '工程师',
      '建筑师',
      '室内设计师',
      '园艺师',
      '农民',
      '渔民',
      '警察',
      '消防员',
      '军人',
      '公务员'
    ];

    // 根据描述选择合适的职业
    if (description.contains('程序员')) return '软件工程师';
    if (description.contains('厨师')) return '厨师';
    if (description.contains('军装') || description.contains('军营')) return '军人';
    if (description.contains('法庭')) return '律师';
    if (description.contains('实验室')) return '研究员';
    if (description.contains('工装') || description.contains('工地')) return '建筑工人';
    if (description.contains('西装') ||
        description.contains('职业装') ||
        description.contains('会议室')) return '商务人士';
    if (description.contains('音乐') || description.contains('录音棚')) return '音乐家';
    if (description.contains('瑜伽') || description.contains('健身房'))
      return '健身教练';

    return occupations[_random.nextInt(occupations.length)];
  }

  // 生成个人描述
  static String _generateDescription(String info, String gender, int age,
      String ethnicity, String occupation) {
    final List<String> personalityTraits = [
      '热情',
      '友善',
      '开朗',
      '内向',
      '谨慎',
      '大胆',
      '创新',
      '传统',
      '幽默',
      '严肃',
      '细心',
      '粗心',
      '乐观',
      '悲观',
      '自信',
      '谦虚',
      '勤奋',
      '懒惰',
      '节俭',
      '奢侈',
      '理性',
      '感性',
      '务实',
      '理想',
      '独立',
      '依赖',
      '专注',
      '分散',
      '冷静',
      '冲动'
    ];

    final List<String> hobbies = [
      '阅读',
      '写作',
      '绘画',
      '摄影',
      '旅行',
      '烹饪',
      '园艺',
      '钓鱼',
      '徒步',
      '露营',
      '游泳',
      '跑步',
      '瑜伽',
      '冥想',
      '收藏',
      '手工',
      '编程',
      '电影',
      '音乐',
      '舞蹈',
      '唱歌',
      '乐器',
      '棋牌',
      '电子游戏',
      '桌游',
      '志愿服务',
      '学习语言',
      '天文',
      '历史',
      '科技'
    ];

    // 生活方式
    final List<String> lifestyles = [
      '极简主义',
      '环保生活',
      '数字游民',
      '城市探险家',
      '美食家',
      '健身爱好者',
      '瑜伽修行者',
      '冒险家',
      '艺术爱好者',
      '科技极客',
      '书虫',
      '电影迷',
      '音乐发烧友',
      '咖啡爱好者',
      '茶道爱好者',
      '葡萄酒鉴赏家',
      '摄影师',
      '旅行博主',
      '美食博主',
      '时尚达人'
    ];

    // 价值观
    final List<String> values = [
      '家庭至上',
      '追求自由',
      '热爱和平',
      '保护环境',
      '尊重多元文化',
      '追求平等',
      '终身学习',
      '诚实正直',
      '乐于助人',
      '追求卓越',
      '创新思维',
      '团队合作',
      '独立思考',
      '社会责任',
      '文化传承'
    ];

    // 生活目标
    final List<String> goals = [
      '环游世界',
      '创办自己的企业',
      '学习多门语言',
      '写一本书',
      '参与志愿服务',
      '学习一门乐器',
      '掌握烹饪技巧',
      '攀登高峰',
      '完成马拉松',
      '学习新技能',
      '建立深厚友谊',
      '追求工作与生活平衡',
      '探索不同文化',
      '成为行业专家',
      '培养健康生活方式'
    ];

    // 根据描述选择合适的爱好
    final List<String> contextualHobbies = [];
    if (info.contains('篮球')) contextualHobbies.add('打篮球');
    if (info.contains('足球')) contextualHobbies.add('踢足球');
    if (info.contains('音乐') || info.contains('耳机'))
      contextualHobbies.add('听音乐');
    if (info.contains('图书馆')) contextualHobbies.add('阅读');
    if (info.contains('冲浪')) contextualHobbies.add('冲浪');
    if (info.contains('滑雪')) contextualHobbies.add('滑雪');
    if (info.contains('登山')) contextualHobbies.add('登山');
    if (info.contains('潜水')) contextualHobbies.add('潜水');
    if (info.contains('艺术')) contextualHobbies.add('欣赏艺术');

    // 选择性格特点
    final String personality =
        personalityTraits[_random.nextInt(personalityTraits.length)];
    final String secondaryPersonality =
        personalityTraits[_random.nextInt(personalityTraits.length)];

    // 选择爱好
    String hobby;
    String secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
    if (contextualHobbies.isNotEmpty) {
      hobby = contextualHobbies[_random.nextInt(contextualHobbies.length)];
      // 确保第二个爱好与第一个不同
      while (secondaryHobby == hobby && hobbies.length > 1) {
        secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
      }
    } else {
      hobby = hobbies[_random.nextInt(hobbies.length)];
      // 确保第二个爱好与第一个不同
      while (secondaryHobby == hobby && hobbies.length > 1) {
        secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
      }
    }

    // 选择生活方式
    final String lifestyle = lifestyles[_random.nextInt(lifestyles.length)];

    // 选择价值观
    final String value = values[_random.nextInt(values.length)];

    // 选择生活目标
    final String goal = goals[_random.nextInt(goals.length)];

    // 根据职业添加专业描述
    String professionalDescription = '';
    if (occupation.contains('工程师') || occupation.contains('程序员')) {
      professionalDescription = '在技术领域有着丰富的经验，擅长解决复杂问题和创新思考。';
    } else if (occupation.contains('设计师')) {
      professionalDescription = '有着敏锐的审美眼光和创意思维，善于将想法转化为视觉作品。';
    } else if (occupation.contains('医生') || occupation.contains('护士')) {
      professionalDescription = '关心他人健康，富有同情心，在医疗领域追求专业卓越。';
    } else if (occupation.contains('教师') || occupation.contains('教授')) {
      professionalDescription = '热爱教育事业，善于启发学生思考，乐于分享知识。';
    } else if (occupation.contains('作家') || occupation.contains('编辑')) {
      professionalDescription = '文字功底深厚，善于表达和讲述故事，对文学有着浓厚兴趣。';
    } else if (occupation.contains('艺术') || occupation.contains('音乐')) {
      professionalDescription = '艺术天赋出众，追求创意表达，在艺术领域不断探索和创新。';
    } else if (occupation.contains('商') || occupation.contains('销售')) {
      professionalDescription = '具有出色的沟通能力和商业头脑，善于把握市场机会。';
    } else {
      professionalDescription = '在工作中追求专业和卓越，不断学习和提升自己的能力。';
    }

    // 根据年龄段添加不同的描述
    String ageRelatedDescription = '';
    if (age < 25) {
      ageRelatedDescription = '年轻有活力，充满对未来的憧憬和热情，正在探索人生的各种可能性。';
    } else if (age < 35) {
      ageRelatedDescription = '处于事业发展的关键阶段，平衡工作与个人生活，追求自我实现。';
    } else if (age < 50) {
      ageRelatedDescription = '拥有丰富的人生经验，事业和生活较为稳定，注重生活品质和个人成长。';
    } else {
      ageRelatedDescription = '阅历丰富，生活智慧深厚，珍视人生中的每一刻，乐于分享经验。';
    }

    // 构建更丰富的描述模板
    final List<String> templates = [
      '一位$age岁的$ethnicity$gender，性格$personality且$secondaryPersonality，是一名$occupation。$professionalDescription 平时喜欢$hobby和$secondaryHobby，$lifestyle生活方式的践行者。$ageRelatedDescription 崇尚$value，梦想有一天能$goal。',
      '$personality且$secondaryPersonality的$ethnicity$gender，$age岁，职业是$occupation。$professionalDescription 来自$info，$ageRelatedDescription 闲暇时光喜欢$hobby，偶尔也会$secondaryHobby。作为一个$lifestyle，$value对TA来说非常重要，未来希望能$goal。',
      '来自$info的$age岁$ethnicity$gender，是一位$occupation。$professionalDescription $personality的性格使TA在工作中表现出色，而$secondaryPersonality的一面则体现在生活中。$ageRelatedDescription 热爱$hobby和$secondaryHobby，崇尚$lifestyle的生活。$value是TA的人生信条，希望有朝一日能$goal。',
      '$age岁$personality的$ethnicity$gender，$occupation。$professionalDescription 虽然工作中是$personality的，但私下里却是$secondaryPersonality的。$ageRelatedDescription 最大的爱好是$hobby，也喜欢$secondaryHobby。作为$lifestyle，$value在TA的生活中占有重要位置，梦想着能$goal。',
      '$occupation，$age岁，$ethnicity$gender。$professionalDescription $personality且$secondaryPersonality的性格，来自$info。$ageRelatedDescription 喜欢$hobby和$secondaryHobby，过着$lifestyle的生活。$value是TA一直坚持的原则，希望未来能够$goal。'
    ];

    return templates[_random.nextInt(templates.length)];
  }

  // 生成用户列表
  static List<User> getUsers() {
    // 如果已经有缓存数据，直接返回
    if (_cachedUsers != null) {
      return _cachedUsers!;
    }

    final List<String> userInfos = [
      '女性，30岁，戴眼镜，微笑，穿着职业装，背景是现代办公室，亚洲人。',
      '男性，25岁，运动装，手持篮球，背景是户外篮球场，非裔美国人。',
      '女性，40岁，长卷发，佩戴珍珠耳环，背景是高档餐厅，欧洲人。',
      '男性，35岁，胡子，穿着牛仔夹克，背景是城市街道，拉丁裔。',
      '女性，28岁，短发，穿着夏装，背景是海滩，白人。',
      '男性，50岁，光头，穿着休闲衬衫，背景是图书馆，亚洲人。',
      '女性，22岁，卷发，佩戴耳机，背景是音乐录音棚，非裔美国人。',
      '男性，45岁，戴眼镜，穿着西装，背景是会议室，白人。',
      '女性，32岁，长直发，穿着瑜伽服，背景是健身房，印度裔。',
      '男性，38岁，络腮胡，穿着皮夹克，背景是摩托车旁，拉丁裔。',
      '女性，27岁，短发，穿着实验室外套，背景是实验室，亚洲人。',
      '男性，29岁，穿着冲浪装，背景是海浪，白人。',
      '女性，35岁，戴帽子，穿着冬装，背景是雪山，欧洲人。',
      '男性，31岁，留着寸头，穿着军装，背景是军营，非裔美国人。',
      '女性，45岁，微笑，穿着厨师服，背景是餐厅厨房，拉丁裔。',
      '男性，28岁，穿着滑雪服，背景是滑雪场，白人。',
      '女性，40岁，戴太阳镜，穿着休闲沙滩装，背景是阳光明媚的沙滩，非裔美国人。',
      '男性，24岁，卷发，穿着摇滚风格服装，背景是音乐会舞台，欧洲人。',
      '女性，30岁，戴着时尚眼镜，背景是城市咖啡馆，亚洲人。',
      '男性，50岁，穿着登山服，背景是登山步道，白人。',
      '女性，26岁，穿着格子衫，背景是办公室，印度裔，程序员。',
      '男性，35岁，穿着工装，背景是工地现场，拉丁裔。',
      '女性，29岁，金发，穿着传统和服，背景是樱花树下，亚洲人。',
      '男性，40岁，穿着西服，背景是法庭，白人。',
      '女性，33岁，穿着波西米亚风格服装，背景是艺术展，非裔美国人。',
      '男性，37岁，穿着潜水服，背景是海底珊瑚礁，欧洲人。',
      '女性，25岁，穿着夏装，背景是音乐节现场，拉丁裔。',
      '男性，42岁，穿着厨师服，背景是高档餐厅厨房，亚洲人。',
      '女性，31岁，穿着时尚礼服，背景是红毯，白人。',
      '男性，27岁，穿着运动服，背景是足球场，非裔美国人。',
    ];

    final List<User> users = [];

    for (int i = 0; i < userInfos.length; i++) {
      final String info = userInfos[i];
      final List<String> parts = info.split('，');

      final String gender = parts[0];
      final int age = int.parse(parts[1].replaceAll('岁', ''));

      String ethnicity = '';
      String background = '';

      // 提取民族信息
      for (String part in parts) {
        if (part.contains('亚洲人'))
          ethnicity = '亚洲人';
        else if (part.contains('非裔美国人'))
          ethnicity = '非裔美国人';
        else if (part.contains('欧洲人'))
          ethnicity = '欧洲人';
        else if (part.contains('拉丁裔'))
          ethnicity = '拉丁裔';
        else if (part.contains('白人'))
          ethnicity = '白人';
        else if (part.contains('印度裔')) ethnicity = '印度裔';
      }

      // 提取背景信息
      for (String part in parts) {
        if (part.contains('背景是')) {
          background = part.split('背景是')[1].trim();
          if (background.endsWith('。')) {
            background = background.substring(0, background.length - 1);
          }
        }
      }

      final String occupation = _generateOccupation(info);
      final String location = _generateLocation();
      final String nickname = _generateNickname(gender, age, ethnicity, info);
      final List<UserTag> tags =
          _generateRandomTags(info, gender, ethnicity, background);
      final String description =
          _generateDescription(info, gender, age, ethnicity, occupation);

      // 使用固定的在线状态和最后活跃时间，而不是随机生成
      final bool isOnline = i % 3 == 0; // 每三个用户中有一个在线
      final DateTime lastActive = DateTime.now()
          .subtract(Duration(minutes: (i + 1) * 30)); // 依次递增的最后活跃时间

      users.add(User(
        userId: 'user_${i + 1}',
        nickname: nickname,
        avatarPath: 'assets/images/avatars/${i + 1}.png',
        gender: gender,
        age: age,
        description: description,
        tags: tags,
        occupation: occupation,
        location: location,
        isOnline: isOnline,
        lastActive: lastActive,
        messageCount: (i + 1) * 3, // 依次递增的消息数
        isPremium: false, // 移除VIP功能，所有用户都不是高级用户
        ethnicity: ethnicity,
        background: background,
      ));
    }

    // 缓存生成的用户数据
    _cachedUsers = users;

    return users;
  }
}
