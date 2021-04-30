import 'package:birds/database/moor_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MaterialApp(home: Birds()));

class Birds extends StatefulWidget {
  @override
  _BirdsState createState() => _BirdsState();
}

int i = 0;
Color returnColor (String color)
{
  if(color=='blue')
    {
      return Colors.blue;
    }
  if(color=='red')
  {
    return Colors.red;
  }
  if(color=='green')
  {
    return Colors.green;
  }
  if(color=='yellow')
  {
    return Colors.yellow;
  }
}
class _BirdsState extends State<Birds> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birds'),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: AppDatabase().watchAllBirdStatuses(),
        builder: (context, AsyncSnapshot<List<Bird>> snapshot)
          {
            if(!snapshot.hasData){
                i=0;
                AppDatabase().createBirdStatus(Bird(color: Colors.white.toString(), counter: 0));
            }
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        labelText: "1",enabled:false,fillColor: returnColor(snapshot.data[0].color) , filled: true),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              i++;
                              AppDatabase().updateBirdStatus(Bird(id: 0, color:'red', counter: i ));
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                          child: Text('Bird 1')),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              i++;
                              AppDatabase().updateBirdStatus(Bird(id: 0, color:'blue', counter: i ));
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                          child: Text('Bird 2')),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              i++;
                              AppDatabase().updateBirdStatus(Bird(id: 0, color:'green', counter: i ));
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                          child: Text('Bird 3')),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              i++;
                              AppDatabase().updateBirdStatus(Bird(id: 0, color:'yellow', counter: i ));
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow)),
                          child: Text('Bird 4')),
                    ],
                  )
                ],
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i=0;
            AppDatabase().updateBirdStatus(Bird(id: 0, color:'white', counter: i ));
          });

        },
        child: Text('Reset'),
      ),
    );
  }
}
