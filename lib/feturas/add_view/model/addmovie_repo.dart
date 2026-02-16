import 'package:firebase/core/movie_firestore/movie_firestore.dart';
import 'package:firebase/feturas/home_view/models/movies_model.dart';

class AddmovieRepo {
  final FirestoreService firestoreService = FirestoreService("movies");
  final FirestoreService firestoreService2 = FirestoreService("series");

  Future<void> addmovie(MoviesModel moviesmodel) async {
    await firestoreService.add(moviesmodel.toJson());
  }

  Future<void> addseries(MoviesModel moviesmodel) async {
    await firestoreService2.add(moviesmodel.toJson());
  }
}
