import 'package:events/pages/HomePage.dart';
import 'package:events/services/PostServices.dart';
import 'package:flutter/material.dart';
import '../models/PostModels.dart';

class ViewEvent extends StatefulWidget {
  const ViewEvent({super.key});

  @override
  State<ViewEvent> createState() => _ViewEventState();
}

class _ViewEventState extends State<ViewEvent> {

  Future<List<Posts>> ? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data= PostApiService().getPOst();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("VIEW EVENTS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.yellow
          ),),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),

        body: FutureBuilder(future: data, builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (value,index)
              {
                return Container(
                  height: 140,
                  width: 300,
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.9),
                ]
                )
                ),
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      children: [


                        ListTile(

                          title: Text("Event Name: " + snapshot.data![index].eventName.toString() + "\n" + "\n" + "Description: " + snapshot.data![index].eventDescription.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),


                          trailing: Text("Date:" + snapshot.data![index].eventDate.toString() + "\n" + "Venue:" + snapshot.data![index].eventVenue.toString(),
                            style: TextStyle(
                              fontSize: 15,
                                color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),

                        )

                      ],
                    ),

                  ),
                );
              }
              );
            }
          else
            {
              return CircularProgressIndicator();
            }
        }
        ),


        bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                )
            ),
            onPressed: (){Navigator.pop(context,MaterialPageRoute(builder: (context)=>HomePage()));}, child: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
