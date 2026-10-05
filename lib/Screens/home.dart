//import 'dart:html';

// ignore: unused_import
import 'package:farm2door/Cards/grociecry_cards.dart';
import 'package:farm2door/Cards/popular_card.dart';
import 'package:farm2door/models/Categoreis/categoris_list.dart';
import 'package:farm2door/models/item.dart';
import 'package:farm2door/shared/slider.dart';
import 'package:farm2door/shared/textfield.dart';
import 'package:farm2door/shared/animated_entrance.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  static const categories = Category.values;

  int selectedNavigationIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back'),
            Text(
              'User Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'Shopping cart',
            icon: const Icon(Icons.shopping_basket_outlined),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find fresh groceries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              StyledTextField(
                controller: searchController,
                hintText: 'Search products',
                myIcon: const Icon(Icons.search),
              ),
              const SizedBox(height: 20),
              const _SectionTitle(title: 'Special offers'),
              const SizedBox(height: 10),
              const AutoStoreSlider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _SectionTitle(title: 'Categories'),
                  TextButton(onPressed: () {}, child: const Text('View all')),
                ],
              ),
              const SizedBox(height: 4),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.7,
                children: [
                  for (final category in categories)
                    CatageroesCard(category: category),
                ],
              ),
              const SizedBox(height: 20),
              const _SectionTitle(title: 'Popular products'),
              const SizedBox(height: 8),
              ...Item.vegetables.asMap().entries.map(
                    (entry) => AnimatedEntrance(
                      delay: Duration(milliseconds: entry.key * 65),
                      child: PopularCard(item: entry.value),
                    ),
                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavigationIndex,
        onDestinationSelected: (index) {
          setState(() => selectedNavigationIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
