import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // pass obj nuild from class constructor
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // class constructor of MyApp

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Noodle Products")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
                name: "Nissin Cup Noodles Tomyum Shrimp Creampy Flavour",
                description:
                    "Once you taste a strong and original flavour of Tom Yum from NISSIN Cup Tom Yum Krob Kreung Flavour, you are definitely going to fall in love and crave for more.",
                price: 15,
                image: "assets/appimages/cup1.png"),
            ProductBox(
                name: "Nissin Cup Noodles Minced Pork Flavour",
                description:
                    "A helper when hungry, easy to pick up and eat. Just add hot water and concentrated pork minced seasoning. Fragrant smell of garlic, pepper, hot, delicious, so satisfying that I don't want to tell anyone.",
                price: 20,
                image: "assets/appimages/cup2.png"),
            ProductBox(
                name: "Nissin Cup Noodles Moo Manao Flavour",
                description:
                    "The selection of tasty popular flavors in Thailand. A flavorful taste of soup lead with sour and a little spicy. A Thai-style thin and soft noodle. An all-time favorite choice recommended by Thai Snack Online. No Preservative.",
                price: 25,
                image: "assets/appimages/cup3.png"),
            ProductBox(
                name: "Mama Instant Cup Noodle with Seafood Flavor",
                description:
                    "Spicy stir-fried kee mao flavor, up to 2 times more.",
                price: 25,
                image:
                    "https://m.media-amazon.com/images/I/81TtQMeVGSL._AC_SX425_.jpg"),
            ProductBox(
                name: "Mama Cup Flavor Yentafo Tom Yum Hot Pot",
                description:
                    "Fragrant aroma of Tom Yum and sweetness of Yen Ta Fo water.",
                price: 25,
                image:
                    "https://i.ebayimg.com/images/g/tA8AAOSwm85jzLmc/s-l1200.jpg"),
            ProductBox(
                name: "Mama Cup clear rice noodles 50 grams",
                description:
                    "Soft and chewy rice noodles, Suitable for customers who like to eat food that is not spicy.",
                price: 25,
                image:
                    "https://m.media-amazon.com/images/I/810wak9C41L._AC_UF1000,1000_QL80_.jpg"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              if (image.startsWith("http")) // Check if image is loaded from URL
                Image.network(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              if (!image.startsWith(
                  "http")) // If not loaded from URL, assume it's an asset
                Image.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
