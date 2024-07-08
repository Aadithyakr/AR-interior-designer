import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pro_s6/services/cart/cart_service.dart';

class CartProvider with ChangeNotifier {
  final CartService _cartService = CartService();

  List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  Future<void> fetchCartItems(String userId) async {
    _cartItems = await _cartService.cartItems(userId: userId).then(
          (value) => value.toList(),
        );
    notifyListeners();
  }

  Future<void> addProductToCart(String userId, Product product) async {
    await _cartService.addToCart(userId: userId, product: product);
    notifyListeners();
  }

  Future<void> removeProductFromCart(String userId, Product product) async {
    await _cartService.removeFromCart(userId: userId, product: product);
    notifyListeners();
  }
}

class CartScreen extends StatelessWidget {
  final String userId;

  const CartScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Favourites 🩷',
            textAlign: TextAlign.center,
          ),
        ),
        body: CartItemsList(userId: userId),
      ),
    );
  }
}

class CartItemsList extends StatefulWidget {
  final String userId;

  const CartItemsList({super.key, required this.userId});

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false)
        .fetchCartItems(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        if (cartProvider.cartItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: cartProvider.cartItems.length,
          itemBuilder: (context, index) {
            final product = cartProvider.cartItems[index];
            return ListTile(
              leading: Image.asset(
                product.image,
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
            );
          },
        );
      },
    );
  }
}
