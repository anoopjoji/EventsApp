import 'dart:convert';

import 'package:events/models/PostModels.dart';
import 'package:http/http.dart' as http;


class PostApiService
{
  Future<dynamic> putData(String EName,String EDesc ,String EDate,String EVenue) async
  {
    var client = http.Client();
    var ApiUrl = Uri.parse("http://localhost:1001/api/events/add");
    var responce = await client.post(ApiUrl,

        headers:<String,String>

        {
          "Content-type":"application/json; charset=UTF-8"
        },
      body: jsonEncode(<String,String>

      { "eventName":EName,
        "eventDescription":EDesc,
        "eventDate":EDate,
        "eventVenue": EVenue}
      )

    );

    if(responce.statusCode == 200)
      {
        return jsonDecode(responce.body);
      }
    else
      {
        throw Exception("Failed!!");
      }
  }

  Future<List<Posts>> ? getPOst() async
  {
    var client = http.Client();
    var ApiUrl = Uri.parse("http://localhost:1001/api/events/view");
    var responce = await client.get(ApiUrl);

    if(responce.statusCode == 200)
      {
        return postsFromJson(responce.body);
      }
    else
      {
        return [];
      }
  }
}
