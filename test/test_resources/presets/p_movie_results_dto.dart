import 'package:built_collection/built_collection.dart';
import 'package:disfilm/dtos/movie_dto.dart';
import 'package:disfilm/dtos/movie_results_dto.dart';

import 'p_movie_dto.dart';

class PMovieResultsDto {
  PMovieResultsDto._();

  static MovieResultsDto topRatedChristmasFilmsPageOne() {
    return MovieResultsDto(
      (b) => b
        ..page = 1
        ..totalResults = 109
        ..totalPages = 6
        ..results = ListBuilder<MovieDto>(<MovieDto>[
          PMovieDto.klaus(),
          PMovieDto.itsAWonderfulLife(),
          PMovieDto.theShopAroundTheCorner(),
          PMovieDto.tokyoGodfather(),
          PMovieDto.fannyAndAlexander(),
          PMovieDto.theNightmareBeforeChristmas(),
          PMovieDto.stalag17(),
          PMovieDto.dieHard(),
          PMovieDto.aCharlieBrownChristmas(),
          PMovieDto.mickeysChristmasCarol(),
          PMovieDto.santaClausIsAStinker(),
          PMovieDto.inBruges(),
          PMovieDto.howTheGrinchStoleChristmas(),
          PMovieDto.miracleOn34thStreet(),
          PMovieDto.aChristmasStory(),
          PMovieDto.whiteChristmas(),
          PMovieDto.joyeuxNoel(),
          PMovieDto.theMuppetChristmasCarol(),
          PMovieDto.rudolphTheRedNosedReindeer(),
          PMovieDto.riseOfTheGuardian(),
        ]),
    );
  }
}
