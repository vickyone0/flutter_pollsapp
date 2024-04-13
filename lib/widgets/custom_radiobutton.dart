import 'package:flutter/material.dart';

class CustomRadiobutton extends StatelessWidget {
const CustomRadiobutton({ Key? key, required this.title, required this.selectedValue, required this.onChanged, required this.value }) : super(key: key);

  final int value;
  final int? selectedValue;
  final ValueChanged<int?>? onChanged;
  final String title;

  @override
  Widget build(BuildContext context){
    return Container(
                          decoration: BoxDecoration(color: selectedValue == value ? Colors.black38: Colors.black , 
                   borderRadius: BorderRadius.circular(10),
                   border: Border(
                    bottom:BorderSide(color:selectedValue == value ? Colors.orange : Colors.grey, width: 1.0),
                    top:BorderSide(color: selectedValue == value ? Colors.orange : Colors.grey, width: .10),
                    left:BorderSide(color: selectedValue == value ? Colors.orange : Colors.grey, width: .50),
                    right:BorderSide(color: selectedValue == value ? Colors.orange : Colors.grey, width: .50),
                    )
                   ),
                  
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            SizedBox(height: 5,),
                            Text(title,style: TextStyle(
                color: Colors.white,
                fontSize: 16, ),),
                SizedBox(height: 5,),
                            Text('Poll',style: TextStyle(
                color: Colors.white,
                fontSize: 14, ),),
                SizedBox(height: 10,),
                        Radio<int>(
                          activeColor: Colors.orange,
                          value: value,
                          groupValue: selectedValue,
                          onChanged: onChanged,
                        ),           
                          ]
                        )
                        );          
                    
  }
}