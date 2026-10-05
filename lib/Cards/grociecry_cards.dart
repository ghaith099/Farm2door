import 'package:farm2door/models/Categoreis/categoris_list.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class CatageroesCard extends StatelessWidget {
  const CatageroesCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, color: category.iconColor, size: 20),
            const SizedBox(height: 4),
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
