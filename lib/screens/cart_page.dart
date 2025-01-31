// screens/cart_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:exclusive_fragrance/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:exclusive_fragrance/screens/shop_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    Cart().addListener(_updateCart);
  }

  @override
  void dispose() {
    Cart().removeListener(_updateCart);
    super.dispose();
  }

  void _updateCart() => setState(() {});

  void _navigateToShop() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ShopPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E25),
      appBar: AppBar(
        title: Text('Cart',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E2832),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Cart().items.isEmpty
          ? _buildEmptyCart()
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: Cart().items.length,
              itemBuilder: (context, index) {
                final item = Cart().items[index];
                return _buildCartItem(item, context);
              },
            ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your cart is empty',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToShop,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E2832),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Continue Shopping',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: Color(0xFF1E2832),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.product.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      item.product.price,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.white70),
                    onPressed: () {
                      final oldQuantity = item.quantity;
                      Cart().decreaseQuantity(item.product);
                      if (oldQuantity == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${item.product.name} removed from cart'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    '${item.quantity}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white70),
                    onPressed: () => Cart().increaseQuantity(item.product),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
