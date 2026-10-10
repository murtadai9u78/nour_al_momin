import 'package:flutter/material.dart';
import '../data/ziarat_data.dart';
import 'ziarat_screen.dart';

class ZiaratListScreen extends StatelessWidget {
  const ZiaratListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الزيارات والأدعية'),
      ),
      body: ListView.builder(
        itemCount: ZiaratData.list.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final item = ZiaratData.list[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.book),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item.category),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZiaratScreen(item: item),
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
