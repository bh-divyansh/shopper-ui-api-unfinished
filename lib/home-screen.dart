import 'package:flutter/material.dart';
import 'package:shopper_ui/constants/constants.dart';
import 'package:shopper_ui/services/api_helper.dart';
import 'widgets/displayer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiHelper = ApiHelper();
  String productName = 'Not Available';
  @override
  void initState() {
    apiHelper.getAllProducts().then(
      (response) {
        // print('this is response status = ${response.statusCode}'); //Problem was showing to avoid print calls in production
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          // List<ProductResponse> data = (response.body.toString() as List)
          //     .map((product) => ProductResponse.fromJson(product))
          //     .toList();
          // setState(() {
          //   productName = data[0].name!;
          // });
          // print('we have data = ${response.body}');
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0, bottom: 10),
            child: Text(
              'Women',
              style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisExtent: MediaQuery.of(context).size.height * 28 / 100,
                // childAspectRatio: 0.79,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Displayer(
                  dispColor: clrBag4,
                  name: productName,
                  price: 'price',
                  bag_no: 5,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
