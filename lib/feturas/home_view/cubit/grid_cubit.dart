import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase/feturas/home_view/models/movies_model.dart';
import 'package:firebase/feturas/home_view/models/movies_repo.dart';

part 'grid_state.dart';

class GridCubit extends Cubit<GridState> {
  final MoviesRepo _moviesRepo = MoviesRepo();

  StreamSubscription? _moviesSube;
  StreamSubscription? _seriesSube;

  List<MoviesModel> movies = [];
  List<MoviesModel> series = [];
  GridCubit() : super(GridInitial());

  void getMovie() {
    emit(GridLoading());

    _moviesSube = _moviesRepo.getMoviesStream().listen(
      (moviesData) {
        print("Movies received: $moviesData");
        movies = moviesData;
        _emitIfReady();
      },
      onError: (e) {
        emit(GridFailure("Failed to load movies: $e"));
      },
    );

    _seriesSube = _moviesRepo.getSeriesStream().listen(
      (seriesData) {
        print("Series received: $seriesData");
        series = seriesData;
        _emitIfReady();
      },
      onError: (e) {
        emit(GridFailure("Failed to load series: $e"));
      },
    );
  }

  void _emitIfReady() {
    emit(Gridalldata(movies: movies, series: series));
  }

  @override
  Future<void> close() {
    _moviesSube?.cancel();
    _seriesSube?.cancel();

    return super.close();
  }
}
