// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String id;
  String eventName;
  String eventDescription;
  String eventDate;
  String eventVenue;
  int v;

  Posts({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.eventDate,
    required this.eventVenue,
    required this.v,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["_id"],
    eventName: json["eventName"],
    eventDescription: json["eventDescription"],
    eventDate: json["eventDate"],
    eventVenue: json["eventVenue"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "eventName": eventName,
    "eventDescription": eventDescription,
    "eventDate": eventDate,
    "eventVenue": eventVenue,
    "__v": v,
  };
}
