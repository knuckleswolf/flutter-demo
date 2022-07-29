import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/gen/colors.gen.dart';

class SightCard extends StatelessWidget {
  static const double thumbHeight = 96.0;
  final Sight item;

  const SightCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ColoredBox(
        color: ColorName.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: thumbHeight,
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        item.url,
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: thumbHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorName.main,
                          ColorName.secondary.withOpacity(0.08),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    item.type,
                    style: const TextStyle(
                      height: 1.28,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorName.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: ColorName.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorName.secondary,
                    ),
                  ),
                  Text(
                    item.details,
                    style: const TextStyle(
                      height: 1.28,
                      fontSize: 14,
                      color: ColorName.secondary2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
