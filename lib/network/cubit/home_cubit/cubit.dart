import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft/network/cubit/home_cubit/states.dart';
class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(CounterInitialState());
  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter=1;
  void minis(){
    counter--;
    emit(CounterMinisState());
  }
  void plus(){
    counter++;
    emit(CounterPlusState());

  }
}