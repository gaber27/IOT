import 'package:flutter/material.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/screens/home_screen.dart';
import 'package:soft/screens/login_screen.dart';

import '../components/cons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword= true;
  var formKey = GlobalKey<FormState>();
  var phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Create New Account To Be \nA Member In Our Team ',
                    style: TextStyle(
                        fontSize:24 ,
                        wordSpacing: 1,
                        letterSpacing: 0.5,
                        color: Colors.white54,
                        fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormFiled(
                      controller: nameController,
                      type: TextInputType.name ,
                      Validate: (value)
                      {
                        if(value!.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                      },
                      label: 'Name',
                      Prefix: Icons.person
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultFormFiled(
                    controller: passwordController,
                    onSubmitted:(value) {
                      if (formKey.currentState!.validate()) {};
                    },
                    type: TextInputType.visiblePassword ,
                    Validate: (value)
                    {
                      if(value!.isEmpty) {
                        return 'Please Entre Your Password';
                      }
                    },
                    label: 'Password ',
                    iSPassword: false,
                    Prefix: Icons.lock,
                    suffixPressed:(){
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormFiled(
                    controller: phoneController,
                    onSubmitted:(value) {
                      if (formKey.currentState!.validate()) {};
                    },
                    type: TextInputType.visiblePassword ,
                    Validate: (value)
                    {
                      if(value!.isEmpty) {
                        return 'Please Entre Your Phone Number';
                      }
                    },
                    label: 'Phone ',
                    iSPassword: false,
                    Prefix: Icons.phone,
                    suffixPressed:(){
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        child: TextButton(onPressed: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            ShowToast(text: 'Success', state: ToastStates.SUCCESS);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);
                          }
                          else
                          {
                            ShowToast(text: 'error', state: ToastStates.ERROR);
                          }
                        }, child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold
                          ),

                        ))),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?',style: TextStyle(color: Colors.white)),
                      defaultTextButton(function: (){
                        navigateto(context,
                            LoginScreen());
                      }, text: 'Login',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //     backgroundColor: primaryColor,
    //     appBar: AppBar(
    //       elevation: 0.0,
    //       leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
    //         Navigator.pop(context);
    //       }),
    //     ),
    //     // appBar:appBar(context),
    //     body:
    //     SingleChildScrollView(
    //       child: Form(
    //         key: formKey,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 50,),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Create New Account',
    //                 style: TextStyle(
    //                     fontSize:24 ,
    //                     letterSpacing: 0.5,
    //                     color: Colors.white54,
    //                     fontWeight: FontWeight.w800,
    //                     fontFamily: 'bizmo'
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 0,),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Book court, invite your friends and start \n playing now in Padex!',
    //                 style: TextStyle(
    //                     fontSize:17,
    //                     color: Colors.white54,
    //                     fontWeight: FontWeight.normal,
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 20,),
    //             Padding(
    //               padding: const EdgeInsets.all(12.0),
    //               child: Text('Name',
    //                 style: TextStyle(
    //                     fontSize:16 ,
    //                     letterSpacing: 0.5,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.w600,
    //                     fontFamily: "bizmo"
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 2,),
    //             SizedBox(height: 20,),
    //             SizedBox(height: 2,),
    //             SizedBox(height: 20,),
    //             Padding(
    //               padding: const EdgeInsets.all(12.0),
    //               child: Row(
    //                 children: [
    //                   Text('Password',
    //                     style: TextStyle(
    //                         fontSize:16 ,
    //                         color: Colors.white54,
    //                         fontWeight: FontWeight.w600,
    //                         fontFamily: "bizmo"
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: 2,),
    //             SizedBox(height: 25,),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('Pick your phone, we will send',
    //                     style: TextStyle(
    //                         color: Colors.white54
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //
    //           ],
    //         ),
    //       ),
    //     )
    // );
  }
  }
