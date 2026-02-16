import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase/feturas/home_view/models/movies_model.dart';
import 'package:firebase/feturas/home_view/models/movies_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MoviesRepo _moviesRepo = MoviesRepo();

  StreamSubscription? _moviesSub;
  StreamSubscription? _seriesSub;

  List<MoviesModel> movies = [];
  List<MoviesModel> series = [];

  HomeCubit() : super(HomeInitial());

  void getMovies() {
    emit(HomeLoading());

    _moviesSub = _moviesRepo.getMoviesStream().listen(
      (moviesData) {
        print("Movies received: $moviesData");
        movies = moviesData;
        _emitIfReady();
      },
      onError: (e) {
        emit(HomeFailure("Failed to load movies: $e"));
      },
    );

    _seriesSub = _moviesRepo.getSeriesStream().listen(
      (seriesData) {
        print("Series received: $seriesData");
        series = seriesData;
        _emitIfReady();
      },
      onError: (e) {
        emit(HomeFailure("Failed to load series: $e"));
      },
    );
  }

  void _emitIfReady() {
    emit(HomeSuccess(movies: movies, series: series));
  }

  void emitIfReady() {
    emit(Homealldata(movies: movies, series: series));
  }

  @override
  Future<void> close() {
    _moviesSub?.cancel();
    _seriesSub?.cancel();

    return super.close();
  }
}
