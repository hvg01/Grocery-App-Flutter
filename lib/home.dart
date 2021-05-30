import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/quantity.dart';
import 'package:groceries_app/recharge.dart';
import 'package:groceries_app/repeat.dart';
import 'package:groceries_app/startDate.dart';

//Color(int.parse("0xFF50c0bb"))

class HomePageData{
  static List<String> days=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  static int selectedNumberOfDel=30;
  static int quantity=1;
  static String date='${DateTime.now().toString().substring(0,10)}';

}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        textTheme: GoogleFonts.openSansTextTheme(),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,size: 20,),
        ),
        title: Text("Create subscription", style: TextStyle(color: Colors.black, fontSize: 16)),
        toolbarHeight: 75,
      ),

      body: ListView(
        children: [
          Container(
            height: 125,
            color: Color(int.parse("0x2650c0bb")),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tea.jpg'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text("Tata Tea Gold (1kg)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("₹531", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        SizedBox(width: 5,),
                        Text("₹625.00", style: TextStyle(color: Colors.grey,fontSize: 12,decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 5,),
                        Text(" • 1 Pkt",style: TextStyle(color: Colors.grey,fontSize: 12)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Quantity(),
                Repeat(),
                Recharge(),
                StartDate(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey[100],blurRadius: 5, spreadRadius: 5, offset: Offset(0.0,-3.0))]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width*0.32,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(int.parse("0xFF50c0bb")))
                ),

                child: TextButton(
                    onPressed: () {},
                    child: Text("DELIVER ONCE", style: TextStyle(color: Color(int.parse("0xFF50c0bb")), fontSize: 13),),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(),
                width: MediaQuery.of(context).size.width*0.55,
                decoration: BoxDecoration(
                  color: Color(int.parse("0xFF50c0bb")),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(int.parse("0xFF50c0bb")))
                ),

                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/subscribe');
                  },
                  child: Text("SUBSCRIBE", style: TextStyle(color: Colors.white,fontSize: 13,),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
