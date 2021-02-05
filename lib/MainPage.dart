//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino/FirstPage.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  int selectedValue;
  bool switchState = false;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    double _progress = 0.0;
    int _slide = 0;

    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              // ignore: deprecated_member_use
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              // ignore: deprecated_member_use
              title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              // ignore: deprecated_member_use
              title: Text("User Info"))
        ],),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                trailing: Material(
                  child: IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainPage()));
                      //Navigator.pop(context);
                    },
                  ),
                ),
                middle: Text("Main Page"),
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 12,right: 15),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 24),
                          Expanded(
                            child: CupertinoSlidingSegmentedControl(
                              children: <int, Widget>{
                                0: Text(
                                  "Section 1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                                1: Text(
                                  "Section 2",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none),
                                ),
                                2: Text(
                                  "Section 3",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none),
                                ),
                              },
                              groupValue: _slide,
                              backgroundColor: Colors.blue.shade200,
                              onValueChanged: (val) {
                                setState(() {
                                  print(val);
                                  _slide = val;
                                });
                              },

                              padding: EdgeInsets.all(10),

                            ),),
                        ],),),
                    Container(
                      child: Material(
                        child: MergeSemantics(
                          child: ListTile(
                            title: Text("Slider"),
                            trailing:CupertinoSlider(
                                    value: _progress,
                                    min: 0.0,
                                    max: 100.0,
                                    onChanged: (value) {
                                      setState(() {
                                        _progress = value.roundToDouble();
                                      });
                                    },
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        child: MergeSemantics(
                          child: ListTile(
                            title: Text("Switch"),
                            trailing: CupertinoSwitch(
                              value: switchState,
                               onChanged: (bool value) {
                                setState(() {
                                    switchState = value;
                                });
                                //print(value);
                              },
                            ),
                            ),
                          ),
                        ),
                      ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CupertinoTextField(
                          controller: _textController,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 60),
                      child: RaisedButton(
                        child: Text("Click me"),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoPopupSurface(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Hello",
                                      style: TextStyle(
                                          fontSize: 35, color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AddEntryDialog()));
                          _openAddEntryDialog(context);
                        },
                        child: Text("Screen"),
                      ),
                    ),
                    Center(
                      child: CupertinoButton(
                        padding: EdgeInsets.all(8),
                        // color:bgColor,
                        onPressed: () {
                          final action = CupertinoActionSheet(
                            title: Text("Select Action",
                              style: TextStyle(fontSize: 25),
                            ),
                            message: Text("Which action? ",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            actions: <Widget>[
                              CupertinoActionSheetAction(
                                child: Text("Action 1",style: TextStyle(color: Colors.blue),),
                                isDefaultAction: true,
                                onPressed: () {
                                  _alertDialog();
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text("Action 2",style: TextStyle(color: Colors.blue),),
                                isDestructiveAction: true,
                                onPressed: () {
                                   _showDialog(context);

                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text("Action 3",style: TextStyle(color: Colors.blue),),
                                isDestructiveAction: true,
                                onPressed: () {
                                  cupPicker();

                                },
                              )
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                // Navigator.pop(context);
                              },
                            )
                          );
                          showCupertinoModalPopup(
                              context: context, builder: (context) => action);
                        },
                        child: Text("Click Here"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _openAddEntryDialog(context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return  MainPage();
        },
        fullscreenDialog: true
    ),
    );
  }

  void cupPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child:CupertinoPicker(
              backgroundColor: Colors.white,
              magnification: 1.5,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemExtent: 40.0,
              children: const [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
              ],
            ),);
        });
  }
  Future<void> _alertDialog() async{
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title:Text("Allow to access next page"),
            content: Text("You are currently disable to access next page"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Don\'t Allow"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text("Allow"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
}
Future<void> _showDialog(context) async{
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return
          CupertinoAlertDialog(
          title:Text("Show Dialog"),
          actions: <Widget>[
            Container(
            decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(10.0)),

          ),
          // height: 30,
          // width: 50,
              child: CupertinoButton(
                child: Text("Dialog"),
                onPressed: (){
                  Navigator.pop(context);
                },
            ),
            ),
          ],
        );
           /// ],
         // );
      }
  );
}
//}

// void _showDialog(context){
//   CupertinoAlertDialog(
//       context: context,
//       builder: (_)=> Container(
//         alignment: Alignment.center,
//         child:Container(
//           decoration: BoxDecoration(
//             color:Colors.white,
//             borderRadius: BorderRadius.all( Radius.circular(10.0)),
//           ),
//           height: 70,
//           width: 150,
//           child: CupertinoButton(
//             child: Text("Dialog"),
//             onPressed: (){
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       )
//   );
// }