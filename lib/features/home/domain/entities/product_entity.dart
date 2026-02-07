import 'dart:io';

class ProductEntity {
  final String name;
  final double price;
  final String image;
  final String categoryName;
  final String id;
  final bool? isFavourite;
  final DateTime? createdAt;
  final File? imageFile;
  const ProductEntity({
    required this.name,
    required this.price,
    required this.image,
    this.imageFile,
    required this.categoryName,
    required this.id,
    this.isFavourite,
    this.createdAt,
  });
  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      categoryName: map['category_name'] as String,
      isFavourite: map['is_favourite'] as bool? ?? false,
      image: map['image'] as String,
      price: (map['price'] as num).toDouble(),
      createdAt: DateTime.parse(map['created_at'] as String),
      imageFile: map['image_file'] as File?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category_name': categoryName, // مطابق للعمود في جدول Supabase
      'is_favourite': isFavourite ?? false,
      'image': image,
      'price': price,
      'created_at':
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }

  ProductEntity copyWith({
    String? name,
    double? price,
    String? image,
    String? categoryName,
    String? id,
    bool? isFavourite,
    DateTime? createdAt,
    File? imageFile,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
      isFavourite: isFavourite ?? this.isFavourite,
      createdAt: createdAt ?? this.createdAt,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}
