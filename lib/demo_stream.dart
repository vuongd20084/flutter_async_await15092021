import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
class DemoStreamPage extends StatefulWidget {

  @override
  _DemoStreamPageState createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {

  @override
  void didUpdateWidget(covariant DemoStreamPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // var result = Future.delayed(Duration(seconds: 2) , () => 2);
    // Stream<int> stream = Stream.fromFuture(result);
    //
    // stream.listen((data) {
    //   print(data);
    // });

    // Iterable<int> iterable = Iterable.generate(10 , (index) => index + 1);
    //
    // Stream<int> streamIterable = Stream.fromIterable(iterable);
    //
    // streamIterable.listen((event) {
    //   print(event);
    // });

    // Stream<int> stream = Stream.periodic(Duration(seconds: 1) , (value){
    //   return value;
    // });
    //
    // var subscription = stream.listen((event) {
    //   print(event);
    // });
    //
    // Future.delayed(Duration(seconds: 2) ,(){
    //   subscription.pause();
    // });
    //
    // Future.delayed(Duration(seconds: 4) ,(){
    //   subscription.resume();
    // });

    // StreamController<int> data = StreamController();
    //
    //
    // data.sink.add(1);
    // data.sink.add(2);
    // data.sink.add(3);
    // data.sink.add(4);
    //
    //
    // data.stream.listen((event) {
    //   print(event);
    // });



    // stream.transform(StreamTransformer.fromHandlers(handleData: (data , sink){
    //   if (data % 2 == 0){
    //     sink.add(data);
    //   }
    // })).listen((event) {
    //   print(event);
    // });
  }

  Stream handleData(){
    return Stream.periodic(Duration(seconds: 1),(value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Stream"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: handleData(),
          builder: (context , snapshot){
            if (snapshot.hasError){
              return Text("Loi");
            }
            switch(snapshot.connectionState){
              case ConnectionState.none :
                return Text("Not connect stream or null");
              default :
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}