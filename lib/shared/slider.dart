import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AutoStoreSlider extends StatelessWidget {
  const AutoStoreSlider({super.key});

  static const List<String> _sliderImages = [
    'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1200&q=80',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=1200&q=80',
    'https://images.unsplash.com/photo-1464226184884-fa520f1f4b5a?auto=format&fit=crop&w=1200&q=80',
    'https://cdn.prod.website-files.com/6918684e0925371587957f1e/6946e478a70bf0d7e9a35ac0_668be337cdfc6426bffca741_20%2520-%2520Importance%2520of%2520%25CE%25BFffers%252C%2520bundle%2520offers%2520Hero.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        aspectRatio: 16 / 9,
      ),
      items: _sliderImages.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (imageUrl.startsWith('assets/'))
                      Image.asset(imageUrl, fit: BoxFit.cover)
                    else
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const ColoredBox(
                            color: Color(0xFFE8F5E9),
                            child: Center(
                              child: Icon(Icons.image_not_supported_outlined),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
