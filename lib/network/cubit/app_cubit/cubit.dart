import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft/network/cubit/app_cubit/stata.dart';
import 'package:soft/screens/home_screen.dart';
import 'package:soft/screens/profile_screen.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(Context)=> BlocProvider.of(Context);
  int currentIndex=0;
  List<Widget> screens =
  [
    HomeScreen(),
    ProfileScreen(),
  ];
  List<String> titles=
  [
    // 'Home',
    'Profile',
  ];
  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavabBarState());

  }


}