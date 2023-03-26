import 'package:flutter/material.dart';
import 'package:salonapp/pages/HistoryPage.dart';


class HistoryPageState extends State<HistoryPage> {
  
  @override
 Widget build(BuildContext context) {
   return Scaffold(
      
        body: Container(
         padding: EdgeInsets.all(16.0),
         child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Column(
               children: [
                Text("Current Appointment",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 6),

                buildCard("2023/3/25 11:00"),
                SizedBox(height: 15),
                Text("Past Appointment",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                pastbuildCard("2023/2/23"),
                 
               ],
             )),
       ));
 }
} 

Card buildCard(String sdate) {
   var heading = sdate;
   var subheading = 'Stylist by Anny Roy';
   var supportingText =
       'Menu: Hair cut';
   return Card(
       elevation: 4.0,
       child: Column(
         children: [
           ListTile(
             title: Text(heading),
             subtitle: Text(subheading),
             //trailing: Icon(Icons.favorite_outline),
           ),
           Image.asset(
              'images/haircutpic.png',
              height: 200,
              //width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
          ),
           Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: 
             Text(supportingText),
             
           ),
           ButtonBar(
             children: [
               TextButton(
                 child: const Text('Cancel '),
                 onPressed: () {/* ... */},
               ),
               TextButton(
                 child: const Text('Resuchdule'),
                 onPressed: () {/* ... */},
               )
             ],
           )
         ],
       ));
 }

 Card pastbuildCard(String sdate) {
   var heading = sdate;
   var subheading = 'Stylist by Anny Roy';
   var supportingText =
       'Menu: Hair cut';
   return Card(
       elevation: 4.0,
       child: Column(
         children: [
           ListTile(
             title: Text(heading),
             subtitle: Text(subheading),
             //trailing: Icon(Icons.favorite_outline),
           ),
           Image.asset(
              'images/haircutpic.png',
              height: 200,
              //width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
          ),
           Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: 
             Text(supportingText),
             
           ),
         ],
       ));
 }