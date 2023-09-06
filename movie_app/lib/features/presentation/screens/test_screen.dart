import 'package:flutter/material.dart';
import 'package:movie_app/features/presentation/screens/movies_screen/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MoviesScreen(),
                  ),
                );
              },
              child: const Text("Navigator"))),
    );
  }
}
