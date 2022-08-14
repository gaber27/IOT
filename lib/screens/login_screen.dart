import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:soft/components/cons.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/screens/home_screen.dart';
import 'package:soft/screens/layout_screen.dart';
import 'package:soft/screens/register_screen.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emilControler = TextEditingController();

  var passwordControler = TextEditingController();

  var adminControler = TextEditingController();

  GroupController controller = GroupController();

  var isAdmin = 1 ;
  var _value = true ;


  var isEmp = 0 ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image(image: AssetImage(
                    'assets/images/login.jpg',
                  ),
                  fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login now to join our team',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormFiled(
                      controller: emilControler,
                      type: TextInputType.number ,
                      Validate: (value)
                      {
                        if(value!.isEmpty) {
                          return 'Please Enter Your ID';
                        }
                      },
                      label: 'ID',
                      Prefix: Icons.person_outline
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultFormFiled(
                    controller: passwordControler,
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
                    height: 0.0,
                  ),
                  if(_value==true)
                    Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),

                        defaultFormFiled(
                          controller: adminControler,
                          onSubmitted:(value) {
                            if (formKey.currentState!.validate()) {};
                          },
                          type: TextInputType.visiblePassword ,
                          Validate: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Please Entre Your Code';
                            }
                            if(value !='200' )
                            {
                              return 'Please Entre Correct Code';
                            }
                          },
                          label: 'Admin Code ',
                          iSPassword: true,
                          Prefix: Icons.admin_panel_settings_outlined,
                          suffixPressed:(){
                          },
                        ),
                      ],
                    ),                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide(color: Colors.white54),
                        activeColor: Colors.white54,
                        // hoverColor: ,
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      Text('Are You Admin ?',style: TextStyle(
                        color: Colors.white
                      )),
                    ],
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
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LayoutScreen()), (route) => false);
                          }
                          else
                          {
                            ShowToast(text: 'error', state: ToastStates.ERROR);
                          }
                        }, child: Text('Next',
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
                      Text('Don\'t have an account?',style: TextStyle(color: Colors.white)),
                      defaultTextButton(function: (){
                        navigateto(context,
                            RegisterScreen());
                      }, text: 'Register',
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

  }
}


