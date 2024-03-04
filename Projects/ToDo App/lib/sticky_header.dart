import 'package:demo/app_theme.dart';
import 'package:flutter/material.dart';

class StickyHeader extends StatelessWidget {
  final Color color;
  final String title;

  const StickyHeader({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(color: color, title: title),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color color;
  final String title;

  Delegate({required this.color, required this.title});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Center(
        child: Text(
          title,
          style: AppTheme.copyWith(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
