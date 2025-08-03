import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              'assets/images/Logo.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
        const Text(
          'Welcome to Bookly',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Read Any books you Want',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const CircularProgressIndicator(),
      ],
    );
  }
}
