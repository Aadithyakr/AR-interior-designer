import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_s6/services/cart/cart_provider.dart';
import 'package:pro_s6/services/product/product.dart';

class CartService implements CartProvider {
  CartService._sharedInstance();
  static final CartService _shared = CartService._sharedInstance();
  factory CartService() => _shared;

  final products = FirebaseFirestore.instance.collection('carts');

  @override
  Future<void> addToCart({required Product product}) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  // TODO: implement cartItems
  Future<Iterable<Product>> get cartItems => throw UnimplementedError();

  @override
  Future<void> checkOut({Product? product}) {
    // TODO: implement checkOut
    throw UnimplementedError();
  }

  @override
  Future<void> createProduct() {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<void> emptyCart() {
    // TODO: implement emptyCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart({required Product product}) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
