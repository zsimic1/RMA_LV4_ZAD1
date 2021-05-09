import 'package:birds/database/moor_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'database/moor_database.dart';

void main() => runApp(MaterialApp(home: Birds()));

class Birds extends StatefulWidget {
  @override
  _BirdsState createState() => _BirdsState();
}

Color returnColor(String color) {
  if (color == 'blue') {
    return Colors.blue;
  }
  if (color == 'red') {
    return Colors.red;
  }
  if (color == 'green') {
    return Colors.green;
  }
  if (color == 'yellow') {
    return Colors.yellow;
  } else {
    return Colors.white;
  }
}

class _BirdsState extends State<Birds> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birds'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: AppDatabase().watchAllBirdStatuses(),
              builder: (context, AsyncSnapshot<List<Bird>> snapshot) {
                var _i;
                var _color;
                if (snapshot.hasData) {
                  _i = snapshot.data[0].counter;
                  _color = snapshot.data[0].color;
                } else {
                  _i = 0;
                  _color = "white";
                  AppDatabase().createBirdStatus(
                      Bird(id: 0, color: _color, counter: _i));
                }
                return Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: returnColor(_color),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(_i.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await AppDatabase().updateBirdStatus('red');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text('Bird 1')),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () async {
                    await AppDatabase().updateBirdStatus('blue');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue)),
                  child: Text('Bird 2')),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () async {
                    await AppDatabase().updateBirdStatus('green');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text('Bird 3')),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () async {
                    await AppDatabase().updateBirdStatus('yellow');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow)),
                  child: Text('Bird 4')),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppDatabase().resetBirdStatus();
        },
        child: Text('Reset'),
      ),
    );
  }
}
