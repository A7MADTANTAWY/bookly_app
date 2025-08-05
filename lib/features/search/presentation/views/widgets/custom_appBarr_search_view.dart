import 'package:bokly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppbarrSearchView extends StatelessWidget {
  const CustomAppbarrSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      scrolledUnderElevation: 0,
      pinned: true,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 28, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Container(
        height: 44,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search For A Book...',
            hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.white70),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24, width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white70, width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          ),
        ),
      ),
    );
  }
}
