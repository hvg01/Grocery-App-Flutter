import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home.dart';

class StartDate extends StatefulWidget {
  const StartDate({Key key}) : super(key: key);

  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {

  DateTime selectedStartDate= DateTime.now();

  @override
  Widget build(BuildContext context) {

    void startDateSelectionPanel() async{
      dynamic updatedDate= await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context){
            return StartDatePanel();

          }
      );

      setState(() {
        selectedStartDate= updatedDate;
        HomePageData.date = updatedDate.toString().substring(0,10);
      });
    }

    return GestureDetector(
      onTap: ()=> startDateSelectionPanel(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        height: 100,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.calendar_today_outlined),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        Text("Start Date",),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 25,),
                        Text("${selectedStartDate.toString().substring(0,10)}", style: TextStyle(
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

class StartDatePanel extends StatefulWidget {
  const StartDatePanel({Key key}) : super(key: key);

  @override
  _StartDatePanelState createState() => _StartDatePanelState();
}

class _StartDatePanelState extends State<StartDatePanel> {

  DateTime _selectedDay;
  DateTime _focusedDay= DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
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
          SizedBox(height: 15,),
          Text("Choose Starting Date"),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2021),
            lastDay: DateTime.utc(2022),

            selectedDayPredicate: (day){
              return isSameDay(_selectedDay, day);
            },
              onDaySelected: (selectedDay, focusedDay){
                setState(() {
                  _selectedDay=selectedDay;
                  _focusedDay=focusedDay;
                });
                Future.delayed(Duration(milliseconds: 400), (){
                  Navigator.pop(context, selectedDay);
                });
              },

          ),
        ],

      ),
    );
  }
}

