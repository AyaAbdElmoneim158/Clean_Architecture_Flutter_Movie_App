import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/features/presentation/screens/movies_screen/movies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  ServicesLocator().init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key}); //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey[900]),
      home: const MoviesScreen(),
    );
  }
}
