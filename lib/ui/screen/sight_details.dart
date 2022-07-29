import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/gen/colors.gen.dart';

class SightDetails extends StatelessWidget {
  static const expandedHeight = 360.0;
  final Sight item;

  bool get _pinned => true;
  bool get _snap => false;
  bool get _floating => false;

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
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            stretch: true,
            expandedHeight: expandedHeight,
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
                        style: const TextStyle(
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: ColorName.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 24),
                        child: Row(
                          children: [
                            Text(
                              item.type,
                              style: const TextStyle(
                                height: 1.28,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorName.secondary,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'закрыто до 09:00',
                              style: TextStyle(
                                height: 1.28,
                                fontSize: 14,
                                color: ColorName.secondary2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item.details,
                        style: const TextStyle(
                          height: 1.28,
                          fontSize: 14,
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
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.roundabout_right,
                            size: 24.0,
                          ),
                          label: Text('Построить маршрут'.toUpperCase()),
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
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                size: 24.0,
                              ),
                              label: const Text('Запланировать'),
                            ),
                          ),
                          Expanded(
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary: ColorName.secondary,
                                fixedSize: const Size.fromHeight(40),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                size: 24.0,
                              ),
                              label: const Text('В Избранное'),
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
