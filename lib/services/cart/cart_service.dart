import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  CartService._sharedInstance();
  static final CartService _shared = CartService._sharedInstance();
  factory CartService() => _shared;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addToCart({
    required String userId,
    required Product product,
  }) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    await userCart.doc(product.id.toString()).set(product.toMap());
  }

  Future<Iterable<Product>> cartItems({required String userId}) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    final querySnapshot = await userCart.get();
    return querySnapshot.docs.map((doc) => Product.fromMap(doc.data()));
  }

  Future<void> checkOut({required String userId, Product? product}) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    if (product != null) {
      await userCart
          .doc(product.id.toString())
          .update({'status': 'checkedOut'});
    } else {
      final querySnapshot = await userCart.get();
      for (var doc in querySnapshot.docs) {
        await userCart.doc(doc.id).update({'status': 'checkedOut'});
      }
    }
  }

  Future<void> createProduct({
    required String userId,
    required Product product,
  }) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    await userCart.doc(product.id.toString()).set(product.toMap());
  }

  Future<void> emptyCart({required String userId}) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    final querySnapshot = await userCart.get();
    for (var doc in querySnapshot.docs) {
      await userCart.doc(doc.id).delete();
    }
  }

  Future<void> removeFromCart({
    required String userId,
    required Product product,
  }) async {
    final userCart = usersCollection.doc(userId).collection('cart');
    await userCart.doc(product.id.toString()).delete();
  }
}

class Product {
  final int id;
  final String name, description;
  final String image;
  final String model;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.model,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': name,
      'description': description,
      'image': image,
      'model': model
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['title'],
        description: map['description'],
        image: map['image'],
        model: map['model']);
  }
}
