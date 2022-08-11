import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/gen/colors.gen.dart';
import 'package:places/ui/res/constants/typography.dart';

class SightCard extends StatelessWidget {
  static const double thumbHeight = 96.0;
  final Sight item;

  const SightCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.0 / 2.0,
      child: ClipRRect(
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
                      style: AppTypography.smallBold.copyWith(
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
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppTypography.text.copyWith(
                        color: ColorName.secondary,
                      ),
                    ),
                    Text(
                      item.details,
                      style: AppTypography.small.copyWith(
                        color: ColorName.secondary2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
