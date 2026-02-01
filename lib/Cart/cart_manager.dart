class CartManager {
  static final List<Map<String, dynamic>> _cartItems = [];
  static List<Map<String, dynamic>> order_history = [];

  static List<Map<String, dynamic>> get cartItems => _cartItems;

  static void addToCart(Map<String, dynamic> item, int quantity) {
    // Check if item already exists in the cart
    final index = _cartItems.indexWhere((cartItem) => cartItem["name"] == item["name"]);
    if (index != -1) {
      // Update quantity
      _cartItems[index]["quantity"] += quantity;
    } else {
      // Add new item to the cart
      _cartItems.add({...item, "quantity": quantity});
    }
  }

  static void clearCart() {
    order_history.addAll(cartItems);
    _cartItems.clear();
  }
}


