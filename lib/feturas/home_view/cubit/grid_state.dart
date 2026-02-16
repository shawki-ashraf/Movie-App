part of 'grid_cubit.dart';

sealed class GridState {}

final class GridInitial extends GridState {}

final class GridLoading extends GridState {}

final class Gridalldata extends GridState {
  final List<MoviesModel> movies;
  final List<MoviesModel> series;
  late final List<MoviesModel> alldata;

  Gridalldata({required this.movies, required this.series}) {
    alldata = [...movies, ...series]; // هنا جمعهم صح
  }
}

final class GridFailure extends GridState {
  final String error;

  GridFailure(this.error);
}
