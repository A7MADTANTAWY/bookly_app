import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';

class CustomHorListView extends StatelessWidget {
  const CustomHorListView({super.key, required this.widthOfSizedBbox});

  final double widthOfSizedBbox;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 11, // 10 cards + 1 spacer
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(width: widthOfSizedBbox); // أول عنصر فراغ
        }

        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: HorizontalCard(),
        );
      },
    );
  }
}
