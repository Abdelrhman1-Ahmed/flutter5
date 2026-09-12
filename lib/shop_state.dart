import 'package:flutter/material.dart';
import 'models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}

class ShopState extends ChangeNotifier {
  static final ShopState _instance = ShopState._internal();
  factory ShopState() => _instance;

  ShopState._internal() {
    _initDefaultState();
  }

  final List<CartItem> _cartItems = [];
  final Set<String> _favoriteProductIds = {};

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
  Set<String> get favoriteProductIds => Set.unmodifiable(_favoriteProductIds);

  int get totalCartCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  bool isFavorite(String productId) => _favoriteProductIds.contains(productId);

  void _initDefaultState() {
    // Populate default cart items to reflect Figma design
    final p3 = SampleProducts.allProducts.firstWhere((p) => p.id == 'p3'); // Bell Pepper
    final p13 = SampleProducts.allProducts.firstWhere((p) => p.id == 'p13'); // Egg Chicken Red
    final p1 = SampleProducts.allProducts.firstWhere((p) => p.id == 'p1'); // Organic Bananas
    final p4 = SampleProducts.allProducts.firstWhere((p) => p.id == 'p4'); // Ginger

    _cartItems.addAll([
      CartItem(product: p3, quantity: 1),
      CartItem(product: p13, quantity: 1),
      CartItem(product: p1, quantity: 1),
      CartItem(product: p4, quantity: 1),
    ]);

    // Populate default favorites
    _favoriteProductIds.addAll(['p8', 'p7', 'p9', 'p11', 'p12']);
  }

  void addToCart(Product product, {int quantity = 1}) {
    final index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
  }

  void addAllFavoritesToCart() {
    for (final productId in _favoriteProductIds) {
      final match = SampleProducts.allProducts.where((p) => p.id == productId);
      if (match.isNotEmpty) {
        addToCart(match.first);
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
