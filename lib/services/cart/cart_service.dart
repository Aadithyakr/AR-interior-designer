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
  final String title, description, model3D;
  final List<String> images;
  final double rating, price;
  final bool isFavourite;

  Product(
    this.model3D, {
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    required this.title,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'model3D': model3D,
      'images': images,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['model3D'],
      id: map['id'],
      title: map['title'],
      description: map['description'],
      images: List<String>.from(map['images']),
      rating: map['rating'] ?? 0.0,
      price: map['price'],
      isFavourite: map['isFavourite'] ?? false,
    );
  }
}
