class Product {
  final String id;
  final String image;
  final String name;
  final String price;
  final bool isBestSeller;
  final String category; // Either "Men", "Women", or "Unisex"
  final List<String> sizes;
  final String description; // Added description
  final double rating; // Added rating (e.g., 4.5)

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.isBestSeller,
    required this.category,
    required this.sizes,
    required this.description,
    required this.rating,
  });
}

final List<Product> products = [
  Product(
    id: '1',
    image: "assets/images/products/Chanel_No_5_Eau_de_Parfum.png",
    name: "CHANEL NO. 5 EAU DE PARFUM",
    price: "Rs 54,589.00",
    isBestSeller: true,
    category: "Women",
    sizes: ["50ml", "100ml"],
    description:
        "A timeless floral-aldehydic fragrance, Chanel No. 5 is a symbol of femininity and elegance. With notes of jasmine, rose, and vanilla, it's a classic choice for any occasion.",
    rating: 4.7,
  ),
  Product(
    id: '2',
    image: "assets/images/products/Dior_Jadore.png",
    name: "DIOR J'ADORE",
    price: "Rs 48,000.00",
    isBestSeller: true,
    category: "Women",
    sizes: ["30ml", "50ml", "100ml"],
    description:
        "A luxurious floral fragrance, Dior J'adore captures the essence of femininity with its blend of ylang-ylang, rose, and jasmine. Perfect for the modern woman.",
    rating: 4.5,
  ),
  Product(
    id: '3',
    image: "assets/images/products/sauvage.png",
    name: "SAUVAGE EAU DE PARFUM",
    price: "Rs 65,000.00",
    isBestSeller: true,
    category: "Men",
    sizes: ["60ml", "100ml"],
    description:
        "A bold and fresh fragrance, Sauvage by Dior is inspired by the open sky and rugged landscapes. With notes of bergamot and ambroxan, it's a modern classic for men.",
    rating: 4.8,
  ),
  Product(
    id: '4',
    image: "assets/images/products/blue_de_chanel.png",
    name: "BLUE DE CHANEL",
    price: "Rs 45,000.00",
    isBestSeller: true,
    category: "Men",
    sizes: ["50ml", "100ml"],
    description:
        "A woody aromatic fragrance, Bleu de Chanel is a versatile scent for the confident man. With notes of citrus, cedar, and sandalwood, it's perfect for any occasion.",
    rating: 4.6,
  ),
  Product(
    id: '5',
    image: "assets/images/products/Tom_Ford_Oud_Wood_Eau_De_Parfum.png",
    name: "TOM FORD OUD WOOD",
    price: "Rs 70,000.00",
    isBestSeller: false,
    category: "Men",
    sizes: ["50ml", "100ml"],
    description:
        "A rich and exotic fragrance, Tom Ford Oud Wood combines rare oud wood with spices and amber. It's a luxurious scent for the sophisticated man.",
    rating: 4.9,
  ),
  Product(
    id: '6',
    image: "assets/images/products/black_opium.png",
    name: "YVES SAINT LAURENT BLACK OPIUM",
    price: "Rs 58,000.00",
    isBestSeller: false,
    category: "Women",
    sizes: ["30ml", "50ml", "100ml"],
    description:
        "A bold and addictive fragrance, Black Opium by YSL is a modern take on the classic oriental scent. With notes of coffee and vanilla, it's perfect for night-time glamour.",
    rating: 4.3,
  ),
  Product(
    id: '7',
    image: "assets/images/products/creed_aventus.png",
    name: "CREED AVENTUS",
    price: "Rs 80,000.00",
    isBestSeller: false,
    category: "Men",
    sizes: ["50ml", "100ml"],
    description:
        "A legendary fragrance, Creed Aventus is inspired by the strength and success of historical leaders. With notes of pineapple, birch, and musk, it's a scent of power.",
    rating: 4.9,
  ),
  Product(
    id: '8',
    image: "assets/images/products/jean_Paul_gaulter.png",
    name: "JEAN PAUL GAULTER",
    price: "Rs 40,000.00",
    isBestSeller: false,
    category: "Unisex",
    sizes: ["30ml", "100ml"],
    description:
        "A fresh and zesty fragrance, Jo Malone Lime Basil & Mandarin is a unique blend of citrus and herbs. Perfect for both men and women.",
    rating: 4.2,
  ),
  Product(
    id: '9',
    image: "assets/images/products/EROS-PARFUM-VERSACE.png",
    name: "EROS VERSACE",
    price: "Rs 62,000.00",
    isBestSeller: false,
    category: "Women",
    sizes: ["50ml", "100ml"],
    description:
        "A floral explosion, Flowerbomb by Viktor & Rolf is a luxurious fragrance with notes of jasmine, rose, and patchouli. It's a scent of pure indulgence.",
    rating: 4.6,
  ),
  Product(
    id: '10',
    image: "assets/images/products/Paco-Rabanne-One-Million.png",
    name: "ONE MILLION PACO RABANNE",
    price: "Rs 52,000.00",
    isBestSeller: false,
    category: "Women",
    sizes: ["30ml", "50ml"],
    description:
        "A vibrant floral fragrance, Gucci Bloom is inspired by the diversity of women. With notes of tuberose and jasmine, it's a celebration of authenticity.",
    rating: 4.4,
  ),
];
