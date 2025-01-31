// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:exclusive_fragrance/model/products.dart';
import 'package:exclusive_fragrance/screens/product_detail.dart';
import 'package:exclusive_fragrance/widgets/search-bar.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> bestSellerProducts = [];

  @override
  void initState() {
    super.initState();
    loadBestSellers();
  }

  void loadBestSellers() {
    setState(() {
      bestSellerProducts =
          products.where((product) => product.isBestSeller).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151E25),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Header
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Search
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 16),
                        Expanded(child: SearchProductBar()),
                        SizedBox(width: 16),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: const Color(0xFFF5D57A),
              child: Text(
                '20% OFF on Your First Purchase - Use Code EF20%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF151E25),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Hero Image and Text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/hero_image.png',
                      width: isLandscape ? screenWidth * 0.8 : null,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'OUR ',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Amarante',
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'PREMIUM ',
                          style: TextStyle(
                              fontSize: 24,
                              color: const Color(0xFFF5D57A),
                              fontFamily: 'Amarante',
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: 'COLLECTION',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Amarante',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            // Best Sellers Grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bestSellerProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 4 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isLandscape ? 0.6 : 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = bestSellerProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
