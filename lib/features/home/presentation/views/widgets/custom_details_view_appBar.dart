import 'package:bokly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomDetailsViewAppbar extends StatelessWidget {
  const CustomDetailsViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      scrolledUnderElevation: 0,
      title: IconButton(
        icon: const Icon(Icons.close, size: 35),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      pinned: true,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, size: 35),
          onPressed: () {},
        ),
      ],
    );
  }
}
