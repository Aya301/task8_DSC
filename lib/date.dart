import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Time extends StatefulWidget {
  const Time({Key key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  DateTime _dataTime ;
  //var d;
  TimeOfDay time ;
  TimeOfDay picked;
  @override
  void initState(){
    super.initState();
    time = TimeOfDay.now();
    _dataTime = DateTime.now();
  }
  Future<Null>selectTime(BuildContext context)async{
    picked = await showTimePicker(
        context: context,
        initialTime: time);
    if(picked != null){
      setState(() {
        time = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        toolbarHeight: 60,
        title: Text('Time & Data'),
      ),
      body: Center(
        child: Expanded(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_dataTime == null?
                  'Nothing has been picked yet':_dataTime.toString().substring(0,11) ,
                  ),
                  Text(time == null?'Time':time.toString()),
                  InkWell(
                    child:RaisedButton(
                      child:Text('Choose new Date & Time',
                        style: TextStyle(color: Colors.white),),
                    color: Colors.deepOrangeAccent,
                    ),
                    splashColor: Colors.grey,
                    onTap: (){
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Locate',
                                style: TextStyle(fontSize: 25,color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.bold),),
                              content: Container(
                                  height: 100,
                                  width: 250,
                                  child: Column(
                                      children:[
                                        Row(
                                            children: [
                                              Padding(padding: EdgeInsets.only(left: 8)),
                                              Column(
                                                  children:[
                                                    IconButton(
                                                        icon: Icon(Icons.calendar_today,),
                                                        onPressed: (){
                                                          showDatePicker(context: context,
                                                              initialDate: _dataTime == null?DateTime.now():
                                                              _dataTime,
                                                              firstDate: DateTime(1980),
                                                              lastDate: DateTime(2030)
                                                          ).then((date){
                                                            setState(() {
                                                              _dataTime = date;

                                                            }
                                                            );
                                                          });
                                                        }
                                                    ),
                                                    Text('Calendar ',
                                                      style: TextStyle(fontSize: 20),),
                                                    Text('${_dataTime.year}/${_dataTime.month}/${_dataTime.day}',
                                                      style: TextStyle(fontSize: 15),)
                                                  ]
                                              ),
                                              Padding(padding: EdgeInsets.only(left: 70)),
                                              Column(
                                                  children:[
                                                    IconButton(
                                                        icon: Icon(Icons.alarm,),
                                                        onPressed: (){
                                                          selectTime(context);
                                                          print(time.toString());
                                                        }),
                                                    Text('Time',
                                                      style: TextStyle(fontSize: 20),),
                                                    Text('${time.hour}:${time.minute}',
                                                      style: TextStyle(fontSize: 15),)
                                                  ]
                                              )

                                            ]
                                        ),

                                      ]
                                  )
                              ),
                              actions: [
                                InkWell(
                                  child:FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      final bar =SnackBar(
                                          content: Expanded(
                                            child: Row(
                                            children: [
                                              Icon(Icons.calendar_today,color: Colors.white),
                                              Text(' ${_dataTime.toString().substring(0,11)}',
                                                style: TextStyle(fontSize: 12),),
                                              Padding(padding: EdgeInsets.only(left: 20)),
                                              Icon(Icons.alarm,color: Colors.white),
                                              Text(' ${time.toString()}',
                                                  style: TextStyle(fontSize: 12),),
                                            ],),
                                          ),
                                        action: SnackBarAction(
                                          label: 'OK',
                                          onPressed: (){},
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(bar);
                                    },
                                    child: Text('OK',
                                      style: TextStyle(color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold,fontSize: 15),),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (context) => Time()));
                                  },
                                  child: Text('Cancel',
                                    style: TextStyle(color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,fontSize: 15),),),
                              ],
                            );
                          }
                      );
                    },
                  ),
                ]
            )
        ),
      ),
      backgroundColor: Colors.deepOrange.shade50,
    );
  }
}