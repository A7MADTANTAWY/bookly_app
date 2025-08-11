import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomVerListView extends StatelessWidget {
  const CustomVerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Skeletonizer(enabled: false, child: VerticalCard()),
        childCount: 10,
      ),
    );
  }
}
