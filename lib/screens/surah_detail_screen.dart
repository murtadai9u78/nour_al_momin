import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import '../constants/app_colors.dart';
import '../models/surah_model.dart';

class SurahDetailScreen extends StatelessWidget {
  final SurahModel surah;

  const SurahDetailScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nameArabic,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // كارت معلومات السورة
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.goldPrimary, width: 1.5),
              ),
              child: Column(
                children: [
                  Text(
                    'سورة ${surah.nameArabic}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${surah.revelationType} • عدد آياتها: ${surah.versesCount}',
                    style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // عرض البسملة (إلا في سورة التوبة رقم 9)
            if (surah.number != 9) ...[
              const Text(
                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldPrimary,
                ),
              ),
              const SizedBox(height: 20),
            ],

            // عرض جميع آيات السورة
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkCard.withOpacity(0.5)
                    : AppColors.lightCard,
                borderRadius: BorderRadius.circular(12),
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: List.generate(
                    quran.getVerseCount(surah.number),
                    (index) {
                      int verseNumber = index + 1;
                      String verseText =
                          quran.getVerse(surah.number, verseNumber);
                      return TextSpan(
                        text: '$verseText ($verseNumber) ',
                        style: TextStyle(
                          fontSize: 20,
                          height: 2.2,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
