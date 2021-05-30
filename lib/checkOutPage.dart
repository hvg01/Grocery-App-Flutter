import 'package:flutter/material.dart';
import 'package:groceries_app/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Subscribed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        textTheme: GoogleFonts.openSansTextTheme(),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
        ),
        title: Text(
            "Check Out", style: TextStyle(color: Colors.black, fontSize: 16)),
        toolbarHeight: 75,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(int.parse("0xFF50c0bb")))
        ),
        child: ListView(
          children: [
            Container(
              height: 125,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Color(int.parse("0x2650c0bb")),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
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

                      Text("Tata Tea Gold (1kg)", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("₹531", style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.w600)),
                          SizedBox(width: 5,),
                          Text("₹625.00", style: TextStyle(color: Colors.grey,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough),),
                          SizedBox(width: 5,),
                          Text(" • 1 Pkt", style: TextStyle(color: Colors.grey,
                              fontSize: 12)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(int
                            .parse("0x2650c0bb")), width: 2))
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 120,
                            child: Text("Quantity Per Day : ", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),)),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.15,),
                        Text("0" + "${HomePageData.quantity}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(int
                            .parse("0x2650c0bb")), width: 2))
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 120,
                            child: Text("Days Per Week : ", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),)),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.15,),
                        Text("0" + "${HomePageData.days.length}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(int
                            .parse("0x2650c0bb")), width: 2))
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 120,
                            child: Text(
                              "Total number of deliveries : ", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),)),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.15,),
                        Text("${HomePageData.selectedNumberOfDel}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(int
                            .parse("0x2650c0bb")), width: 2))
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 120,
                            child: Text(
                              "Delivery Start Date : ", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),)),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.15,),
                        Text("${HomePageData.date}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight
                              .bold),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      "TOTAL AMOUNT", style: TextStyle(fontSize: 18),),

                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text("₹ " + "${531 * HomePageData.quantity *
                        HomePageData.selectedNumberOfDel}", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                  ),

                  Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(int.parse("0xFF50c0bb")),
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              ThankYouPage()));
                        },
                        child: Text("Pay using Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 16),),
                      )
                  ),

                  SizedBox(height: 10,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key key}) : super(key: key);

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
        ),
        title: Text(
            "Back to Home Page", style: TextStyle(color: Colors.black, fontSize: 14)),
        toolbarHeight: 75,
      ),
      body: Center(
        child: Text("Thank you for placing order!", style: TextStyle(color: Colors.black, fontSize: 18),),
      ),
    );
  }
}

