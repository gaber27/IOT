import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft/components/cons.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/network/cubit/home_cubit/cubit.dart';
import 'package:soft/network/cubit/home_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates >(
        listener: (context, state) {
          if(state is CounterMinisState)
          {}
          if(state is CounterPlusState)
          {}
        },
        builder: (context , state){
          return  Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              elevation: 0,
            ),
            body:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Gaber !',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 0.5,
                          fontSize: 20
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text('Please press the plus button when the piece is finished',
                        style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 0.5,
                          fontSize: 20
                        ),
                        ),
                        SizedBox(height: 40,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text('The number of pieces achieved so far:',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                wordSpacing: 0.5,
                                fontSize: 18
                              ),
                              ),
                              SizedBox(width: 7,),

                              Text('200',
                              style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                                wordSpacing: 0.5,
                                fontSize: 16
                              ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height/7,),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                   SizedBox(width: 10,),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( horizontal: 20.0),
                                  child: Text(
                                    '${CounterCubit.get(context).counter}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 65,
                                    width: MediaQuery.of(context).size.width/2.5,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    child:
                                    TextButton(onPressed: (){
                                      ShowToast(text: 'One Piece Removed', state: ToastStates.ERROR);

                                      CounterCubit.get(context).minis();

                                    }, child:
                                    Text(
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold
                                        ),
                                        'Minis'
                                    ),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    height: 65,
                                    width: MediaQuery.of(context).size.width/2.5,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    child:
                                    TextButton(onPressed: (){
                                      ShowToast(text: 'One Piece Add ', state: ToastStates.SUCCESS);
                                      CounterCubit.get(context).plus();

                                    }, child:
                                    Text(
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold
                                        ),
                                        'Plus'
                                    ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 25,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
