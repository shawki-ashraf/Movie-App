import 'package:bloc/bloc.dart';
import 'package:firebase/feturas/add_view/model/addmovie_repo.dart';
import 'package:firebase/feturas/home_view/models/movies_model.dart';
import 'package:meta/meta.dart';

part 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  final AddmovieRepo addmovieRepo = AddmovieRepo();

  AddDataCubit() : super(AddDataInitial());

  Future<void> senddata(MoviesModel moviesModel) async {
    emit(Dataloading());

    try {
      await addmovieRepo.addmovie(moviesModel); // 👈 من غير res
      emit(Dataloaded());
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }

  Future<void> senddata2(MoviesModel moviesModel) async {
    emit(Dataloading());

    try {
      await addmovieRepo.addseries(moviesModel); // 👈 من غير res
      emit(Dataloaded());
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }
}
