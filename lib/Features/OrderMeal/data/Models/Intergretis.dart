import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final String name;
  final String category;
  final num calories;
  final num price;
  final String imageUrl;

  Ingredient({
    required this.name,
    required this.category,
    required this.calories,
    required this.price,
    required this.imageUrl,
  });

  factory Ingredient.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Ingredient(
      name: data['name'],
      category: data['category'],
      calories: data['calories'],
      price: data['price'],
      imageUrl: data['image_url'],
    );
  }

}
