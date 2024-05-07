// import 'package:ecomerce/main_page.dart';
// import 'dart:ffi';
// import 'dart:ui';

import 'dart:convert';

import 'package:ecomerce/details_screen.dart';
import 'package:ecomerce/widgets_folder/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
  final double columnChildrenSpacing = 0.017;
  List<int> likedDisProduct = [];
  List<int> likedRecProduct = [];
  List _items = [];

  Future<void> readFromJson() async {
    final String response =
        await rootBundle.loadString('assets/data/products.json');

    final data = await jsonDecode(response);

    setState(() {
      _items = data['items'];
    });
  }

  @override
  void initState() {
    super.initState();
    readFromJson();
  }

  int selected = 0;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
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
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              itemDescription: _items[2]['description'],
                              itemImage: _items[2]['image'],
                              itemName: _items[2]['name'],
                              itemPrice: _items[2]['price'].toStringAsFixed(2),
                            ))),
                child: Stack(
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
                        image:
                            const AssetImage("assets/images/Puma_cropped.png"),
                        height: size.height * 0.18,
                        width: size.width * 0.32,
                      ),
                    ),
                  ],
                ),
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
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      itemDescription: item['description'],
                                      itemImage: item['image'],
                                      itemName: item['name'],
                                      itemPrice:
                                          item["price"].toStringAsFixed(2),
                                    )));
                      },
                      child: DisplayCard(
                        size: size,
                        img: item['image'],
                        itemName: item['name'],
                        itemPrice: item["price"],
                      ),
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
                height: size.height * 0.1,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      bool liked = likedRecProduct.contains(index);
                      return RecomCard(
                        size: size,
                        image: product['image'],
                        name: product['name'],
                        price: product['price'],
                        like: IconButton(
                          onPressed: () {
                            setState(() {
                              liked
                                  ? likedRecProduct.remove(index)
                                  : likedRecProduct.add(index);
                            });
                          },
                          icon: Icon(
                              liked ? Icons.favorite : Icons.favorite_outline),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: size.width * 0.04,
                      );
                    },
                    itemCount: products.length),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class WideWidthDisplayCardFavouriteIcon extends StatefulWidget {
  const WideWidthDisplayCardFavouriteIcon({
    super.key,
  });

  @override
  State<WideWidthDisplayCardFavouriteIcon> createState() =>
      _WideWidthDisplayCardFavouriteIconState();
}

class _WideWidthDisplayCardFavouriteIconState
    extends State<WideWidthDisplayCardFavouriteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.favorite, size: 20),
        // : const Icon(Icons.favorite_outline, size: 20),
        onPressed: () {
          setState(() {
            // myFavourite == !myFavourite;
          });
        });
  }
}

class RecomCard extends StatefulWidget {
  const RecomCard(
      {super.key,
      required this.size,
      required this.image,
      required this.name,
      required this.price,
      required this.like});
  final Size size;
  final String image;
  final String name;
  final double price;
  final IconButton like;

  @override
  State<RecomCard> createState() => _RecomCardState();
}

class _RecomCardState extends State<RecomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              widget.image,
            ),
          ),
          SizedBox(
            width: widget.size.width * 0.19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  '${widget.price}',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          widget.like
        ],
      ),
    );
  }
}
