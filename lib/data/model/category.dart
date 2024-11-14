class Category {
  final String collectionId;
  final String collectionName;
  final String created;
  final String id;
  final String image;
  final String name;
  final String updated;

  // سازنده برای ایجاد شی از داده‌های JSON
  Category({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.image,
    required this.name,
    required this.updated,
  });

  // متد برای تبدیل داده‌های JSON به شی Category
  factory Category.fromJson(Map<String, dynamic> jsonObject) {
    return Category(
      collectionId: jsonObject['collectionId'],
      collectionName: jsonObject['collectionName'],
      created: jsonObject['created'],
      id: jsonObject['id'],
      image: 'https://pocketbase-5i4fn3.chbk.app/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      name: jsonObject['name'],
      updated: jsonObject['updated'],
    );
  }
}
