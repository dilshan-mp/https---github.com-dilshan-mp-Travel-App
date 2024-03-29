import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/model/data_model.dart';
//import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/services/data_services.dart';
class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}):super(InitialState()){
    emit(WelcomeState());
  }
  final DataServvices data;
  late final places;
  Future<void> getData() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));

    // ignore: empty_catches
    }catch(e){

    }
  }
  // ignore: non_constant_identifier_names
  DetailsPage(DataModel data){
    emit(DetailState(data));
  }
  goHome(){
    emit(LoadedState(places));
  }
}
