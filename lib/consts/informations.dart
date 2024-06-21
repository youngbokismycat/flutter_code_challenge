import 'package:faker/faker.dart';

class Informations {
  static final random = RandomGenerator(seed: 90135135790);
  static final faker = Faker.withGenerator(random);

  static const _baseImageUrl = 'https://picsum.photos/seed';

  static String generateSeededImageUrl() {
    final date = DateTime.now();
    final seed =
        '${date.year}${date.month}${date.day}${date.hour}${date.minute}${date.second}';
    return '$_baseImageUrl/$seed/200';
  }

  static const List<Map<String, dynamic>> infos = [
    {
      "landscape": [
        "assets/images/clone_images/0.jpg",
        "assets/images/clone_images/3.jpg",
        "assets/images/clone_images/4.jpg",
        "assets/images/clone_images/6.jpg",
        "assets/images/clone_images/3.jpg",
        "assets/images/clone_images/4.jpg",
      ],
      "profile": "assets/images/clone_images/profile0.jpg",
      "content":
          "The Alps are a majestic mountain range that stretches across eight countries in Europe. They are renowned for their breathtaking scenery, which includes towering peaks, lush valleys, and crystal-clear lakes. Travelers flock to the Alps year-round to indulge in activities such as skiing, snowboarding, hiking, and mountain biking. Each season brings its own charm, with winter blanketing the landscape in snow and summer revealing vibrant meadows filled with wildflowers. The cultural heritage of the region is equally captivating, with charming villages, historic castles, and delicious cuisine that reflects the diverse influences of the surrounding countries.",
      "verified": true,
      "name": "Fluffy",
      "replies": "2",
      "likes": "120",
      "ago": "2h",
    },
    {
      "landscape": [],
      "profile": "assets/images/clone_images/profile2.jpg",
      "content":
          "The Sahara Desert is the largest hot desert in the world, spanning approximately 9.2 million square kilometers across North Africa. It is a landscape of extreme conditions, with scorching daytime temperatures, frigid nights, and vast stretches of sand dunes that seem to go on forever. Despite its harsh environment, the Sahara is home to a surprising array of life, including resilient plants and animals adapted to the desert climate. For adventurers, a journey through the Sahara offers the chance to experience the awe-inspiring beauty of the dunes, witness stunning sunsets, and learn about the ancient cultures and traditions of the nomadic tribes who call this desert home.",
      "verified": false,
      "name": "Whiskers",
      "replies": "8",
      "likes": "90",
      "ago": "1d",
    },
    {
      "landscape": [
        "assets/images/clone_images/3.jpg",
        "assets/images/clone_images/6.jpg",
        "assets/images/clone_images/3.jpg",
        "assets/images/clone_images/4.jpg",
        "assets/images/clone_images/6.jpg",
        "assets/images/clone_images/3.jpg",
        "assets/images/clone_images/4.jpg",
      ],
      "profile": "assets/images/clone_images/profile3.jpg",
      "content":
          "Watching the sunset in Santorini is a magical experience, with the sky painted in hues of orange, pink, and purple as the sun dips below the horizon.",
      "verified": true,
      "name": "Shadow",
      "replies": "12",
      "likes": "105",
      "ago": "15m",
    },
    {
      "landscape": [
        "assets/images/clone_images/4.jpg",
      ],
      "profile": "assets/images/clone_images/profile4.jpg",
      "content":
          "Parisian cafes are the perfect spot to relax, enjoy a croissant, and watch the world go by.",
      "verified": false,
      "name": "Mittens",
      "replies": "6",
      "likes": "80",
      "ago": "5h",
    },
    {
      "landscape": [],
      "profile": "assets/images/clone_images/profile5.jpg",
      "content":
          "Embark on a safari in Kenya and witness the majestic wildlife in their natural habitat, from lions and elephants to giraffes and zebras.",
      "verified": true,
      "name": "Tiger",
      "replies": "10",
      "likes": "95",
      "ago": "3h",
    },
    {
      "landscape": ["assets/images/clone_images/6.jpg"],
      "profile": "assets/images/clone_images/profile6.jpg",
      "content":
          "The Inca Trail to Machu Picchu offers a challenging yet rewarding trek through stunning Andean landscapes and ancient ruins.",
      "verified": false,
      "name": "Simba",
      "replies": "7",
      "likes": "85",
      "ago": "30m",
    },
    {
      "landscape": ["assets/images/clone_images/7.jpg"],
      "profile": "assets/images/clone_images/profile7.jpg",
      "content":
          "Bali's beaches, temples, and lush landscapes make it a tropical paradise for travelers seeking relaxation and adventure.",
      "verified": true,
      "name": "Luna",
      "replies": "14",
      "likes": "110",
      "ago": "1d",
    },
    {
      "landscape": ["assets/images/clone_images/8.jpg"],
      "profile": "assets/images/clone_images/profile8.jpg",
      "content": "Meow meow mewww!",
      "verified": false,
      "name": "Bella",
      "replies": "9",
      "likes": "100",
      "ago": "45m",
    }
  ];

  static const List<String> BubbleProfiles = [
    "assets/images/clone_images/profile0.jpg",
    "assets/images/clone_images/profile1.jpg",
    "assets/images/clone_images/profile2.jpg",
    "assets/images/clone_images/profile3.jpg",
    "assets/images/clone_images/profile4.jpg",
    "assets/images/clone_images/profile5.jpg",
    "assets/images/clone_images/profile6.jpg",
    "assets/images/clone_images/profile7.jpg",
    "assets/images/clone_images/profile8.jpg",
    "assets/images/clone_images/profile9.jpg",
    "assets/images/clone_images/profile10.jpg",
    "assets/images/clone_images/profile11.jpg",
    "assets/images/clone_images/profile12.jpg",
    "assets/images/clone_images/profile14.jpg",
    "assets/images/clone_images/profile15.jpg",
    "assets/images/clone_images/profil13.jpg",
  ];

  static const String verifiedSVGPath = "assets/svgs/verified.svg";
  static const String threadsLogoPath = "assets/svgs/threads_logo.svg";

  static const List<String> reportOptions = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "False information",
    "Harassment or bullying",
    "Violence or dangerous organizations",
  ];
}
