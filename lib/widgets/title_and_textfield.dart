import 'package:flutter/material.dart';

class TitleAndTextfield extends StatelessWidget {
const TitleAndTextfield({ Key? key, required this.title, required this.controller }) : super(key: key);

final String title;
final TextEditingController controller;

  @override
  Widget build(BuildContext context){
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
           Text(title,style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300, 
              ),),
           SizedBox(height:  20,),
           Container(
                width: MediaQuery.of(context).size.width,
                 height:100,
                 decoration: BoxDecoration(
                   color: Colors.transparent,
                   borderRadius: BorderRadius.circular(10),
                   border: Border(
                    bottom:BorderSide(color: Colors.grey, width: 2.0),
                    top:BorderSide(color: Colors.grey, width: .50),
                    left:BorderSide(color: Colors.grey, width: 1.0),
                    right:BorderSide(color: Colors.grey, width: 1.0),
                    )
                   ),
                   
               child: Padding(
                 padding: const EdgeInsets.only(top: 4, left: 8, bottom:8,right: 8),
                 child: TextFormField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  maxLines: null, // Allows multiple lines
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'write here ...',
                 ),
                 ),
               ),
             ),
           
              ],
    );
              
  }
}