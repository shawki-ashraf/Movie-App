import 'package:firebase/core/movie_firestore/movie_firestore.dart';
import 'package:firebase/feturas/home_view/models/movies_model.dart';

class MoviesRepo {
  final FirestoreService _firestoreService = FirestoreService('movies');
  final FirestoreService _firestoreService2 = FirestoreService('series');

  Stream<List<MoviesModel>> getMoviesStream() {
    final res = _firestoreService.getStream();
    return res.map((snapshot) {
      return snapshot.docs.map((doc) {
        return MoviesModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<MoviesModel>> getSeriesStream() {
    final res = _firestoreService2.getStream();
    return res.map((snapshot) {
      return snapshot.docs.map((doc) {
        return MoviesModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
