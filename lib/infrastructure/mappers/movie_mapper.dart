import 'package:cinemapedia_flutter_app/domain/entities/movie.dart';
import 'package:cinemapedia_flutter_app/infrastructure/models/moviesdb/movie_details.dart';
import 'package:cinemapedia_flutter_app/infrastructure/models/moviesdb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://www.csaff.org/wp-content/uploads/csaff-no-poster.jpg',
        releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
        adult: movie.adult,
        backdropPath: (movie.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: movie.genres.map((e) => e.name).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: (movie.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            : 'no-poster',
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
