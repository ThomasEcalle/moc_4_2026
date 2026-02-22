import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static Future<void> navigateTo(BuildContext context) {
    return Navigator.of(context).pushNamed('/cartScreen');
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 80,
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 24),
              Text(
                'Your cart is empty',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add products to your cart to see them here.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
