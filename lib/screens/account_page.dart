import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:exclusive_fragrance/screens/login_and_register.dart';
import 'package:exclusive_fragrance/utils/handle_user_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
   const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        Uri.parse('https://your-api-endpoint.com/user/info'),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token')}', // if you use token
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user info: $e');
      // Optional: Show fallback or error UI
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E25),
      appBar: AppBar(
        title: Text('My Account',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF151E25),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : userData == null
              ? Center(child: Text('Failed to load user info', style: TextStyle(color: Colors.white)))
              : ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildAccountSection(),
                    SizedBox(height: 16),
                    _buildShippingInfo(),
                    SizedBox(height: 16),
                    _buildOrderHistory(),
                    SizedBox(height: 24),
                    _buildLogoutButton(context),
                  ],
                ),
    );
  }

  Widget _buildAccountSection() {
    return Card(
      color: Color(0xFF1E2832),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Divider(color: Colors.white24),
            _buildInfoRow('Name', userData!['name']),
            _buildInfoRow('Email', userData!['email']),
            _buildInfoRow('Phone', userData!['phone'] ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Card(
      color: Color(0xFF1E2832),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipping Address',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Divider(color: Colors.white24),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(userData!['shipping_address'] ?? 'No address found',
                  style: TextStyle(color: Colors.white70)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Edit Address',
                    style: TextStyle(color: Color(0xFF00C4FF))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHistory() {
    List orders = userData!['orders'] ?? [];

    return Card(
      color: Color(0xFF1E2832),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order History',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Divider(color: Colors.white24),
            ...orders.map<Widget>((order) => _buildOrderItem(order)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order ${order['order_id']}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              Text(order['status'],
                  style: TextStyle(
                    color: order['status'] == 'Delivered'
                        ? Colors.green
                        : Colors.amber,
                  )),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(order['date'], style: TextStyle(color: Colors.white70)),
              Text('Rs ${order['total'].toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 4),
          Text(
            (order['items'] as List<dynamic>).join(', '),
            style: TextStyle(color: Colors.white70, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2A3440),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Color(0xFF1E2832),
              title: Text('Log Out', style: TextStyle(color: Colors.white)),
              content: Text('Are you sure you want to log out?',
                  style: TextStyle(color: Colors.white70)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      Text('Cancel', style: TextStyle(color: Colors.white70)),
                ),
                TextButton(
                  onPressed: () {
                    HandleUserLogin.logout();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => LoginRegisterScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text('Log Out', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
        child:
            Text('Log Out', style: TextStyle(color: Colors.red, fontSize: 16)),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('$title: ',
              style: TextStyle(color: Colors.white70, fontSize: 16)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}