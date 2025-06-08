class Product {
  final String id;
  final String name;
  final String price;
  final bool isBestSeller;
  final String category;
  final List<String> sizes;
  final String description;
  final double rating;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.isBestSeller,
    required this.category,
    required this.sizes,
    required this.description,
    required this.rating,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String baseUrl = 'http://13.60.243.207/storage/';
    String? imagePath = json['featured_img'];
    // If your image is inside the category object, adjust accordingly:
    if ((imagePath == null || imagePath.isEmpty) && json['category'] is Map && json['category']['featured_img'] != null) {
      imagePath = json['category']['featured_img'];
    }
    return Product(
      id: json['id'].toString(),
      name: json['product_name'] ?? '',
      price: (json['sale_price'] ?? json['original_price'] ?? '').toString(),
      isBestSeller: json['Bestseller'] == true,
      category: json['category'] is Map
          ? (json['category']['category_name'] ?? '')
          : (json['category'] ?? ''),
      sizes: json['size'] != null
          ? json['size'].toString().split(',').map((s) => s.trim()).toList()
          : [],
      description: json['product_desc'] ?? '',
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : 0.0,
      image: imagePath != null && imagePath.startsWith('http')
        ? imagePath
        : baseUrl + (imagePath ?? ''), // Adjust if your API provides an image field
    );
  }
}