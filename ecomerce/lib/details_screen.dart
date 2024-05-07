import 'package:ecomerce/home.dart';
import 'package:ecomerce/widgets_folder/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final String itemDescription;

  const DetailsScreen({
    super.key,
    required this.itemDescription,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? valueChoosen;

  final double columnChildrenSpacing = 0.017;
  List<int> likedDisProduct = [];
  List<int> likedRecProduct = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.search,
                    size: 28,
                  ),
                  const Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                color: const Color.fromARGB(255, 245, 244, 242),
                height: size.height * 0.43,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * 0.37,
                      width: size.width,
                      child: Image(image: AssetImage(widget.itemImage)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(size.width * 0.02),
                          height: size.height * 0.06,
                          width: size.width * 0.39,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(fontSize: 18.5),
                              ),
                              Icon(Icons.expand_more, size: 28)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(size.width * 0.02),
                          height: size.height * 0.06,
                          width: size.width * 0.36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Color",
                                style: TextStyle(fontSize: 18.5),
                              ),
                              Icon(Icons.expand_more, size: 28)
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(size.width * 0.02),
                            height: size.height * 0.06,
                            width: size.width * 0.12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(Icons.favorite, size: 28)),

                        // DropdownButton<String>(
                        //     borderRadius: BorderRadius.circular(8),
                        //     value: valueChoosen,
                        //     items: List.generate(
                        //       items.length,
                        //       (index) => DropdownMenuItem(
                        //         value: items[index],
                        //         child: Text(
                        //           items[index],
                        //         ),
                        //       ),
                        //     ).toList(),
                        //     onChanged: (newValue) {
                        //       setState(() => valueChoosen = newValue);
                        //     })
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemName,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18,
                          ),
                          const Icon(Icons.star, size: 18),
                          const Icon(Icons.star, size: 18),
                          const Icon(Icons.star, size: 18),
                          Icon(Icons.star_border_outlined,
                              size: 18, color: Colors.grey.withOpacity(0.5)),
                          SizedBox(width: size.width * 0.05),
                          const Text(
                            "(999)",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.itemPrice,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.115,
                child: Text(
                  widget.itemDescription,
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
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(160, 50)),
                          elevation: const MaterialStatePropertyAll(0.3),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 245, 244, 242))),
                      child: const Text("Add to cart",
                          style: TextStyle(fontSize: 18, color: Colors.black))),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          fixedSize: const MaterialStatePropertyAll(
                            Size(160, 50),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                      child: const Text("Buy now",
                          style: TextStyle(fontSize: 18, color: Colors.white))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
