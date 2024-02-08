import 'package:events/pages/AddEvent.dart';
import 'package:events/pages/ViewEvent.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EVENTS",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.yellow
        ),),
        centerTitle: true,
        backgroundColor: Colors.black
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.9),
            ]
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircleAvatar(radius: 135,
            backgroundImage: NetworkImage("https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRARbey8R6Pduj0FKoI5XvRommxM97TcKYaXgg_qO3EeLqhFryUXIGMANDN0xEU3L9_"),),

            SizedBox(height: 20,),
            SizedBox(
                height: 45,
                width: 220,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewEvent()));}, child: Text("VIEW EVENTS",style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600
                ),
                )
                )
            ),

            SizedBox(height: 20,),
            SizedBox(
              height: 45,
              width: 220,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEvent()));}, child: Text("ADD EVENTS",style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600
              ),)),
            )


          ],
        ),
      ),
    );
  }
}
