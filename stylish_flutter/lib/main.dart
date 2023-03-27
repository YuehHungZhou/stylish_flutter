import 'package:flutter/material.dart';
import 'r.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            R.assetsImgImageStylish,
            fit: BoxFit.fill,
            width: 250,
            height: 40,
          ),
          toolbarHeight: 80,
          backgroundColor: Color(0xF1F4F8FF),
        ),
        body: Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 200,
                child: _horizontalList(8),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        width: 300,
                        child: _verticalList(3),
                      ),
                    ),

                    // Container(
                    //   color: Colors.white,
                    //   width: 300,
                    //   child: _verticalList(8),
                    // ),
                    // Container(
                    //   color: Colors.green,
                    //   width: 300,
                    //   child: _verticalList(8),
                    // ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}

ListView _horizontalList(int n) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: List.generate(
      n,
      (i) => Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Image.asset(
            R.assetsImgAnia,
            fit: BoxFit.fitHeight,
          )),
    ),
  );
}

Column _verticalList(int n) {
  return Column(mainAxisSize: MainAxisSize.max, children: [
    Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          n,
          (i) => ProducrList(),
        ),
      ),
    )
  ]);
}

class ProducrList extends StatelessWidget {
  const ProducrList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("123123"),
        for (var i = 0; i < 10; i++) Product(),
      ],
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.red,
        height: 100,
        child: Row(
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(R.assetsImgAnia, fit: BoxFit.fitHeight)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('aaa'), Text('bbb'), Text('ccc')],
            )
          ],
        ));
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(
            R.assetsImgAnia,
            fit: BoxFit.fill,
            width: 250,
            height: 100,
          ),
        );
      },
    );
  }
}
