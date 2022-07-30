import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/gen/colors.gen.dart';
import 'package:places/ui/res/constants/strings.dart';
import 'package:places/ui/res/constants/typography.dart';

class SightDetails extends StatelessWidget {
  final Sight item;

  const SightDetails({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 360.0,
            backgroundColor: ColorName.main,
            elevation: 0,
            leading: UnconstrainedBox(
              child: Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorName.white,
                ),
                child: const FittedBox(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorName.main,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorName.background,
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
                    child: DecoratedBox(
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
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: AppTypography.title.copyWith(
                          color: ColorName.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 24),
                        child: Row(
                          children: [
                            Text(
                              item.type,
                              style: AppTypography.smallBold.copyWith(
                                color: ColorName.secondary,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              SightDetailsStrings.workingHours,
                              style: AppTypography.small.copyWith(
                                color: ColorName.secondary2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item.details,
                        style: AppTypography.small.copyWith(
                          color: ColorName.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 48),
                            primary: ColorName.white,
                            backgroundColor: ColorName.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            textStyle: AppTypography.smallBold,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.roundabout_right,
                            size: 24.0,
                          ),
                          label: Text(SightDetailsStrings.buildRouteButton
                              .toUpperCase()),
                        ),
                      ),
                      Divider(
                        color: ColorName.inactive.withOpacity(0.24),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary: ColorName.inactive,
                                fixedSize: const Size.fromHeight(40),
                                textStyle: AppTypography.small,
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                size: 24.0,
                              ),
                              label: const Text(
                                SightDetailsStrings.scheduleButton,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary: ColorName.secondary,
                                fixedSize: const Size.fromHeight(40),
                                textStyle: AppTypography.small,
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                size: 24.0,
                              ),
                              label:
                                  const Text(SightDetailsStrings.toFavorites),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
