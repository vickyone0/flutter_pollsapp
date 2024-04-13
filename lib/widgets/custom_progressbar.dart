import 'package:flutter/material.dart';

class CustomProgressbar extends StatelessWidget {
const CustomProgressbar({ Key? key, required this.title, required this.progress, required this.isLinearProgress }) : super(key: key);

final String title;
final double progress;
final bool isLinearProgress;
  @override
  Widget build(BuildContext context){
    return Stack(
                children: [
                  Container(
                  width: MediaQuery.of(context).size.width,
                   height:60,
                   decoration: BoxDecoration(
                     color: Colors.transparent,
                     borderRadius: BorderRadius.circular(10),
                     border: Border(
                      bottom:BorderSide(color: Colors.orange, width: 2.0),
                      top:BorderSide(color: Colors.orange, width: .50),
                      left:BorderSide(color: Colors.orange, width: 1.0),
                      right:BorderSide(color: Colors.orange, width: 1.0),
                      )
                     ),
                     
                 child: Padding(
                   padding: const EdgeInsets.all(8),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(title,style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: isLinearProgress ? LinearProgressIndicator(
                    value: .6,
                    backgroundColor: Color(0x75f3c592),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ): Container(),
                ),
                
                    ],),
                   
                 ),
                ),
                Opacity(
                  opacity: .4,
                  child: Container(
                    width: MediaQuery.of(context).size.width*progress,
                     height:60,
                     decoration: BoxDecoration(
                       color: Colors.orangeAccent,
                       borderRadius: BorderRadius.circular(10),
                       border: Border(
                        bottom:BorderSide(color: Colors.orange, width: 2.0),
                        top:BorderSide(color: Colors.orange, width: .50),
                        left:BorderSide(color: Colors.orange, width: 1.0),
                        right:BorderSide(color: Colors.orange, width: 1.0),
                        )
                       ),
                  ),
                )
                ]
              );

  }
}