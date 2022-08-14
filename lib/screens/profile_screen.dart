import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/network/cubit/app_cubit/cubit.dart';
import 'package:soft/network/cubit/app_cubit/stata.dart';
import 'package:soft/network/cubit/home_cubit/cubit.dart';

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class ProfileScreen extends StatefulWidget {
  static String id = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController ? controller;
  String? photoURL;
  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _onNameChanged() {
    setState(() {
      // if (controller.text.isEmpty) {
      //   showSaveButton = false;
      // } else {
      //   showSaveButton = true;
      // }
    });
  }

  Future updateDisplayName() async {

    setState(() {
      showSaveButton = false;
    });

    ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar
          (content:
        Text('Name updateda'),
          backgroundColor: Colors.green,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>AppCubit(),),
        BlocProvider(create:(context)=>CounterCubit()..counter,)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              backgroundColor: primaryColor,
              body: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 400,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 60,
                                    backgroundColor: Colors.white54,
                                    child: Text('No Image !',style: TextStyle(color: Colors.black)),
                                  ),
                                  Positioned.directional(
                                    textDirection: Directionality.of(context),
                                    end: 5,
                                    bottom: 5,
                                    child: Material(
                                      clipBehavior: Clip.antiAlias,
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(40),
                                      child: InkWell(
                                        onTap: () async {
                                          final photoURL = await getPhotoURLFromUser();

                                          if (photoURL != null) {
                                            // await user.updatePhotoURL(photoURL);
                                          }
                                        },
                                        radius: 50,
                                        child: const SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: Icon(Icons.edit),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // SizedBox(height: 15,),
                              // Text('Gaber Tarek',
                              //   style: TextStyle(color: Colors.white),
                              //
                              // ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('The Max Number Of Pieces Achived :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),

                                    ),
                                    SizedBox(width: 7,),
                                    Text('${CounterCubit.get(context).counter}',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),

                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('The number of pieces to be achieved :',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),

                                    ),
                                    SizedBox(width: 7,),
                                    Text('2000',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),

                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('The number of pieces to be achieved :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18
                                      ),

                                    ),
                                    SizedBox(width: 7,),
                                    Text('1005',
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              const SizedBox(height: 40),
                              TextButton(
                                onPressed: (){},
                                child:  Text('Sign out'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 40,
                        top: 40,
                        child: AnimatedSwitcher(
                          duration:  Duration(milliseconds: 200),
                          child: !showSaveButton
                              ? SizedBox(key: UniqueKey())
                              : TextButton(
                            onPressed: isLoading ? null : updateDisplayName,
                            child:  Text('Save changes'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }

}