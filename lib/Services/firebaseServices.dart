import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';

class FirebaseService {
  static final _db = FirebaseFirestore.instance;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBhUdxhWXCIrLnLJ8lBe0l_-Hae7B8yUQc",
        appId: "1:627133264161:android:12bc5ba789e169920b0e60",
        messagingSenderId: "627133264161",
        projectId: "steven-5bfd2",
      ),
    );
  }

  Future<List<Ingredient>> fetchIngredients() async {
    final snapshot = await _db.collection('integrates').get();
    List<Ingredient> ingredients = [];
    //print('Documents found: ${snapshot.docs.length}');
    for (var doc in snapshot.docs) {
     // print('Documents found: ${snapshot.docs.length}');

      //print('Raw data: ${doc.data()}'); // optional debug
      Ingredient ingredient = Ingredient.fromFirestore(doc);

      ingredients.add(ingredient);
    }

    return ingredients;
  }
}
