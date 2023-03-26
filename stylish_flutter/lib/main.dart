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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 200,
              child: _horizontalList(8),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _verticalList(8),
                ])
          ],
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
          height: 200,
          alignment: Alignment.center,
          child: Image.asset(
            R.assetsImgAnia,
            fit: BoxFit.fitHeight,
          )),
    ),
  );
}

ListView _verticalList(int n) {
  return ListView(
    scrollDirection: Axis.vertical,
    children: List.generate(
      n,
      (i) => Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Image.asset(
            R.assetsImgAnia,
          )),
    ),
  );
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
