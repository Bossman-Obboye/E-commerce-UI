// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final List<String> categories = [
    'All',
    "Shoes",
    "Bags",
    "Shirts",
    "Zippers",
    "Shorts",
    "Slippers",
    "Briefcases",
    "Glasses",
    "Wallets",
    "Jeans"
  ];
  final double columnChildrenSpacing = 0.02;

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile_image.png'),
                ),
                title: Text("Hi Abraham,"),
                trailing: Tooltip(
                  message: "Notifications",
                  child: Icon(Icons.notifications),
                ),
              ),
              SizedBox(
                height: size.height * columnChildrenSpacing,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: size.width * 0.13,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          isDense: true,
                          prefixIcon: const Icon(
                            Icons.search_sharp,
                            size: 28,
                          ),
                          suffixIcon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 28,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: size.width * 0.13,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      size: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * columnChildrenSpacing,
              ),
              Stack(
                children: [
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.black,
                          Color(0xef6a6a6a),
                        ],
                        stops: [0, 0.9],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    top: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BLACK FRIDAY",
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "30% off for all items",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 182, 181, 181),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 15,
                    child: Image(
                      image: const AssetImage("assets/images/Puma_cropped.png"),
                      height: size.height * 0.18,
                      width: size.width * 0.32,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * columnChildrenSpacing,
              ),
              SizedBox(
                height: size.height * 0.045,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.height * 0.02),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: selected == index
                            ? Column(
                                children: [
                                  Text(
                                    categories[index],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 3,
                                  )
                                ],
                              )
                            : Text(
                                categories[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * columnChildrenSpacing,
              ),
              SizedBox(
                height: size.height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return DisplayCard(
                      size: size,
                      img: product['image'],
                      itemName: product['name'],
                      itemPrice: product["price"],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  const Text("Recommended",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                  const Spacer(),
                  const Text("View All"),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.11,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      // height: size.height * 0.11,
                      width: size.width * 0.7,
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(
                              "assets/images/Puma_cropped.png",
                            ),
                            width: size.width * 0.17,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Luxuy Shoe",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "\$45.00",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayCard extends StatefulWidget {
  const DisplayCard({
    super.key,
    required this.size,
    required this.img,
    required this.itemName,
    required this.itemPrice,
  });

  final Size size;

  final String img;
  final String itemName;
  final double itemPrice;

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  final double columnChildrenSpacing = 0.02;
  bool myFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Stack(
              children: [
                Container(
                  height: widget.size.height * 0.21,
                  width: widget.size.width * 0.4,
                  decoration: BoxDecoration(
                    color: const Color(0xeff8f8f8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: const Alignment(1, -1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          myFavourite = !myFavourite;
                        });
                      },
                      icon: myFavourite
                          ? const Icon(
                              Icons.favorite,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 20,
                            ),
                    ),
                  ),
                ),
                Positioned(
                  height: widget.size.height * 0.145,
                  left: 25,
                  bottom: 10,
                  child: Image(
                    image: AssetImage(widget.img),
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.itemName,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          Text(
            "\$${widget.itemPrice}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/luxury_shoe.png',
    'name': "Luxury Shoe",
    'price': 45.0,
  },
  {
    'image': 'assets/images/bluebag-removebg-preview.png',
    'name': "Gucci Bag",
    'price': 58.0,
  },
  {
    'image': 'assets/images/Puma_cropped.png',
    'name': "Puma Snicker",
    'price': 98.0,
  },
  {
    'image': 'assets/images/leatherbag.png',
    'name': "Leather bag",
    'price': 135.0,
  },
  {
    'image': 'assets/images/handbag.png',
    'name': "Ladies Bag",
    'price': 25.0,
  },
  {
    'image': 'assets/images/Snicker.png',
    'name': "Snicker",
    'price': 30.0,
  },
  {
    'image': 'assets/images/white_snicker.png',
    'name': "White Snicker",
    'price': 78.0,
  },
];
