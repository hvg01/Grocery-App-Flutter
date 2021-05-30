import 'package:flutter/material.dart';
import 'package:groceries_app/home.dart';

class Recharge extends StatefulWidget {
  const Recharge({Key key}) : super(key: key);

  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {

  int selectedNoOfDeliveries = 30;

  @override
  Widget build(BuildContext context) {

    void rechargePanel() async {
      dynamic recharge= await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return RechargeOptions();
          }
      );

      if(recharge!=null){
        setState(() {

          selectedNoOfDeliveries=recharge;
          HomePageData.selectedNumberOfDel=recharge;
        });
      }


    }
    return GestureDetector(
      onTap: () => rechargePanel(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        height: 100,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.history_rounded),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        Text("Recharge/ Top Up",),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 25,),
                        Text("$selectedNoOfDeliveries Deliveries", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),)
                      ],
                    )
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: 12),
          ],
        ),
      ),
    );
  }
}

class RechargeOptions extends StatefulWidget {
  const RechargeOptions({Key key}) : super(key: key);

  @override
  _RechargeOptionsState createState() => _RechargeOptionsState();
}

class _RechargeOptionsState extends State<RechargeOptions> {

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),
              topLeft: Radius.circular(30))
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Text("Choose Deliveries"),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              selectDelivery(10, 0),
              selectDelivery(20, 1),
              selectDelivery(30, 2),
              SizedBox(height: 40,),
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Color(int.parse("0xFF50c0bb")),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context,(selectedIndex+1)*10);
                  },
                  child: Text(
                    "SELECT DELIVERIES", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

  Widget selectDelivery(int deliveries, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            border: selectedIndex == index ? Border(
                top: BorderSide(
                    color: Color(int.parse("0xFF50c0bb")), width: 2),
                bottom: BorderSide(
                    color: Color(int.parse("0xFF50c0bb")), width: 2)
            ): Border(bottom: BorderSide(color: Colors.grey[300], width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("$deliveries Deliveries")])

      ),
    );
  }
}


