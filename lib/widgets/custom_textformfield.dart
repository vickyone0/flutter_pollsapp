import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
const CustomTextformfield({ Key? key, required this.labelText, required this.controller }) : super(key: key);
final String labelText;
final TextEditingController controller;
  @override
  Widget build(BuildContext context){
    return Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                 decoration: BoxDecoration(
                   color: Colors.transparent,
                   borderRadius: BorderRadius.circular(10),
                   border: Border(
                    bottom:BorderSide(color: Colors.orange, width: 1.0),
                    top:BorderSide(color: Colors.orange, width: .10),
                    left:BorderSide(color: Colors.orange, width: .50),
                    right:BorderSide(color: Colors.orange, width: .50),
                    )
                   ),
                   
               child: Padding(
                 padding: const EdgeInsets.all(8),
                 child: TextFormField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  maxLines: null, // Allows multiple lines
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: labelText,
                  suffixIcon: IconButton(
                    icon:Icon(Icons.close),
                    color: Colors.white,
                    onPressed: (){
                      controller.clear();
                    },
                    )
                 ),
                 ),
               ),
             );
           
  //   return TextFormField(
  //     controller: controller,
  //     style: TextStyle(color: Colors.white),
  //             decoration: InputDecoration(
  //               suffixIcon: Icon(Icons.close),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               labelText: labelText,
  //             ),
  //            );
  // }
}
}