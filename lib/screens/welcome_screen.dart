import 'package:chat_application2/screens/login_screen.dart';
import 'package:chat_application2/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_application2/components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {

    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync:this,
    );

    animation=ColorTween(begin:Colors.blueGrey, end:Colors.black).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      print(controller.value);
    });
    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/bot.png'

                    ),

                    height: 100.0,
                  ),
                ),
               SizedBox(
                 width: 20.0,
               ),
                Text(
                  'FUN CHAT',
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color:Colors.white
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Rounded_Button('Login',Colors.blue,LoginScreen.id),
            Rounded_Button('Register',Colors.blueAccent ,RegistrationScreen.id)
          ],
        ),
      ),
    );
  }
}