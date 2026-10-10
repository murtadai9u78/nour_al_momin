import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _counter = 0;
  String _selectedDhikr = "سبحان الله";

  final List<String> _dhikrList = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "أستغفر الله وأتوب إليه",
    "اللهم صل على محمد وآل محمد",
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('المسبحة الإلكترونية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'تصفير العداد',
            onPressed: _resetCounter,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // قائمة اختيار الذكر
            DropdownButtonFormField<String>(
              value: _selectedDhikr,
              dropdownColor: isDark ? AppColors.darkCard : AppColors.lightCard,
              decoration: InputDecoration(
                labelText: 'اختر الذكر',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.goldPrimary),
                ),
              ),
              items: _dhikrList.map((String dhikr) {
                return DropdownMenuItem<String>(
                  value: dhikr,
                  child: Text(dhikr, style: const TextStyle(fontSize: 18)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDhikr = newValue;
                    _counter = 0; // إعادة التصفير عند تغيير الذكر
                  });
                }
              },
            ),
            const SizedBox(height: 40),

            // عرض الذكر المحدد والعداد
            Text(
              _selectedDhikr,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.goldPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // دائرة العداد الرقمي
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? AppColors.darkCard : AppColors.lightCard,
                border: Border.all(color: AppColors.goldPrimary, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.goldPrimary.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // زر التسبيح الكبيرة
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.goldPrimary,
                ),
                child: const Center(
                  child: Icon(
                    Icons.fingerprint,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'اضغط للتسبيح',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
