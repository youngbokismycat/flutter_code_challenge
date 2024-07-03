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
