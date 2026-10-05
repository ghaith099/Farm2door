import 'package:flutter/material.dart';

enum Category {
  vegetables(
    title: 'Vegetables',
    icon: Icons.eco_outlined,
    iconColor: Colors.green,
  ),
  fruits(
    title: 'Fruits',
    icon: Icons.local_florist_outlined,
    iconColor: Colors.redAccent,
  ),
  greens(
    title: 'Greens',
    icon: Icons.grass,
    iconColor: Colors.lightGreen,
  ),
  mushrooms(
    title: 'Mushrooms',
    icon: Icons.spa_outlined,
    iconColor: Colors.deepOrange,
  ),
  nuts(
    title: 'Nuts',
    icon: Icons.circle_outlined,
    iconColor: Colors.brown,
  ),
  snacks(
    title: 'Snacks',
    icon: Icons.fastfood_outlined,
    iconColor: Colors.orange,
  );

  const Category({
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
}
