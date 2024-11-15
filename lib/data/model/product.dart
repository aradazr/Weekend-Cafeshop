import 'package:intl/intl.dart';

class Product {
  String? id;
  String? name;
  String? categoryId;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? image; // فقط نام فایل
  String? information;
  int? price;
  bool? isAvailable;

  // سازنده برای ایجاد شی از داده‌های JSON
  Product({
    this.id,
    this.name,
    this.categoryId,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.image,
    this.information,
    this.price,
    this.isAvailable,
  });

  // متد برای تبدیل داده‌های JSON به شی Category
  factory Product.fromJson(Map<String, dynamic> jsonObject) {
    return Product(
      id: jsonObject['id'],
      name: jsonObject['name'],
      categoryId: jsonObject['category'],
      collectionId: jsonObject['collectionId'],
      collectionName: jsonObject['collectionName'],
      created: jsonObject['created'],
      updated: jsonObject['updated'],
      image: 'https://pocketbase-5i4fn3.chbk.app/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      information: jsonObject['information'],
      price: jsonObject['price'],
      isAvailable: jsonObject['isAvailable'],
    );
  }

  // متد برای فرمت کردن قیمت با کاما
  String getFormattedPrice() {
    if (price != null) {
      final formatter = NumberFormat('#,###');
      return formatter.format(price);
    }
    return '0';
  }
}
