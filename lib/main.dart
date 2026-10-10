import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/ziarat_list_screen.dart';
import 'screens/tasbih_screen.dart';
import 'screens/qibla_screen.dart';
import 'screens/quran_screen.dart';

void main() {
  runApp(const NourAlMominApp());
}

class NourAlMominApp extends StatefulWidget {
  const NourAlMominApp({super.key});

  @override
  State<NourAlMominApp> createState() => _NourAlMominAppState();
}

class _NourAlMominAppState extends State<NourAlMominApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نور المؤمن',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        primaryColor: AppColors.goldPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.goldPrimary,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        primaryColor: AppColors.goldPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkCard,
          foregroundColor: AppColors.goldPrimary,
          centerTitle: true,
        ),
      ),
      themeMode: _themeMode,
      home: HomeScreen(onToggleTheme: _toggleTheme),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('نور المؤمن',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            // 1. القرآن الكريم
            _buildFeatureCard(
              context,
              'القرآن الكريم',
              Icons.menu_book,
              AppColors.goldPrimary,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuranScreen()),
                );
              },
            ),

            // 2. الزيارات والأدعية
            _buildFeatureCard(
              context,
              'الزيارات والأدعية',
              Icons.auto_stories,
              AppColors.goldPrimary,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ZiaratListScreen()),
                );
              },
            ),

            // 3. اتجاه القبلة
            _buildFeatureCard(
              context,
              'اتجاه القبلة',
              Icons.explore,
              AppColors.goldPrimary,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QiblaScreen()),
                );
              },
            ),

            // 4. المسبحة الإلكترونية
            _buildFeatureCard(
              context,
              'المسبحة الإلكترونية',
              Icons.fingerprint,
              AppColors.goldPrimary,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TasbihScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.darkCard
        : AppColors.lightCard;

    return Card(
      color: cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(0.5), width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
