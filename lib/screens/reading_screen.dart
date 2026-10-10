import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/item_model.dart';

class ReadingScreen extends StatefulWidget {
  final ItemModel item;
  const ReadingScreen({super.key, required this.item});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double _fontSize = 20.0; // حجم الخط الافتراضي

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
        actions: [
          // زران لتكبير وتصغير الخط أثناء القراءة
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: () {
              setState(() {
                if (_fontSize < 36) _fontSize += 2;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: () {
              setState(() {
                if (_fontSize > 14) _fontSize -= 2;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : AppColors.lightCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.goldPrimary.withOpacity(0.3)),
          ),
          child: Text(
            widget.item.content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _fontSize,
              height: 2.0, // مسافة بين الأسطر لراحة العين
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ),
      ),
    );
  }
}
