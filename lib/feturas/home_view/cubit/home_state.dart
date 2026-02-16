part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<MoviesModel> movies;
  final List<MoviesModel> series;

  HomeSuccess({required this.movies, required this.series});
}

final class Homealldata extends HomeState {
  final List<MoviesModel> movies;
  final List<MoviesModel> series;
  late final List<MoviesModel> alldata;

  Homealldata({required this.movies, required this.series}) {
    alldata = [...movies, ...series]; // هنا جمعهم صح
  }
}

final class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);
}
