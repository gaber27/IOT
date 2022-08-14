import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft/network/cubit/app_cubit/cubit.dart';
import 'package:soft/network/cubit/app_cubit/stata.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>AppCubit()..currentIndex,
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context,index)=> Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white54,
            type: BottomNavigationBarType.fixed,
            currentIndex: AppCubit
                .get(context)
                .currentIndex,
            onTap: (index) {
              AppCubit.get(context).changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.menu),
                  label: 'Tasks'
              ),
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.account_box_outlined),
                  label: 'profile'
              ),

            ],
          ),
           body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
        ),
        listener:(context,index){} ,
      ),
    );
  }
}
