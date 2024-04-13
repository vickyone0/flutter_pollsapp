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
        title: const Text("Moderators Poll",style : TextStyle(
              color: Colors.white,
              fontSize: 20, 
              ),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
          padding:  const EdgeInsets.all(16.0),
          child: Column(
            children: [
             const Text("Create poll",style: TextStyle(
              color: Colors.white,
              fontSize: 18, 
              ),),
             const SizedBox(height: 50,),
             TitleAndTextfield(
              title: 'Topic',
              controller: topicController,
              ),
             const SizedBox(height: 50,),
             TitleAndTextfield(
              title: 'Statement',
              controller: statementController,
              ),
             const SizedBox(height: 50,),
             Container(
               decoration:  BoxDecoration(
                   color: Colors.transparent,
                   borderRadius: BorderRadius.circular(10),
                   border:const Border(
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
                            
                  
                  
                             
                            const SizedBox(height: 50,),
                            Column(
                              children: _selectedValue == 1 ?  [
                                CustomTextformfield(labelText: 'Option 1', controller: optionFirstController,),
                             const SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 2', controller: optionSecondController,),
                             
                             const SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 3', controller: optionThirdController,),
                             
                            const SizedBox(height: 20,),
                             CustomTextformfield(labelText: 'Option 4', controller: optionFourthController,),
                
                            ] : [Container()],),
                             
                  ],
                ),
              ),
             ),
             
             const SizedBox(height: 50,),
             ElevatedButton(
              onPressed: (){
                _sendPostRequest( 
                   topic:topicController.text,
                   statement:statementController.text,
                   firstOption:optionFirstController.text,
                   secondOption:optionSecondController.text,
                  thirdOption:optionThirdController.text,
                  forthOption:optionFourthController.text
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



Future<void> _sendPostRequest({ required String topic,required String statement,required String firstOption,required String secondOption ,required String thirdOption ,required String forthOption}) async {

 if(topic.isEmpty || statement.isEmpty || firstOption.isEmpty || secondOption.isEmpty || thirdOption.isEmpty || forthOption.isEmpty) {
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all the fields')));
   return;
 } else{
 final List<String> options = [firstOption, secondOption, thirdOption, forthOption];
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
      
    } else {
      final jsonResponse = json.decode(response.body);
      final reason = jsonResponse["reason"];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(reason)),
      );
     
    }
  }
}
}