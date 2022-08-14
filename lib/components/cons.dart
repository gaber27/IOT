import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soft/const/colors.dart';
import 'package:hexcolor/hexcolor.dart';
Widget defaultButton({
  double ? width = double.infinity ,
  Color ? background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function()? function , //  خلي بالك من دي
  required String  text ,
})=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  width: width,
  // height: 40.0,
  child:
  MaterialButton(
    onPressed: function,
    child:
    Text(
      isUpperCase? text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
Widget defaultFormFiled({
  bool isClicable = true,
  void Function() ?onTap,
  required TextEditingController controller,
  required TextInputType type ,
  required String? Function(String?)? Validate,
  required String? label,
  required IconData ? Prefix,
  IconData ?suffix ,
  String? Function(String?) ?onSubmitted,
  String? Function(String?)?onChange,
  bool iSPassword =  false,
  void Function () ?suffixPressed,
  Decoration = InputDecoration,
})=>  TextFormField(
  cursorColor: primaryColor,
  enabled:isClicable ,
  onTap: onTap,
  controller: controller,
  keyboardType: type ,
  obscureText: iSPassword,
  onFieldSubmitted: onSubmitted,
  onChanged: onChange,
  validator: Validate,
  decoration: InputDecoration(
    labelStyle: TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder
      (
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
            color: Colors.white
        )),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.white,
        )
    ),
     errorBorder:  OutlineInputBorder(
         borderRadius: BorderRadius.circular(14),
         borderSide: BorderSide(
           color: Colors.white,
         )
     ),
     focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(14),
         borderSide: BorderSide(
           color: Colors.white,
         )
     ),
     focusColor: Colors.white,
    filled: true,
    fillColor: Colors.grey[200],
    hintText:label,
    suffixIcon: suffix!= null? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
          suffix
      ),
    ) :
    null,
    prefixIcon:
    Icon(
      Prefix,
    ),
    border: OutlineInputBorder(),
  ),
);
Widget bulidTaskItem(Map model, context)=>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                  '${model['time']}'
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),

          ],
        ),
      ),
      onDismissed: (direction){
      },
    );

Widget buildArticalItem(article,context)=> InkWell(
  onTap: (){
    // navigateto(context, webViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                    '${article['urlToImage']}'
                ),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget myDivider()=>  Container(
  width: double.infinity,
  color: Colors.grey[300],
  height: 1.0,
) ;


void navigateto(context,Widget)=> Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>
    Widget,
  ),
);

void navigateAndFinish(context,Widget)=>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(
      builder: (context)=>
      Widget,
    ),
            (Route<dynamic>route) => false
    );
Widget defaultTextButton({
  required  void Function()? function,
  required String text})
=> TextButton(onPressed: function, child: Text(text.toUpperCase(),style: TextStyle(color: Colors.white54)),);


void ShowToast({
  required String text,
  required ToastStates state
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

// enum if u have many choose
enum ToastStates {SUCCESS, ERROR, WARNING}
Color chooseToastColor(ToastStates state)
{
  late Color color ;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green ;
      break;
    case ToastStates.ERROR:
      color =  Colors.red ;
      break;
    case ToastStates.WARNING:
      color = Colors.amber ;
      break;
  }
  return color ;
}
Widget buildListproduct( model,context, {bool isOldPrice = true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: 120.0,
              height: 120.0,
              // fit: BoxFit.cover,

            ),
            if(model.discount != 0 && isOldPrice)
              Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child:
                  Text
                    (
                    'DISCOUNT',
                    style: TextStyle
                      (
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  )
              ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle
                  (
                    fontSize: 14.0,
                    height: 1.2,
                    color: Colors.black
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price.toString()+'  EGP  ',
                    style: TextStyle
                      (
                      fontSize: 13.0,
                      height: 1.3,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if(model.discount!= 0 && isOldPrice)
                    Text(
                      model.oldPrice.toString(),
                      style: TextStyle
                        (
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                  Spacer(),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);


class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool value =false ;
  @override
  Widget build(BuildContext context) {
    return Checkbox(

        splashRadius: 14,
        side: BorderSide(color: Colors.black,
        ),
        autofocus: true,
        activeColor: HexColor('#B8FF01'),
        value: value,
        onChanged:  (value) {
          setState((){
            value= value!;
          }
          );
        }
    );

  }
}

