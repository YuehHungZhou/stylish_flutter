import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stylish_flutter/network/ApiServise.dart';
import 'bloc/post_bloc_state.dart';
import 'bloc/post_cubit.dart';
import 'network/GetProductResponse.dart';
import 'r.dart';

import 'color_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ColorProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (BuildContext context) => PostCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

//////////////////////////// Product Page ////////////////////////////////

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.randomNumber');

  Future<int> _generateRandomNumber() async {
    try {
      final randomNumber =
          await platform.invokeMethod<int>('generateRandomNumber');
      print('Random number generated on Android: $randomNumber');
      return randomNumber ?? 0;
    } on PlatformException catch (e) {
      print('Failed to generate random number: ${e.message}');
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().fetchData();
  }

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
        actions: [
          IconButton(
            onPressed: () async {
              final randomNumber = await _generateRandomNumber();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        toolbarHeight: 80,
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
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, IPostState>(
      builder: (_, state) {
        if (state is PostSuccess) {
          final screenWidth = MediaQuery.of(context).size.width;
          if (screenWidth > 600) {
            return Expanded(
              child: Container(
                color: Colors.white,
                child: Row(children: [
                  _verticalList([state.postList[0]]),
                  _verticalList([state.postList[1]]),
                  _verticalList([state.postList[2]]),
                ]),
              ),
            );
          } else {
            // 螢幕寬度小於等於 900
            return _verticalList(state.postList);
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Expanded _verticalList(List<GetProductResponse> listData) {
  return Expanded(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(
        listData.length,
        (i) => ProducrList(data: listData[i]),
      ),
    ),
  );
}

class ProducrList extends StatelessWidget {
  final GetProductResponse data;

  const ProducrList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data.data[0].category),
        for (var i = 0; i < data.data.length; i++)
          ProductWidget(product: data.data[i]),
      ],
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    super.key,
    required this.product,
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
                  child:
                      Image.network(product.mainImage, fit: BoxFit.fitHeight)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(product.title),
                  Text("NT${product.price}")
                ],
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                child: Image.asset(R.assetsImgAnia, fit: BoxFit.fitHeight),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [Text('服飾的顏色'), ColorSelection()],
                    ),
                    Row(
                      children: [
                        Text('服飾的尺寸'),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('S'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('M'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('L'),
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('加入購物車'), QuantitySelector()],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  color: Colors.red,
                  child: Center(
                    child: Text('C1'),
                  ),
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                  child: Center(
                    child: Text('C2'),
                  ),
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                  child: Center(
                    child: Text('C3'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSelection extends StatefulWidget {
  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildColorSelection(Colors.red),
        _buildColorSelection(Colors.blue),
        _buildColorSelection(Colors.green),
      ],
    );
  }

  Widget _buildColorSelection(MaterialColor color) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider, child) {
        final bool isSelected = color == colorProvider.color;

        return InkWell(
          onTap: () {
            colorProvider.changeColor(color); // 更新選中的顏色
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              border: isSelected
                  ? Border.all(
                      color: Colors.black,
                      width: 3.0,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      if (_quantity < 100) {
        _quantity++;
      }
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrementQuantity,
        ),
        Text('$_quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _incrementQuantity,
        ),
      ],
    );
  }
}
