import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DemoAsynchronous extends StatefulWidget {

  @override
  _DemoAsynchronousState createState() => _DemoAsynchronousState();
}

class _DemoAsynchronousState extends State<DemoAsynchronous> {

  @override
  void didUpdateWidget(covariant DemoAsynchronous oldWidget) {
    super.didUpdateWidget(oldWidget);

  }

  Future<int> getRandom(){
    return Future.delayed(Duration(seconds: 2) , (){
      Completer<int> completer = new Completer();
      var number = Random().nextInt(10);
      if (number % 2 == 0){
        completer.complete(number);
      }else{
        completer.completeError("Loi do so le");
      }
      return completer.future;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo asynchronous"),
      ),
      body: Container(
        child: FutureBuilder<int>(
          future: getRandom(),
          builder: (context , snapshot){
            if (snapshot.hasData){
              return Text(snapshot.data.toString());
            }else if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              return CircularProgressIndicator(
                color: Colors.blue,
              );
            }
          },
        ),
      ),
    );
  }
}