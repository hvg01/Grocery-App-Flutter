import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/home.dart';


List<bool> daysInBool=[true,true,true,true,true,true,true];

class Repeat extends StatefulWidget {
  const Repeat({Key key}) : super(key: key);

  @override
  _RepeatState createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {

  List<bool> daysSelected=daysInBool;
  List<String> days=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

  reformat(list){
    List<String> returnList=[];
    for(var i=0;i<list.length;i++){
      if(list[i]){
        returnList.add(days[i]);
      }
    }
    return returnList;
  }

  daysSelectionPanel  () async{
    dynamic updatedDaysList= await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          return DaySettings();
        }
    );

    setState(() {
      daysSelected=updatedDaysList;
      HomePageData.days=reformat(updatedDaysList);

    });
  }

  dailyOrNOt(){

    int noOfSelectedDays=daysSelected.where((element) => element==true).length;
     return "  •  $noOfSelectedDays DAYS A WEEK";
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()  {
        daysSelectionPanel();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        height: 100,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.repeat),
                SizedBox(width: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Repeat",),
                    Text(dailyOrNOt(),
                      style: TextStyle(
                          color: Color(int.parse("0xFF50c0bb")),
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 4,),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 40,),
                        day('M', 0),
                        day('T', 1),
                        day('W', 2),
                        day('T', 3),
                        day('F', 4),
                        day('S', 5),
                        day('S', 6),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_outlined, size: 12,),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  Widget day(String  dayName, int index){

    return Container(
        height: 31,
        width: 31,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: daysSelected[index]? Color(int.parse("0xFF50c0bb")): Colors.white,
          border: Border.all(color: Color(int.parse("0xFF50c0bb"))),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(dayName, style: TextStyle(
            color:daysSelected[index]? Colors.white: Color(int.parse("0xFF50c0bb")),
          ),),
        ),
      );
  }
}

class DaySettings extends StatefulWidget {
  const DaySettings({Key key}) : super(key: key);

  @override
  _DaySettingsState createState() => _DaySettingsState();
}

class _DaySettingsState extends State<DaySettings> {

  List<bool> daysSelected;

  @override
  void initState() {
    super.initState();
    daysSelected=daysInBool;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
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
          Text("Choose Days"),
          SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectDay('M', 0),
                  selectDay('T', 1),
                  selectDay('W', 2),
                  selectDay('T', 3),
                  selectDay('F', 4),
                  selectDay('S', 5),
                  selectDay('S', 6),
                ],
              ),
              SizedBox(height: 40,),


              Container(
                height: 35,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                    color: Color(int.parse("0xFF50c0bb")),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                  onPressed: (){
                    daysInBool=daysSelected;
                    Navigator.pop(context, daysSelected);
                  },
                  child: Text("CONFIRM", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget selectDay(String  dayName, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          daysSelected[index]= !daysSelected[index];
        });
      },
      child: Container(
        height: 35,
        width: 35,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: daysSelected[index]? Color(int.parse("0xFF50c0bb")): Colors.white,
          border: Border.all(color: Color(int.parse("0xFF50c0bb"))),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(dayName, style: TextStyle(
            color:daysSelected[index]? Colors.white: Color(int.parse("0xFF50c0bb")),
          ),),
        ),
      ),

    );
    
    
  }
}
