import 'package:farm2door/Screens/product.dart';
import 'package:farm2door/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({super.key, required this.item});
  final Item item;

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product(item: widget.item),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                child: Center(
                  child: widget.item.imageAsset != null
                      ? Image.asset(
                          widget.item.imageAsset!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              SvgPicture.asset(
                            widget.item.svgAsset,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        )
                      : SvgPicture.asset(
                          widget.item.svgAsset,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed:
                    quantity > 0 ? () => setState(() => quantity--) : null,
                tooltip: 'Remove one ${widget.item.title}',
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(
                '$quantity',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () => setState(() => quantity++),
                tooltip: 'Add one ${widget.item.title}',
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
