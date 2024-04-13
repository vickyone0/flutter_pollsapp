//  //         Container(
//                 //           decoration: BoxDecoration(color: _selectedValue == 2 ? Colors.black38: Colors.black,
//                 //    borderRadius: BorderRadius.circular(10),
//                 //    boxShadow: [
//                 //      BoxShadow(color: Colors.white,),],),
//                 //         width: 100,
//                 //         height: 100,
//                 //         child: Column(
//                 //           children: [
//                 //             SizedBox(height: 5,),
//                 //             Text('Picture',style: TextStyle(
//                 // color: Colors.white,
//                 // fontSize: 16, ),),
//                 // SizedBox(height: 5,),
//                 //             Text('Poll',style: TextStyle(
//                 // color: Colors.white,
//                 // fontSize: 14, ),),
//                 // SizedBox(height: 10,),
//                 //         Radio<int>(
//                 //           value: 2,
//                 //           groupValue: _selectedValue,
//                 //           onChanged: (value) {
//                 //             setState(() {
//                 // _selectedValue = value;
//                 //             });
//                 //           },
//                 //         ),           
//                 //           ]
//                 //         )
//                 //         ),
//                 //         Container(
//                 //           decoration: BoxDecoration(color: _selectedValue == 3 ? Colors.black38: Colors.black,
//                 //    borderRadius: BorderRadius.circular(10),
//                 //    boxShadow: [
//                 //      BoxShadow(color: Colors.white,),],),
//                 //         width: 100,
//                 //         height: 100,
//                 //         child: Column(
//                 //           children: [
//                 //             SizedBox(height: 5,),
//                 //             Text('Rate it',style: TextStyle(
//                 // color: Colors.white,
//                 // fontSize: 16, ),),
//                 // SizedBox(height: 5,),
//                 //             Text('Poll',style: TextStyle(
//                 // color: Colors.white,
//                 // fontSize: 14, ),),
//                 // SizedBox(height: 10,),
//                 //         Radio<int>(
//                 //           value: 3,
//                 //           groupValue: _selectedValue,
//                 //           onChanged: (value) {
//                 //             setState(() {
//                 // _selectedValue = value;
//                 //             });
//                 //           },
//                 //         ),           
//                 //           ]
//                 //         )
//                 //         )
               










//                FutureBuilder<Map<String, dynamic>>(
//     future: fetchData(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator(); 
//       } else if (snapshot.hasError) {
//         return Text('Error fetching data'); 
//       } else if (!snapshot.hasData) {
//         return Text('No data available'); 
//       } else {
//         final items = snapshot.data;

//         return ListView.builder(
//           itemCount: items!.length,
//           itemBuilder: (context, index) {
//             return Card(

//             );
//           },
//         );
//       }
//     },
//   ),
          
//         ),
//       ),
//       ),
//       );
//   }
//   Future<Map<String, dynamic>> fetchData() async {
  
//   final url = Uri.parse('https://dev.stance.live/api/test-polls/');
  
//     final response = await http.get(url);
//     final data = response.body;
//     final jsonResponse = json.decode(response.body);
//     if (response.statusCode == 200) {
      
//       return jsonResponse;
//       print('Data received: $data');
//     } 
//     return jsonResponse;
  

//   }
//  // return jsonResponse;
  
  
//   }
// }}



// class Model {
//     int code;
//     String reason;
//     List<Data> data;
//     //PageMetadata pageMetadata;

//     Model({
//         required this.code,
//         required this.reason,
//         required this.data,
//         //required this.pageMetadata,
//     });

//     // Model.fromJson(Map<String, dynamic> json)
//     // : code = json['code'],
//     //   reason = json['reason'],
//     //   data = (json['data'] as List)
//     //        .map((data) => Data.fromJson(data))
//     //        .toList();
//     //   //data = List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
//       //pageMetadata = PageMetadata.fromJson(json['pageMetadata']);
    
//     factory Model.fromJson(Map<String, dynamic> json) {
//     List<Data> data = [];
//     if (json['data'] != null) {
//       data = List<Data>.from(json['data'].map((data) => Data.fromJson(data)));
//     }
//     return Model(
//       code: json['code'],
//       reason: json['reason'],
//       data: data,
//       //pageMetadata: PageMetadata.fromJson(json['page_metadata']),
//     );
//   }
// }



// class Data {
//     //String id;
//     //List<String> userType;
//     //DateTime createdAt;
//     //CreatedBy createdBy;
//     String topic;
//     String statement;
//     //PollType pollType;
//     List<TypeOptions> textOptions;
//     //dynamic newsId;
//     //int noOfLikes;
//     //int noOfDislikes;
//     //bool isAnonymous;
//     //List<dynamic> comments;
//     //List<String> usersInteracted;
//    // Map<String, List<Response>> response;

//     Data({
//         //required this.id,
//        // required this.userType,
//         //required this.createdAt,
//         //required this.createdBy,
//         required this.topic,
//         required this.statement,
//        // required this.pollType,
//         required this.textOptions,
//        // required this.newsId,
//        // required this.noOfLikes,
//         //required this.noOfDislikes,
//         //required this.isAnonymous,
//         // required this.comments,
//         // required this.usersInteracted,
//        // required this.response,
//     });

//     Data.fromJson(Map<String, dynamic> json)
//     ://createdBy = json['createdBy'],
//     topic = json['topic'],
//     statement = json['statement'],
//     textOptions = json['textOptions'];
//     //newsId = json['newsId'],
//     //noOfLikes = json['noOfLikes'];
//    // response = json['response'];
//     //noOfDislikes = json['noOfDislikes'],
//     //isAnonymous = json['isAnonymous'],
//     //comments = List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x))),

// }

// class TypeOptions {
//   String text;
  
// }






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_pollsapp/models/model.dart';
import 'package:flutter_pollsapp/models/pollsresponse_model.dart';
import 'package:flutter_pollsapp/widgets/custom_progressbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPolls extends StatelessWidget {

var pollResponse;

Future<void> _sendGetRequest()async{
 //var value;   
try{
  var url = Uri.parse('https://dev.stance.live/api/test-polls');
   final response = await http.get(url);
   if(response.statusCode == 200 ){
    //data = json.decode(response.body);
    pollResponse = PollResponseModel.fromJson(json.decode(response.body));
    print(pollResponse.data[0].options[1]);
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
                return Center(
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
                               height: 600,
                   decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(10),
                       border: Border(
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
                        style: TextStyle(
                  color: Colors.white,
                  fontSize: 19, 
                  fontWeight: FontWeight.w400,
                  ),),
                  Text(pollResponse.data[index].statement,style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13, 
                  ),),
                             
                  Row(
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
                  SizedBox(height: 20,),
                  CustomProgressbar(title: pollResponse.data[index].options[0], progress:.7 ,isLinearProgress: true,),
                  
                  SizedBox(height: 10,),
                  CustomProgressbar(
                    title: 'US Intel Aids Canada in Nijjar Case', 
                    progress: .4 ,
                    isLinearProgress :false),
                  SizedBox(height: 10,),
                  CustomProgressbar(
                    title: 'US Intel Aids Canada in Nijjar Case', 
                  progress: .8 ,
                  isLinearProgress: false,),
                  SizedBox(height: 10,),
                  CustomProgressbar(
                    title: 'US Intel Aids Canada in Nijjar Case', 
                    progress: .4 ,
                    isLinearProgress: false,),
                             
                  SizedBox(height: 20,),
                             
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        _sendGetRequest();
                      }, icon: Icon(
                        Icons.message,
                        color: Colors.orange,
                        )),
                      Text('${pollResponse.data[index].comments.length.toString()} comments',style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12,)),
                  SizedBox(width: 30,),
                  IconButton(onPressed: (){}, icon: Icon(
                    Icons.share,
                    color: Colors.orange,
                    )
                    ),
                      Text('share',style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12,)),
                  
                    ],
                  ),
                             
                  Divider(
                    color: Colors.orange,
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
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Times of India (TOI)',style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,)),
                  Text('Us intel ... comments...',style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,)),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(
                        Icons.favorite_border,
                        color: Colors.orange,
                        )),
                      Text(pollResponse.data[index].likes.toString(),style: TextStyle(color: Colors.grey,
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



// class CreatedBy {
//     String? id;
//     String? name;

//     CreatedBy({
//         required this.id,
//         required this.name,
//     });
    

// }

// enum Name {
//     EMPTY,
//     PP_RETKJJ
// }

// enum PollType {
//     TEXT
// }

// class Response {
//     String id;
//     Name name;
//     DateTime createdAt;

//     Response({
//         required this.id,
//         required this.name,
//         required this.createdAt,
//     });

// }

// // class PageMetadata {
// //     int count;
// //     dynamic next;
// //     dynamic previous;
// //     int currentPage;
// //     int totalCount;
// //     int totalPages;

// //     PageMetadata({
// //         required this.count,
// //         required this.next,
// //         required this.previous,
// //         required this.currentPage,
// //         required this.totalCount,
// //         required this.totalPages,
// //     });

// //     PageMetadata.fromJson(Map<String, dynamic> json)
// //      : count = json['count'],
// //       next = json['next'],
// //       previous = json['previous'],
// //       currentPage = json['currentPage'],
// //       totalCount = json['totalCount'],
// //       totalPages = json['totalPages'];
    

// // }
