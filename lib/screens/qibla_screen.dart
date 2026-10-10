import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;
import '../constants/app_colors.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? heading = 0;

  @override
  void initState() {
    super.initState();
    // الاستماع لحركة بوصلة الهاتف الحقيقية
    FlutterCompass.events?.listen((CompassEvent event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // إذا لم تكن البوصلة مدعومة أو القراءة فارغة
    if (heading == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('اتجاه القبلة')),
        body: const Center(
          child: Text(
            'حساس البوصلة غير متوفر في هذا الجهاز',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    // اتجاه الكعبة تقريبياً (مثلاً من العراق/المنطقة حوالي 155 درجة كمثال، أو يتم حسابه بدقة عبر الموقع الجغرافي)
    // هنا نجعل سهم البوصلة يشير بسلاسة بناءً على دوران الهاتف
    double direction = heading ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('اتجاه القبلة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'وجه هاتفك ببطء حتى يستقيم السهم نحو القبلة المشرفة',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 50),

            // دائرة البوصلة الذهبية الفاخرة
            Center(
              child: SizedBox(
                width: 280,
                height: 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // إطار البوصلة الخارجي
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isDark ? AppColors.darkCard : AppColors.lightCard,
                        border:
                            Border.all(color: AppColors.goldPrimary, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.goldPrimary.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    // أيقونة الكعبة أو مؤشر الاتجاه المتحرك
                    Transform.rotate(
                      angle: (direction * (math.pi / 180) * -1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.navigation,
                            size: 80,
                            color: AppColors.goldPrimary,
                          ),
                          const SizedBox(height: 140),
                        ],
                      ),
                    ),
                    // مركز البوصلة الثابت
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.goldPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),

            // عرض زاوية الاتجاه الرقمية
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.lightCard,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: AppColors.goldPrimary.withOpacity(0.5)),
              ),
              child: Text(
                'الزاوية الحالية: ${direction.toStringAsFixed(0)}°',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
