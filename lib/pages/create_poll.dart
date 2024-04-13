import 'package:flutter/material.dart';
import 'package:flutter_pollsapp/widgets/custom_radiobutton.dart';
import 'package:flutter_pollsapp/widgets/custom_textformfield.dart';
import 'package:flutter_pollsapp/widgets/title_and_textfield.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class CreatePoll extends StatefulWidget {
const CreatePoll({ Key? key }) : super(key: key);

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {

  
  final TextEditingController topicController = TextEditingController();
  final TextEditingController statementController = TextEditingController();

  final TextEditingController optionFirstController = TextEditingController();
  final TextEditingController optionSecondController = TextEditingController();
  final TextEditingController optionThirdController = TextEditingController();
  final TextEditingController optionFourthController = TextEditingController();

   bool selectedOption = false;
  

   int? _selectedValue = 1;
   

  @override
  Widget build(BuildContext context){

    return  Scaffold(
      appBar: AppBar(
        title: Text("Moderators Poll",style : TextStyle(
              color: Colors.white,
              fontSize: 20, 
              ),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        colors: <Color>[Color(0xfff58600), Color(0xffc64216)],
      ),
    ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: 
      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            children: [
             const Text("Create poll",style: TextStyle(
              color: Colors.white,
              fontSize: 18, 
              ),),
             SizedBox(height: 50,),
             TitleAndTextfield(
              title: 'Topic',
              controller: topicController,
              ),
             SizedBox(height: 50,),
             TitleAndTextfield(
              title: 'Statement',
              controller: statementController,
              ),
             SizedBox(height: 50,),
             Container(
               decoration: BoxDecoration(
                   color: Colors.transparent,
                   borderRadius: BorderRadius.circular(10),
                   border: Border(
                    bottom:BorderSide(color: Colors.grey, width: 2.0),
                    top:BorderSide(color: Colors.grey, width: .3),
                    left:BorderSide(color: Colors.grey, width: 1.0),
                    right:BorderSide(color: Colors.grey, width: 1.0),
                    )
                   ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [      
                    CustomRadiobutton(
                      title: 'MCQ', 
                      value: 1,
                    selectedValue: _selectedValue, 
                    onChanged:(value) {
                setState(() {
                  _selectedValue = value;
                });
                
              }, ),
              CustomRadiobutton(
                      title: 'Picture', 
                      value: 2,
                    selectedValue: _selectedValue, 
                    onChanged:(value) {
                setState(() {
                  _selectedValue = value;
                });
                
              }, ),
              CustomRadiobutton(
                      title: 'Rate it', 
                      value: 3,
                    selectedValue: _selectedValue, 
                    onChanged:(value) {
                setState(() {
                  _selectedValue = value;
                });
                
              }, ),

                      ],
                    ),
                            
                  
                  
                             
                             SizedBox(height: 50,),
                             CustomTextformfield(labelText: 'Option 1', controller: optionFirstController,),
                             SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 2', controller: optionSecondController,),
                             
                             SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 3', controller: optionThirdController,),
                             
                             SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 4', controller: optionFourthController,),
                
                  ],
                ),
              ),
             ),
             
             SizedBox(height: 50,),
             ElevatedButton(
              onPressed: (){
                _sendPostRequest( 
                  topicController.text,
                   statementController.text,
                  [optionFirstController.text, optionSecondController.text,optionThirdController.text,optionFourthController.text]
                  );
              }, 
              child: Text('Submit',style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.orange,
            fixedSize: const Size(200, 50), 
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10), 
      
    ),
  ),
              ),
             
          ]
            
          ),
        ),
      ),
      ),
    );
  }



Future<void> _sendPostRequest(String topic, String statement, List<String> options) async {

  Map<String, dynamic> appData = {
  
"topic":  topic,
"statement": statement,
"is_anonymous": "false",
"poll_type": "text",
"text_options": options
};

    final url = Uri.parse('https://dev.stance.live/api/test-polls/'); 

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', 
      },
      body: json.encode(appData),
    );

    if (response.statusCode == 200) {
       final jsonResponse = json.decode(response.body);
      final reason = jsonResponse["reason"];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(reason)),
      );
      print('Response: ${response.body}');
      
    } else {
      final jsonResponse = json.decode(response.body);
      final reason = jsonResponse["reason"];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(reason)),
      );
      print('Error: ${response.statusCode}');
     
    }
  }
}