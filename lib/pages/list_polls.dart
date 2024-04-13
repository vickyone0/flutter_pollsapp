

import 'package:flutter/material.dart';
import 'package:flutter_pollsapp/models/pollsresponse_model.dart';
import 'package:flutter_pollsapp/utils/colors.dart';
import 'package:flutter_pollsapp/widgets/custom_progressbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPolls extends StatelessWidget {

var pollResponse;

Future<void> _sendGetRequest()async{  
try{
  var url = Uri.parse('https://dev.stance.live/api/test-polls');
   final response = await http.get(url);
   if(response.statusCode == 200 ){
    pollResponse = PollResponseModel.fromJson(json.decode(response.body));
   }
}catch(e){
  print(e);
}
}

  
ListPolls({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("All Polls",style : TextStyle(
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
        child:Padding(
          padding:  EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: _sendGetRequest(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else {
             return ListView.builder(
              itemCount: pollResponse.data.length,
              itemBuilder: (context , index){
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                               width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(10),
                       border: const Border(
                        bottom:BorderSide(color: Colors.orange, width: 2.0),
                        top:BorderSide(color: Colors.orange, width: .3),
                        left:BorderSide(color: Colors.orange, width: 1.0),
                        right:BorderSide(color: Colors.orange, width: 1.0),
                        )
                       ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                      children: [
                        Text( pollResponse.data[index].topic,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19, 
                  fontWeight: FontWeight.w400,
                  ),),
                  Text(pollResponse.data[index].statement,style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13, 
                  ),),
                             
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Follow",style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14, 
                  ),
                  ),
                  SizedBox(width: 3,),
                  Text("@ TOI |",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12, 
                  ),
                  ),
                  SizedBox(width: 4,),
                  Text("Today",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  ),
                  ),
                             
                  ]
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: pollResponse.data[index].options.length < 5 ? pollResponse.data[index].options.length : 4,
                    itemBuilder:(context , item){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomProgressbar(
                          title: pollResponse.data[index].options[item],
                           progress:.2 * (item+1) ,
                           isLinearProgress: item == 0 ? true : false,),
                      );
                  
                    } ),
                             
                  const SizedBox(height: 20,),
                             
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        _sendGetRequest();
                      }, icon: Icon(
                        Icons.message,
                        color: AppColors.primaryColor,
                        )),
                      Text('${pollResponse.data[index].comments.length.toString()} comments',style:  TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,)),
                  const SizedBox(width: 30,),
                  IconButton(onPressed: (){}, icon: Icon(
                    Icons.share,
                    color: AppColors.primaryColor,
                    )
                    ),
                      Text('share',style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,)),
                  
                    ],
                  ),
                             
                  Divider(
                    color: AppColors.primaryColor,
                    thickness: .3,
                  ),
                             
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child:  Image.network('https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=', 
                          width:30,
                          height: 30,
                          fit: BoxFit.cover,
                          ),
                             
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Times of India (TOI)',
                            style:  TextStyle(
                  color: Colors.white,
                  fontSize: 12,)),
                  const Text('Us intel ... comments...',
                  style:  TextStyle(
                  color: Colors.grey,
                  fontSize: 11,)),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(
                        Icons.favorite_border,
                        color: AppColors.primaryColor,
                        )),
                      Text(pollResponse.data[index].likes.toString(),style: const TextStyle(color: Colors.grey,
                  fontSize: 11,)),
                    ],
                  )
                          ],
                        ),
                      ],
                    ),
                  )
                  
                      ],
                      ),
                  ),
                             ),
               );
              }
             );
              }
            }
        ),
      ),
      ),
    );
  }


}