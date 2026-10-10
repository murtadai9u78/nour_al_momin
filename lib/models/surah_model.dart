class SurahModel {
  final int number;
  final String nameArabic;
  final String nameEnglish;
  final String revelationType; // مكية أو مدنية
  final int versesCount;

  SurahModel({
    required this.number,
    required this.nameArabic,
    required this.nameEnglish,
    required this.revelationType,
    required this.versesCount,
  });
}
