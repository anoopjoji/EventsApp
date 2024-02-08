import 'package:events/pages/HomePage.dart';
import 'package:events/services/PostServices.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  TextEditingController Ename = new TextEditingController();
  TextEditingController Edesc = new TextEditingController();
  TextEditingController Edate = new TextEditingController();
  TextEditingController Evenue = new TextEditingController();

  void UploadData() async
  {
    final responce = await PostApiService().putData(Ename.text, Edesc.text, Edate.text, Evenue.text);
    if(responce["status"]=="success")
      {
        print("SUCCESS");
      }
    else
      {
        print("ERROR");
      }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ADD EVENT",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.yellow
          ),),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),

        body: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8)
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              CircleAvatar(radius: 50,
                backgroundImage: NetworkImage("https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRARbey8R6Pduj0FKoI5XvRommxM97TcKYaXgg_qO3EeLqhFryUXIGMANDN0xEU3L9_"),),


              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: Ename,

                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Event Name",
                labelStyle: TextStyle(
                  color: Colors.white
                )
              ),
                style: TextStyle(
                  color: Colors.white
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: Edesc,

                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Event Description",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
              ),
                style: TextStyle(
                  color: Colors.white
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: Edate,

                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Event Date",
                labelStyle: TextStyle(
                    color: Colors.white
                ),
              ),
                style: TextStyle(
                    color: Colors.white
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: Evenue,

                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Event Venue",
                labelStyle: TextStyle(
                    color: Colors.white
                ),
              ),
                style: TextStyle(
                    color: Colors.white
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                  height: 45,
                  width: 220,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        backgroundColor: Colors.black45,
                        foregroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )

                      ),
                      onPressed: UploadData, child: Icon(Icons.add_circle,size: 45,)))

            ],
          ),
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
