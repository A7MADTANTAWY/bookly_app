import 'package:bokly_app/core/utils/assets.dart';
import 'package:bokly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(
        () => const Home(),
        transition: Transition.leftToRight,
        duration: Duration(milliseconds: 400),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset(AssetsData.logo, width: 230, height: 200),
          ),
        ),
        const Text(
          'Welcome to Bookly',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Read Free Books',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 120),
      ],
    );
  }
}
