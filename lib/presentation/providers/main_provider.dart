import 'package:flutter/cupertino.dart';
import 'package:module_b/data/models/genre.model.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/profileModel.dart';
import '../../data/repositories/movie_repository.dart';

final MainProvider mainProvider = MainProvider();

class MainProvider extends ChangeNotifier {

  final MovieRepository movieRepository = MovieRepository();


  final PageController pageController = PageController();

  late ProfileModel selectedProfile;

  List<GenreModel> genreList = [];

  List<MovieModel> topRatedMovieList = [];

  List<MovieModel> nowPlayingMovieList = [];

  List<MovieModel> recentOpenMovieList = [];

  List<MovieModel> commingSoonMovieList = [];

  void setSelectedProfile(ProfileModel profile) {
    selectedProfile = profile;
    notifyListeners();
  }

  void loadGenreList() async{
    genreList = await movieRepository.getAllGenres();
    notifyListeners();
  }

  void loadTopRatedMovieList() async {
    topRatedMovieList = await movieRepository.getTopRatedMovies();
    notifyListeners();
  }

  void loadNowPlayingMovieList() async {
    nowPlayingMovieList = await movieRepository.getNowPlayingMovies();
    notifyListeners();
  }

  void loadRecentOpenMovieList() async {
    recentOpenMovieList = await movieRepository.getRecentOpenMovies();
    notifyListeners();
  }

  void loadCommingSoonMovieList() async {
    commingSoonMovieList = await movieRepository.getUpCommingMovies();
    notifyListeners();
  }


}
