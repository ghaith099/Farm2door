import 'package:farm2door/Screens/payment.dart';
import 'package:farm2door/models/shopping_cart.dart';
import 'package:farm2door/shared/animated_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: AnimatedBuilder(
        animation: ShoppingCart.instance,
        builder: (context, _) {
          final entries = ShoppingCart.instance.entries;
          if (entries.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final entry in entries.indexed) ...[
                AnimatedEntrance(
                  key: ValueKey(entry.$2.item.title),
                  delay: Duration(milliseconds: entry.$1 * 70),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F7EE),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: entry.$2.item.imageAsset != null
                                ? Image.asset(
                                    entry.$2.item.imageAsset!,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            SvgPicture.asset(
                                      entry.$2.item.svgAsset,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : SvgPicture.asset(
                                    entry.$2.item.svgAsset,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.$2.item.title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text('\$${entry.$2.item.price} /Kg'),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                ShoppingCart.instance.changeQuantity(
                              entry.$2.item,
                              entry.$2.quantity - 1,
                            ),
                            tooltip: 'Remove one ${entry.$2.item.title}',
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text(
                            '${entry.$2.quantity}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          IconButton(
                            onPressed: () =>
                                ShoppingCart.instance.changeQuantity(
                              entry.$2.item,
                              entry.$2.quantity + 1,
                            ),
                            tooltip: 'Add one ${entry.$2.item.title}',
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                        child: Text(
                          '\$${ShoppingCart.instance.total.toStringAsFixed(2)}',
                          key: ValueKey(ShoppingCart.instance.total),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          total: ShoppingCart.instance.total,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.lock_outline),
                  label: const Text('Proceed to Payment'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
