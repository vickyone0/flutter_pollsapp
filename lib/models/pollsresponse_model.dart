
import 'package:http/http.dart';

class PollResponseModel{
  final int code;
  final String reason;
  final List<Data> data;

  PollResponseModel({required this.code, required this.reason,required this.data});
factory PollResponseModel.fromJson(Map<String, dynamic>json){
  final dataList =(json['data'] as List).map((dataJson)=> Data.fromJson(dataJson)).toList();
  return PollResponseModel(
      code: json['code'],
      reason: json['reason'],
      //data: List<Data>.from(json['data'])
      data: dataList,


    );
}
}

class Data{
  final String topic;
  final String statement;
  final List<String> options;
  final int likes;
  final List<dynamic> comments;
  //final Response response;

  Data({required this.topic, required this.statement,required this.options,required this.likes,required this.comments,});
  
  factory Data.fromJson(Map<String,dynamic> json){
    final optionsList = List<String>.from(json['text_options']);
    return Data(
      topic: json['topic'],
      statement: json['statement'],
      options: optionsList, 
      likes: json['no_of_likes'],
      comments: json['comments'],
      //response: json['response'],
      );
  }


}

class Response{

}

