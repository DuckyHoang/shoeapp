import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopshoe/firebase_service.dart';

class Category {
  Category({this.catName, this.image});
  Category.fromJson(Map<String, Object?> json)
      : this(
          catName: json['catName']! as String,
          image: json['image']! as String,
        );

  final String? catName;
  final String? image;

  Map<String, Object?> toJson() {
    return {
      'title': catName,
      'genre': image,
    };
  }
}

FirebaseService _service = FirebaseService();
final categoryCollection =
    _service.categories.where('active', isEqualTo: true).withConverter<Category>(
          fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
          toFirestore: (Category, _) => Category.toJson(),
        );
