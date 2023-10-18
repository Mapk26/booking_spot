
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SizeBloc extends Cubit<double> {
  
  SizeBloc() : super(40) {
    _init();
  }

  void _init() async {
    final shared = await SharedPreferences.getInstance();
    double zoom = shared.getDouble('SPOT_ZOOM') ?? 40;
    emit(zoom);

  }

  void increment() {

    emit(state+5);
    _storeValue(state);
  }

  void decrement() {

    emit(state>25 ? state-5 : state);
    _storeValue(state);
  }

  void _storeValue(double value) async {
    final shared = await SharedPreferences.getInstance();
    shared.setDouble('SPOT_ZOOM', state);
  }
}