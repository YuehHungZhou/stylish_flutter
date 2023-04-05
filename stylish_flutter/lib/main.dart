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

//////////////////////////// Product Page ////////////////////////////////

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
              ProductView()
            ],
          ),
        ));
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return Expanded(
        child: Container(
          color: Colors.blue,
          child: Row(children: [
            _verticalList(1),
            _verticalList(1),
            _verticalList(1),
          ]),
        ),
      );
    } else {
      // 螢幕寬度小於等於 900
      return _verticalList(3);
    }
  }
}

Expanded _verticalList(int n) {
  return Expanded(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(
        n,
        (i) => ProducrList(),
      ),
    ),
  );
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const DetailPage(title: 'Flutter Demo Detail Page'),
          ),
        );
      },
      child: Container(
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
          )),
    );
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

//////////////////////////// Detail Page ////////////////////////////////

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});

  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                  width: 100,
                  height: 100,
                  child: Image.asset(R.assetsImgAnia, fit: BoxFit.fitHeight)),
            ],
          ),
        ));
  }
}
