
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  //Color bgColor = Colors.lightGreen;
  //int selectedValue;
  DateTime chosenDateTime;

  @override
  Widget build(BuildContext context) {
    return
      CupertinoPageScaffold(
      child: CustomScrollView(
          slivers: <Widget>[
      CupertinoSliverNavigationBar(largeTitle: Text(
          "Second Page",style: TextStyle(fontSize: 30),)),
      SliverFillRemaining(
      child:Container(
        child: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:8.0,bottom: 12,right: 15),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 24),
                    Expanded(
                      child:
                      CupertinoSegmentedControl(
                        children: <int,Widget>{
                          0: Text(
                            "Segment 1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none
                            ),
                          ),
                          1: Text(
                            "Segment 2",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none),
                          ),
                          2: Text(
                            "Segment 3",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none),
                          ),
                        },
                        onValueChanged: (val) {
                          print(val);
                        },
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.white,
                        pressedColor: Colors.blue,
                        padding: EdgeInsets.all(10),

                      ),
                    ),],
                ),),

              Center(
                  child:Container(
                    width: 100,
                    height: 100,
                    child: CupertinoContextMenu(
                      child: Image.asset("assets/1.jpeg",),
                      actions: <Widget>[
                        CupertinoContextMenuAction(
                          child: Text("Action"),
                          onPressed: (){
                           // Navigator.pop(context);
                          },),
                        CupertinoContextMenuAction(
                          child: Text("Delete"),
                          trailingIcon: Icons.delete,
                          onPressed: (){
                           // Navigator.pop(context);
                          },)
                      ],
                    ),
                  )
              ),
                  Center(
                  child: CupertinoButton(
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child:Text("Date"),
                  ),
                  ),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    _showTimePicker(context);
                  },
                  child:Text("Time"),
                ),
              ),
              ],
          ),
        ),
      ),
      ),
     // ),
      ],
          ),
      );
  }
  void _showDatePicker(context) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 400,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        chosenDateTime = val;
                      });
                    }),
              ),
            ],
          ),
        ));
  }
  void _showTimePicker(context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 400,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (value) {
                    }
                ),
              ),
            ],
          ),
        ));
  }
}
