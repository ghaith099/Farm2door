import 'package:farm2door/models/item.dart';
import 'package:flutter/foundation.dart';

class CartEntry {
  const CartEntry({required this.item, required this.quantity});

  final Item item;
  final int quantity;
}

class ShoppingCart extends ChangeNotifier {
  ShoppingCart._();

  static final ShoppingCart instance = ShoppingCart._();

  final Map<String, CartEntry> _entries = {};

  List<CartEntry> get entries => List.unmodifiable(_entries.values);

  double get total => _entries.values.fold(
        0,
        (sum, entry) => sum + double.parse(entry.item.price) * entry.quantity,
      );

  void add(Item item, int quantity) {
    if (quantity <= 0) return;

    final currentQuantity = _entries[item.title]?.quantity ?? 0;
    _entries[item.title] = CartEntry(
      item: item,
      quantity: currentQuantity + quantity,
    );
    notifyListeners();
  }

  void changeQuantity(Item item, int quantity) {
    if (quantity <= 0) {
      _entries.remove(item.title);
    } else {
      _entries[item.title] = CartEntry(item: item, quantity: quantity);
    }
    notifyListeners();
  }
}
