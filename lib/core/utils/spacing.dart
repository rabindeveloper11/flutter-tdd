import 'package:flutter/material.dart';

class SpacingUtil{ 

static  Widget verticalSpacing(double height){
    return SizedBox(height: height);
  } 

 static Widget horizontalSpacing(double width){
    return SizedBox(width: width);
  }
}