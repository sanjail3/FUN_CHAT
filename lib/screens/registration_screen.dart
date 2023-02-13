import 'package:chat_application2/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_application2/components/rounded_button.dart';
import 'package:chat_application2/constants.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chat_application2/chatgpt.dart';

class RegistrationScreen extends StatefulWidget {
  static String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner=false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/bot.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                 keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email=value;
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email")
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password=value;
                  },
                  decoration:kTextFieldDecoration.copyWith(hintText: "Enter your password")
              ),
              SizedBox(
                height: 24.0,
              ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              elevation: 5.0,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed:() async {
                 setState(() {
                   showSpinner=true;
                 });
                  try {
                    final user =  await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (user!=null){
                      Navigator.pushNamed(context, MyApp.id);

                    }
                    setState(() {
                      showSpinner=false;
                    });
                  }
                  catch(e){
                    print(e);
                  }
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  "Registration",
                ),
              ),
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}