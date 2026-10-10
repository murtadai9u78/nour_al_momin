import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/quran_data.dart';
import 'surah_detail_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: QuranData.surahs.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final surah = QuranData.surahs[index];
          return Card(
            color: isDark ? AppColors.darkCard : AppColors.lightCard,
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                  color: AppColors.goldPrimary.withOpacity(0.3), width: 1),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.goldPrimary,
                child: Text(
                  '${surah.number}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                surah.nameArabic,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.goldPrimary),
              ),
              subtitle: Text(
                '${surah.revelationType} • ${surah.versesCount} آيات',
                style:
                    TextStyle(color: isDark ? Colors.white70 : Colors.black54),
              ),
              trailing: Text(
                surah.nameEnglish,
                style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.black45,
                    fontStyle: FontStyle.italic),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahDetailScreen(surah: surah),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
