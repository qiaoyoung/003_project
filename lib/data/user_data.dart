import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'dart:math';

class UserData {
  static final Random _random = Random(
      42); // Using a fixed seed to ensure the same random numbers each time
  static List<User>? _cachedUsers; // Cache user data

  // Generate random tags
  static List<UserTag> _generateRandomTags(
      String description, String gender, String ethnicity, String background) {
    final List<String> possibleTags = [];

    // Extract keywords from description as tags
    if (description.contains('glasses')) possibleTags.add('Glasses');
    if (description.contains('smile')) possibleTags.add('Smiling');
    if (description.contains('professional attire') ||
        description.contains('suit')) possibleTags.add('Professional');
    if (description.contains('sports')) possibleTags.add('Sports Enthusiast');
    if (description.contains('basketball')) possibleTags.add('Basketball');
    if (description.contains('long hair') || description.contains('curly hair'))
      possibleTags.add('Long Hair');
    if (description.contains('short hair')) possibleTags.add('Short Hair');
    if (description.contains('pearl')) possibleTags.add('Fashionable');
    if (description.contains('restaurant')) possibleTags.add('Foodie');
    if (description.contains('beard')) possibleTags.add('Bearded');
    if (description.contains('denim')) possibleTags.add('Casual Style');
    if (description.contains('city')) possibleTags.add('Urban Life');
    if (description.contains('summer clothes'))
      possibleTags.add('Summer Vibes');
    if (description.contains('beach')) possibleTags.add('Beach Lover');
    if (description.contains('bald')) possibleTags.add('Bald');
    if (description.contains('library')) possibleTags.add('Book Lover');
    if (description.contains('headphones') || description.contains('music'))
      possibleTags.add('Music Lover');
    if (description.contains('recording studio')) possibleTags.add('Musician');
    if (description.contains('conference room'))
      possibleTags.add('Business Person');
    if (description.contains('yoga')) possibleTags.add('Yoga Enthusiast');
    if (description.contains('gym')) possibleTags.add('Fitness Enthusiast');
    if (description.contains('leather jacket') ||
        description.contains('motorcycle')) possibleTags.add('Biker');
    if (description.contains('laboratory')) possibleTags.add('Researcher');
    if (description.contains('surfing')) possibleTags.add('Surfer');
    if (description.contains('waves')) possibleTags.add('Ocean Lover');
    if (description.contains('hat')) possibleTags.add('Hat Lover');
    if (description.contains('winter clothes') ||
        description.contains('snow mountain'))
      possibleTags.add('Winter Sports');
    if (description.contains('military uniform') ||
        description.contains('military camp')) possibleTags.add('Military');
    if (description.contains('chef')) possibleTags.add('Chef');
    if (description.contains('skiing')) possibleTags.add('Skier');
    if (description.contains('sunglasses')) possibleTags.add('Fashionista');
    if (description.contains('beach')) possibleTags.add('Beach Lover');
    if (description.contains('rock')) possibleTags.add('Rock Fan');
    if (description.contains('cafe')) possibleTags.add('Coffee Lover');
    if (description.contains('hiking')) possibleTags.add('Hiker');
    if (description.contains('programmer')) possibleTags.add('Programmer');
    if (description.contains('work clothes') ||
        description.contains('construction site'))
      possibleTags.add('Construction Worker');
    if (description.contains('kimono')) possibleTags.add('Traditional Culture');
    if (description.contains('cherry blossom'))
      possibleTags.add('Cherry Blossom Lover');
    if (description.contains('court')) possibleTags.add('Legal Professional');
    if (description.contains('bohemian')) possibleTags.add('Bohemian Style');
    if (description.contains('art')) possibleTags.add('Art Lover');
    if (description.contains('diving')) possibleTags.add('Diver');
    if (description.contains('coral reef')) possibleTags.add('Ocean Explorer');
    if (description.contains('music festival'))
      possibleTags.add('Festival Goer');
    if (description.contains('formal dress') ||
        description.contains('red carpet')) possibleTags.add('Fashionista');
    if (description.contains('football') || description.contains('soccer'))
      possibleTags.add('Football Fan');

    // Add gender tag
    possibleTags.add(gender);

    // Add ethnicity tag
    if (ethnicity.isNotEmpty) {
      possibleTags.add(ethnicity);
    }

    // Add background tag
    if (background.isNotEmpty && !possibleTags.contains(background)) {
      possibleTags.add(background);
    }

    // Randomly select 3-5 tags
    final int tagCount =
        min(possibleTags.length, _random.nextInt(3) + 3); // 3-5 tags
    final List<String> selectedTags = [];

    while (selectedTags.length < tagCount && possibleTags.isNotEmpty) {
      final String tag =
          possibleTags.removeAt(_random.nextInt(possibleTags.length));
      selectedTags.add(tag);
    }

    // Assign colors to tags
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

  // Generate random nickname
  static String _generateNickname(
      String gender, int age, String ethnicity, String description) {
    final List<String> maleFirstNames = [
      'Alex',
      'David',
      'Jack',
      'Mike',
      'Thomas',
      'Lee',
      'Wang',
      'Zhang',
      'Liu',
      'John',
      'Sam',
      'Raj',
      'Carlos',
      'Antonio',
      'Hassan',
      'Ali',
      'Yamada',
      'Tanaka',
      'Sato',
      'William',
      'Robert',
      'James',
      'Michael',
      'Daniel',
      'Matthew',
      'Ryan',
      'Kevin',
      'Brian',
      'George',
      'Edward'
    ];
    final List<String> femaleFirstNames = [
      'Emma',
      'Lily',
      'Amy',
      'Sophia',
      'Maria',
      'Anna',
      'Wang',
      'Li',
      'Zhang',
      'Liu',
      'Jenny',
      'Samantha',
      'Priya',
      'Isabella',
      'Gabriela',
      'Fatima',
      'Aisha',
      'Sato',
      'Suzuki',
      'Takahashi',
      'Sarah',
      'Jessica',
      'Emily',
      'Olivia',
      'Charlotte',
      'Mia',
      'Amelia',
      'Harper',
      'Evelyn',
      'Abigail'
    ];

    final List<String> lastNames = [
      'Smith',
      'Johnson',
      'Williams',
      'Brown',
      'Jones',
      'Garcia',
      'Rodriguez',
      'Li',
      'Wang',
      'Zhang',
      'Chen',
      'Yang',
      'Huang',
      'Zhao',
      'Wu',
      'Zhou',
      'Xu',
      'Sun',
      'Ma',
      'Zhu',
      'Hu',
      'Lin',
      'Guo',
      'He',
      'Gao',
      'Luo',
      'Zheng',
      'Liang',
      'Xie',
      'Song',
      'Tang',
      'Xu',
      'Han',
      'Feng',
      'Deng',
      'Cao',
      'Peng'
    ];

    final List<String> nicknamePrefixes = [
      'Happy',
      'Sunny',
      'Smiling',
      'Wise',
      'Brave',
      'Gentle',
      'Energetic',
      'Dreamy',
      'Creative',
      'Starlight',
      'Ocean',
      'Mountain',
      'Forest',
      'Flower',
      'Raindrop',
      'Snowflake',
      'Rainbow',
      'Moonlight',
      'Sunshine',
      'Breeze',
      'Thunder',
      'Cloud',
      'Star',
      'Meteor',
      'Cosmic',
      'Earth',
      'Flame',
      'Ice',
      'Desert'
    ];

    final List<String> nicknameSuffixes = [
      'Explorer',
      'Traveler',
      'Dreamer',
      'Thinker',
      'Creator',
      'Observer',
      'Collector',
      'Pursuer',
      'Guardian',
      'Adventurer',
      'Hunter',
      'Warrior',
      'Wizard',
      'Knight',
      'King',
      'Queen',
      'Princess',
      'Prince',
      'Elf',
      'Sorcerer',
      'DragonRider',
      'Pirate',
      'Ninja',
      'Samurai',
      'Hero',
      'Swordsman',
      'Archer',
      'Mage',
      'Cleric',
      'Druid',
      'Voyager',
      'Wanderer',
      'Seeker',
      'Nomad',
      'Pioneer',
      'Ranger',
      'Scout',
      'Pathfinder',
      'Trailblazer',
      'Discoverer',
      'Innovator',
      'Visionary',
      'Genius',
      'Prodigy',
      'Master',
      'Champion',
      'Legend',
      'Mystic',
      'Sage',
      'Scholar'
    ];

    // Choose appropriate suffixes based on description
    final List<String> contextualSuffixes = [];
    if (description.contains('sports') ||
        description.contains('basketball') ||
        description.contains('football')) {
      contextualSuffixes.addAll(['Athlete', 'Player', 'Champion', 'Coach']);
    }
    if (description.contains('music') || description.contains('headphones')) {
      contextualSuffixes.addAll(
          ['Musician', 'Singer', 'Composer', 'DJ', 'Drummer', 'Guitarist']);
    }
    if (description.contains('chef') || description.contains('restaurant')) {
      contextualSuffixes.addAll(['Chef', 'Foodie', 'Gourmet', 'Cook']);
    }
    if (description.contains('programmer') ||
        description.contains('laboratory')) {
      contextualSuffixes
          .addAll(['Engineer', 'Scientist', 'Researcher', 'Hacker', 'Geek']);
    }
    if (description.contains('court')) {
      contextualSuffixes.addAll(['Lawyer', 'Judge', 'Defender']);
    }
    if (description.contains('art') || description.contains('bohemian')) {
      contextualSuffixes.addAll(['Artist', 'Designer', 'Creator', 'Poet']);
    }

    String firstName;
    if (gender == 'Male') {
      firstName = maleFirstNames[_random.nextInt(maleFirstNames.length)];
    } else {
      firstName = femaleFirstNames[_random.nextInt(femaleFirstNames.length)];
    }

    final String lastName = lastNames[_random.nextInt(lastNames.length)];

    // Several ways to generate nicknames
    final int nicknameType = _random.nextInt(5);

    switch (nicknameType) {
      case 0:
        // Real name style
        return '$lastName$firstName';
      case 1:
        // Prefix + name
        return '${nicknamePrefixes[_random.nextInt(nicknamePrefixes.length)]}$firstName';
      case 2:
        // Name + suffix
        final List<String> allSuffixes = [
          ...nicknameSuffixes,
          ...contextualSuffixes
        ];
        return '$firstName${allSuffixes[_random.nextInt(allSuffixes.length)]}';
      case 3:
        // Prefix + suffix
        final List<String> allSuffixes = [
          ...nicknameSuffixes,
          ...contextualSuffixes
        ];
        return '${nicknamePrefixes[_random.nextInt(nicknamePrefixes.length)]}${allSuffixes[_random.nextInt(allSuffixes.length)]}';
      case 4:
        // English letters + numbers combination
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

  // Generate random location
  static String _generateLocation() {
    final List<String> cities = [
      'New York',
      'Los Angeles',
      'London',
      'Paris',
      'Tokyo',
      'Seoul',
      'Sydney',
      'Toronto',
      'Berlin',
      'Rome',
      'Madrid',
      'Amsterdam',
      'Singapore',
      'Bangkok',
      'Dubai',
      'Moscow',
      'Mumbai',
      'Cairo',
      'Rio de Janeiro',
      'Mexico City',
      'Vancouver',
      'Oslo',
      'Stockholm',
      'Helsinki',
      'Prague',
      'Vienna',
      'Budapest',
      'Warsaw',
      'Athens',
      'Zurich'
    ];

    return cities[_random.nextInt(cities.length)];
  }

  // Generate random occupation
  static String _generateOccupation(String description) {
    final List<String> occupations = [
      'Software Engineer',
      'Doctor',
      'Teacher',
      'Lawyer',
      'Designer',
      'Accountant',
      'Marketing Specialist',
      'Sales Representative',
      'Customer Service',
      'HR Professional',
      'Researcher',
      'Writer',
      'Journalist',
      'Photographer',
      'Artist',
      'Musician',
      'Chef',
      'Fitness Trainer',
      'Tour Guide',
      'Pilot',
      'Engineer',
      'Architect',
      'Interior Designer',
      'Gardener',
      'Farmer',
      'Fisherman',
      'Police Officer',
      'Firefighter',
      'Military Personnel',
      'Civil Servant'
    ];

    // Select appropriate occupation based on description
    if (description.contains('programmer')) return 'Software Engineer';
    if (description.contains('chef')) return 'Chef';
    if (description.contains('military uniform') ||
        description.contains('military camp')) return 'Military Personnel';
    if (description.contains('court')) return 'Lawyer';
    if (description.contains('laboratory')) return 'Researcher';
    if (description.contains('work clothes') ||
        description.contains('construction site')) return 'Construction Worker';
    if (description.contains('suit') ||
        description.contains('professional attire') ||
        description.contains('conference room')) return 'Business Professional';
    if (description.contains('music') ||
        description.contains('recording studio')) return 'Musician';
    if (description.contains('yoga') || description.contains('gym'))
      return 'Fitness Trainer';

    return occupations[_random.nextInt(occupations.length)];
  }

  // Generate personal description
  static String _generateDescription(String info, String gender, int age,
      String ethnicity, String occupation) {
    final List<String> personalityTraits = [
      'Enthusiastic',
      'Friendly',
      'Outgoing',
      'Introverted',
      'Cautious',
      'Bold',
      'Innovative',
      'Traditional',
      'Humorous',
      'Serious',
      'Meticulous',
      'Careless',
      'Optimistic',
      'Pessimistic',
      'Confident',
      'Humble',
      'Diligent',
      'Lazy',
      'Frugal',
      'Extravagant',
      'Rational',
      'Emotional',
      'Practical',
      'Idealistic',
      'Independent',
      'Dependent',
      'Focused',
      'Scattered',
      'Calm',
      'Impulsive'
    ];

    final List<String> hobbies = [
      'Reading',
      'Writing',
      'Painting',
      'Photography',
      'Traveling',
      'Cooking',
      'Gardening',
      'Fishing',
      'Hiking',
      'Camping',
      'Swimming',
      'Running',
      'Yoga',
      'Meditation',
      'Collecting',
      'Crafting',
      'Programming',
      'Watching Movies',
      'Listening to Music',
      'Dancing',
      'Singing',
      'Playing Instruments',
      'Board Games',
      'Video Games',
      'Tabletop Games',
      'Volunteering',
      'Learning Languages',
      'Astronomy',
      'History',
      'Technology'
    ];

    // Lifestyle
    final List<String> lifestyles = [
      'Minimalist',
      'Eco-friendly',
      'Digital Nomad',
      'Urban Explorer',
      'Foodie',
      'Fitness Enthusiast',
      'Yoga Practitioner',
      'Adventurer',
      'Art Lover',
      'Tech Geek',
      'Bookworm',
      'Movie Buff',
      'Music Enthusiast',
      'Coffee Lover',
      'Tea Connoisseur',
      'Wine Enthusiast',
      'Photographer',
      'Travel Blogger',
      'Food Blogger',
      'Fashion Enthusiast'
    ];

    // Values
    final List<String> values = [
      'Family First',
      'Freedom',
      'Peace',
      'Environmental Protection',
      'Cultural Diversity',
      'Equality',
      'Lifelong Learning',
      'Honesty',
      'Helpfulness',
      'Excellence',
      'Innovation',
      'Teamwork',
      'Independent Thinking',
      'Social Responsibility',
      'Cultural Heritage'
    ];

    // Life goals
    final List<String> goals = [
      'Travel the World',
      'Start a Business',
      'Learn Multiple Languages',
      'Write a Book',
      'Volunteer',
      'Learn an Instrument',
      'Master Cooking',
      'Climb Mountains',
      'Complete a Marathon',
      'Learn New Skills',
      'Build Deep Friendships',
      'Achieve Work-Life Balance',
      'Explore Different Cultures',
      'Become an Expert',
      'Develop a Healthy Lifestyle'
    ];

    // Select appropriate hobbies based on description
    final List<String> contextualHobbies = [];
    if (info.contains('basketball'))
      contextualHobbies.add('Playing Basketball');
    if (info.contains('football')) contextualHobbies.add('Playing Football');
    if (info.contains('music') || info.contains('headphones'))
      contextualHobbies.add('Listening to Music');
    if (info.contains('library')) contextualHobbies.add('Reading');
    if (info.contains('surfing')) contextualHobbies.add('Surfing');
    if (info.contains('skiing')) contextualHobbies.add('Skiing');
    if (info.contains('hiking')) contextualHobbies.add('Hiking');
    if (info.contains('diving')) contextualHobbies.add('Diving');
    if (info.contains('art')) contextualHobbies.add('Appreciating Art');

    // Select personality traits
    final String personality =
        personalityTraits[_random.nextInt(personalityTraits.length)];
    final String secondaryPersonality =
        personalityTraits[_random.nextInt(personalityTraits.length)];

    // Select hobby
    String hobby;
    String secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
    if (contextualHobbies.isNotEmpty) {
      hobby = contextualHobbies[_random.nextInt(contextualHobbies.length)];
      // Ensure second hobby is different from the first
      while (secondaryHobby == hobby && hobbies.length > 1) {
        secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
      }
    } else {
      hobby = hobbies[_random.nextInt(hobbies.length)];
      // Ensure second hobby is different from the first
      while (secondaryHobby == hobby && hobbies.length > 1) {
        secondaryHobby = hobbies[_random.nextInt(hobbies.length)];
      }
    }

    // Select lifestyle
    final String lifestyle = lifestyles[_random.nextInt(lifestyles.length)];

    // Select value
    final String value = values[_random.nextInt(values.length)];

    // Select life goal
    final String goal = goals[_random.nextInt(goals.length)];

    // Add professional description based on occupation
    String professionalDescription = '';
    if (occupation.contains('Engineer') || occupation.contains('Software')) {
      professionalDescription =
          'Has rich experience in the tech field, excels at solving complex problems and innovative thinking.';
    } else if (occupation.contains('Designer')) {
      professionalDescription =
          'Has a keen aesthetic eye and creative mind, skilled at transforming ideas into visual works.';
    } else if (occupation.contains('Doctor') || occupation.contains('Nurse')) {
      professionalDescription =
          'Cares about others\' health, compassionate, and pursues professional excellence in the medical field.';
    } else if (occupation.contains('Teacher') ||
        occupation.contains('Professor')) {
      professionalDescription =
          'Passionate about education, good at inspiring students to think, and enjoys sharing knowledge.';
    } else if (occupation.contains('Writer') || occupation.contains('Editor')) {
      professionalDescription =
          'Has strong writing skills, good at expression and storytelling, with a deep interest in literature.';
    } else if (occupation.contains('Artist') || occupation.contains('Music')) {
      professionalDescription =
          'Has outstanding artistic talent, pursues creative expression, and continuously explores and innovates in the art field.';
    } else if (occupation.contains('Sales') ||
        occupation.contains('Marketing')) {
      professionalDescription =
          'Has excellent communication skills and business acumen, good at seizing market opportunities.';
    } else {
      professionalDescription =
          'Pursues professionalism and excellence at work, continuously learning and improving abilities.';
    }

    // Add age-related description
    String ageRelatedDescription = '';
    if (age < 25) {
      ageRelatedDescription =
          'Young and energetic, full of aspirations and passion for the future, exploring various possibilities in life.';
    } else if (age < 35) {
      ageRelatedDescription =
          'At a critical stage of career development, balancing work and personal life, pursuing self-realization.';
    } else if (age < 50) {
      ageRelatedDescription =
          'Has rich life experience, relatively stable career and life, focuses on quality of life and personal growth.';
    } else {
      ageRelatedDescription =
          'Experienced, with profound life wisdom, cherishes every moment in life, enjoys sharing experiences.';
    }

    // Build a richer description template
    final List<String> templates = [
      'A $age-year-old $ethnicity $gender with a $personality and $secondaryPersonality personality, working as a $occupation. $professionalDescription Enjoys $hobby and $secondaryHobby, a practitioner of the $lifestyle lifestyle. $ageRelatedDescription Values $value and dreams of one day being able to $goal.',
      'A $personality and $secondaryPersonality $ethnicity $gender, $age years old, working as a $occupation. $professionalDescription From $info, $ageRelatedDescription Enjoys spending free time $hobby, and occasionally $secondaryHobby. As a $lifestyle, $value is very important to them, and they hope to $goal in the future.',
      'A $age-year-old $ethnicity $gender from $info, working as a $occupation. $professionalDescription Their $personality personality makes them excel at work, while their $secondaryPersonality side shows in their personal life. $ageRelatedDescription Loves $hobby and $secondaryHobby, embracing a $lifestyle lifestyle. $value is their life motto, and they hope to $goal someday.',
      'A $age-year-old $personality $ethnicity $gender working as a $occupation. $professionalDescription While they\'re $personality at work, they\'re $secondaryPersonality in private. $ageRelatedDescription Their biggest hobby is $hobby, and they also enjoy $secondaryHobby. As a $lifestyle, $value holds an important place in their life, and they dream of being able to $goal.',
      'A $occupation, $age years old, $ethnicity $gender. $professionalDescription With a $personality and $secondaryPersonality personality, from $info. $ageRelatedDescription Enjoys $hobby and $secondaryHobby, living a $lifestyle lifestyle. $value is a principle they\'ve always upheld, and they hope to $goal in the future.'
    ];

    return templates[_random.nextInt(templates.length)];
  }

  // Get avatar path based on index
  static String _getAvatarPath(int index) {
    return 'assets/images/avatars/$index.png';
  }

  // Generate user list
  static List<User> getUsers() {
    // If there's already cached data, return it directly
    if (_cachedUsers != null) {
      return _cachedUsers!;
    }

    final List<String> userInfos = [
      'Female, 30 years old, wearing glasses, smiling, in professional attire, background is a modern office, Asian.',
      'Male, 25 years old, in sportswear, holding a basketball, background is an outdoor basketball court, African American.',
      'Female, 40 years old, long curly hair, wearing pearl earrings, background is an upscale restaurant, European.',
      'Male, 35 years old, bearded, wearing a denim jacket, background is a city street, Latino.',
      'Female, 28 years old, short hair, wearing summer clothes, background is a beach, Caucasian.',
      'Male, 50 years old, bald, wearing casual shirt, background is a library, Asian.',
      'Female, 22 years old, curly hair, wearing headphones, background is a music recording studio, African American.',
      'Male, 45 years old, wearing glasses, in a suit, background is a conference room, Caucasian.',
      'Female, 32 years old, long straight hair, wearing yoga attire, background is a gym, Indian.',
      'Male, 38 years old, full beard, wearing a leather jacket, background is next to a motorcycle, Latino.',
      'Female, 27 years old, short hair, wearing a lab coat, background is a laboratory, Asian.',
      'Male, 29 years old, wearing surfing gear, background is ocean waves, Caucasian.',
      'Female, 35 years old, wearing a hat, in winter clothes, background is a snow mountain, European.',
      'Male, 31 years old, crew cut, wearing military uniform, background is a military camp, African American.',
      'Female, 45 years old, smiling, wearing chef attire, background is a restaurant kitchen, Latino.',
      'Male, 28 years old, wearing ski gear, background is a ski resort, Caucasian.',
      'Female, 40 years old, wearing sunglasses, in casual beach attire, background is a sunny beach, African American.',
      'Male, 24 years old, curly hair, wearing rock-style clothing, background is a concert stage, European.',
      'Female, 30 years old, wearing fashionable glasses, background is a city cafe, Asian.',
      'Male, 50 years old, wearing hiking gear, background is a hiking trail, Caucasian.',
      'Female, 26 years old, wearing plaid shirt, background is an office, Indian, programmer.',
      'Male, 35 years old, wearing work clothes, background is a construction site, Latino.',
      'Female, 29 years old, blonde hair, wearing traditional kimono, background is under cherry blossom trees, Asian.',
      'Male, 40 years old, wearing a suit, background is a courtroom, Caucasian.',
      'Female, 33 years old, wearing bohemian style clothing, background is an art exhibition, African American.',
      'Male, 37 years old, wearing diving gear, background is underwater coral reef, European.',
      'Female, 25 years old, wearing summer clothes, background is a music festival, Latino.',
      'Male, 42 years old, wearing chef attire, background is a high-end restaurant kitchen, Asian.',
      'Female, 31 years old, wearing fashionable formal dress, background is a red carpet, Caucasian.',
      'Male, 27 years old, wearing sports attire, background is a football field, African American.',
    ];

    final List<User> users = [];

    for (int i = 0; i < userInfos.length; i++) {
      final String info = userInfos[i];
      final List<String> parts = info.split(', ');

      String gender = parts[0];
      int age = int.parse(parts[1].replaceAll(' years old', ''));

      String ethnicity = '';
      String background = '';

      // Extract ethnicity information
      for (String part in parts) {
        if (part.contains('Asian'))
          ethnicity = 'Asian';
        else if (part.contains('African American'))
          ethnicity = 'African American';
        else if (part.contains('European'))
          ethnicity = 'European';
        else if (part.contains('Latino'))
          ethnicity = 'Latino';
        else if (part.contains('Caucasian'))
          ethnicity = 'Caucasian';
        else if (part.contains('Indian')) ethnicity = 'Indian';
      }

      // Extract background information
      for (String part in parts) {
        if (part.contains('background is')) {
          background = part.split('background is ')[1].trim();
          if (background.endsWith('.')) {
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

      // Create user object
      final User user = User(
        userId: 'user$i',
        nickname: nickname,
        avatarPath: _getAvatarPath(i + 1),
        gender: gender,
        age: age,
        description: description,
        tags: tags,
        occupation: occupation,
        location: location,
        isOnline: _random.nextBool(),
        lastActive: DateTime.now().subtract(
          Duration(
            hours: _random.nextInt(72),
            minutes: _random.nextInt(60),
          ),
        ),
        messageCount: _random.nextInt(100),
        ethnicity: ethnicity,
        background: background,
      );

      users.add(user);
    }

    // Cache generated user data
    _cachedUsers = users;

    return users;
  }
}
