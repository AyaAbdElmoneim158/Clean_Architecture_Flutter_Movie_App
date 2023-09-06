import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/features/presentation/components/now_playing_movies_component.dart';
import 'package:movie_app/features/presentation/components/popular_movies_component.dart';
import 'package:movie_app/features/presentation/components/top_rate_movies_component.dart';
import 'package:movie_app/features/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie_app/features/presentation/controller/movies_bloc/movies_events.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Build:> MainMoviesScreen ");
    // BaseMovieRemoteDataSource baseMovieRemoteDataSource =
    //     MovieRemoteDataSource();
    // BaseMovieRepository baseMovieRepository =
    //     MoviesRepository(baseMovieRemoteDataSource: baseMovieRemoteDataSource);
    // GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase =
    //     GetNowPlayingMoviesUseCase(baseMovieRepository: baseMovieRepository);

    return BlocProvider(
      create: (context) =>
          // MoviesBloc(getNowPlayingMoviesUseCase: getNowPlayingMoviesUseCase),
          sl<MoviesBloc>()
            // MoviesBloc(getNowPlayingMoviesUseCase: sl())
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRateMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingMoviesComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularMoviesComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRateMoviesComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
