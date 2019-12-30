import 'package:built_collection/built_collection.dart';
import 'package:disfilm/models/movie.dart';
import 'package:disfilm/models/movie_results.dart';

import 'p_movie.dart';

class PMovieResults {
  PMovieResults._();

  static MovieResults topRatedChristmasFilmsPageOne() {
    return MovieResults(
      (b) => b
        ..page = 1
        ..totalResults = 109
        ..totalPages = 6
        ..results = ListBuilder<Movie>(<Movie>[
          PMovie.klaus(),
          PMovie.itsAWonderfulLife(),
          PMovie.theShopAroundTheCorner(),
          PMovie.tokyoGodfather(),
          PMovie.fannyAndAlexander(),
          PMovie.theNightmareBeforeChristmas(),
          PMovie.stalag17(),
          PMovie.dieHard(),
          PMovie.aCharlieBrownChristmas(),
          PMovie.mickeysChristmasCarol(),
          PMovie.santaClausIsAStinker(),
          PMovie.inBruges(),
          PMovie.howTheGrinchStoleChristmas(),
          PMovie.miracleOn34thStreet(),
          PMovie.aChristmasStory(),
          PMovie.whiteChristmas(),
          PMovie.joyeuxNoel(),
          PMovie.theMuppetChristmasCarol(),
          PMovie.rudolphTheRedNosedReindeer(),
          PMovie.riseOfTheGuardian(),
        ]),
    );
  }

  static BuiltList<MovieResults> tenFilmsThreePagesFourPerPage() {
    final MovieResults pageOne = MovieResults(
      (b) => b
        ..page = 1
        ..totalResults = 10
        ..totalPages = 3
        ..results = ListBuilder<Movie>(<Movie>[
          PMovie.klaus(),
          PMovie.itsAWonderfulLife(),
          PMovie.theShopAroundTheCorner(),
          PMovie.tokyoGodfather(),
        ]),
    );

    final MovieResults pageTwo = MovieResults(
      (b) => b
        ..page = 2
        ..totalResults = 10
        ..totalPages = 3
        ..results = ListBuilder<Movie>(<Movie>[
          PMovie.fannyAndAlexander(),
          PMovie.theNightmareBeforeChristmas(),
          PMovie.stalag17(),
          PMovie.dieHard(),
        ]),
    );

    final MovieResults pageThree = MovieResults(
      (b) => b
        ..page = 3
        ..totalResults = 10
        ..totalPages = 3
        ..results = ListBuilder<Movie>(<Movie>[
          PMovie.aCharlieBrownChristmas(),
          PMovie.mickeysChristmasCarol(),
        ]),
    );

    return BuiltList<MovieResults>(
      <MovieResults>[pageOne, pageTwo, pageThree],
    );
  }
}
