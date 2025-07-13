import 'package:flutter/material.dart';

class HomepageCustomerScreen extends StatelessWidget {
  const HomepageCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  // Search bar
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Apo cari dek tengok tengokla dulu",
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ),
                  ),
                  // Category Chips (Arsitek, etc.)
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterChip(
                        label: Text('Arsitek'),
                        backgroundColor: Colors.orange.shade100,
                        onSelected: (selected) {},
                      ),
                      SizedBox(height: 4),
                      FilterChip(
                        label: Text('Arsitek'),
                        backgroundColor: Colors.orange.shade100,
                        onSelected: (selected) {},
                      ),
                      SizedBox(height: 4),
                      FilterChip(
                        label: Text('Arsitek'),
                        backgroundColor: Colors.orange.shade100,
                        onSelected: (selected) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Rumah Populer Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Rumah Populer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Rumah Populer Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RumahPopulerCard(
                    title: "Rumah ${index + 1}",
                    location: "Jakarta",
                    imageUrl:
                        'https://via.placeholder.com/150', // replace with real image
                    price: '\$3000/month',
                  );
                },
              ),
            ),

            // Hot Deals Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                "Hot Deals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: HotDealsCard(
                title: "BaLi Motel Vung Tau",
                price: "\$580/night",
                discount: "25% OFF",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange.shade700,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Widget for Rumah Populer Card
class RumahPopulerCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String price;

  const RumahPopulerCard({
    super.key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(location),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(price),
          ),
        ],
      ),
    );
  }
}

// Widget for Hot Deals Card
class HotDealsCard extends StatelessWidget {
  final String title;
  final String price;
  final String discount;

  const HotDealsCard({
    super.key,
    required this.title,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://via.placeholder.com/150', // replace with real image
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(price),
              Text(discount, style: TextStyle(color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}
