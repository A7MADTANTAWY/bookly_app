import 'package:bokly_app/features/home/presentaion/views/widgets/horezontal_card.dart';
import 'package:flutter/material.dart';

class CustomHorListView extends StatelessWidget {
  const CustomHorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: HorezontalCard(),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: 10,
    );
  }
}
