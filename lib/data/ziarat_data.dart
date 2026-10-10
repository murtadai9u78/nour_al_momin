import '../models/item_model.dart';

class ZiaratData {
  static final List<ItemModel> list = [
    ItemModel(
      title: "زيارة عاشوراء",
      category: "الزيارات المخصوصة",
      content: "assets/ziarat/ashura.txt",
    ),
    ItemModel(
      title: "دعاء يستشير",
      category: "الأدعية المباركة",
      content: "assets/ziarat/yastashir.txt",
    ),
    ItemModel(
      title: "زيارة الإمام الحسين (عليه السلام)",
      category: "الزيارات المخصوصة",
      content: "assets/ziarat/hussain.txt",
    ),
    ItemModel(
      title: "زيارة أمين الله",
      category: "الزيارات العامة",
      content: "assets/ziarat/aminullah.txt",
    ),
    ItemModel(
      title: "تعقيبات صلاة الظهر",
      category: "تعقيبات الصلوات",
      content: "assets/ziarat/taqib_dhuhr.txt",
    ),
    ItemModel(
      title: "تعقيبات صلاة العشاء",
      category: "تعقيبات الصلوات",
      content: "assets/ziarat/taqib_isha.txt",
    ),
    ItemModel(
      title: "دعاء كميل",
      category: "الأدعية المباركة",
      content: "assets/ziarat/kumayl.txt",
    ),
  ];
}
