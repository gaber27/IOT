import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soft/const/colors.dart';
import 'package:soft/screens/login_screen.dart';


class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}
class onBoardinScreen extends StatefulWidget {

  @override
  State<onBoardinScreen> createState() => _onBoardinScreenState();
}

class _onBoardinScreenState extends State<onBoardinScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding=[
    BoardingModel(
        image: 'assets/images/g.webp',
        title: 'Welcome To App Soft',
        body: 'Now you can follow your work  '
    ) ,
    BoardingModel(
        image: 'assets/images/images.webp',
        title: 'Faster Way To Control Business',
        body: 'Managing your business from home'
    ) ,
    BoardingModel(
        image: 'assets/images/l.webp',
        title: 'Follow The Stats',
        body: 'We provide you with all the statistics in your work'
    ) ,
  ];

  bool isLast =false;

  void Function() ? submit()
  {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        actions:
        [
          TextButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);},
              child: Text('Skip',style: TextStyle( color: Colors.white54,letterSpacing: 1,fontWeight: FontWeight.bold),))


        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index)
                {
                  if(index == boarding.length -1)
                  {
                    setState(() {
                      isLast = true;
                    });
                    // print('Last');
                  }else
                  {
                    // print('Not Last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator
                  (
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.white54,
                    dotColor: Colors.white,
                    dotHeight: 10.0,
                    expansionFactor: 4.0,
                    dotWidth: 8.0,
                    spacing: 5.0,
                  ),

                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white54,
                  onPressed: ()
                {
                  if(isLast)
                  {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                    // submit();
                  }else{
                    boardController.nextPage(duration: Duration(
                      milliseconds: 750,
                    ),
                        curve: Curves.easeInQuart
                    );
                  }
                },
                  child: Icon(Icons.arrow_forward_ios_outlined,),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
                image: AssetImage('${model.image}')
            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(

            '${model.body}',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
}