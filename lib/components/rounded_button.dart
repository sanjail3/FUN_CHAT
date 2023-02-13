import 'package:flutter/material.dart';


class Rounded_Button extends StatelessWidget {
  Rounded_Button(this.text,this.color,this.name);
  final String text;
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:(){
            Navigator.pushNamed(context, name);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}