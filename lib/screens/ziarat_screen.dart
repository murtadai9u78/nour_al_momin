import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/item_model.dart';

class ZiaratScreen extends StatefulWidget {
  final ItemModel item;

  const ZiaratScreen({super.key, required this.item});

  @override
  State<ZiaratScreen> createState() => _ZiaratScreenState();
}

class _ZiaratScreenState extends State<ZiaratScreen> {
  String _fileContent = "جاري تحميل المحتوى...";

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    try {
      String content = await rootBundle.loadString(widget.item.content);
      setState(() {
        _fileContent = content;
      });
    } catch (e) {
      setState(() {
        _fileContent = "عذراً، حدث خطأ في تحميل الملف.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            _fileContent,
            style: const TextStyle(
              fontSize: 20,
              height: 1.8,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
