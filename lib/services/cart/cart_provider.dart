import 'package:pro_s6/services/product/product.dart';

abstract class CartProvider {
  Future<Iterable<Product>> get cartItems;

  Future<void> addToCart({required Product product});

  Future<void> removeFromCart({required Product product});

  Future<void> emptyCart();

  Future<void> checkOut({Product? product});
}
