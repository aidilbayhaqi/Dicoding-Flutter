import 'package:ecommerce_mobile/detail_shoes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/model/shoes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'SHOES ECOMMERCE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.white),
        ),
        actions: const [
          PersonButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sepatu-5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  "Selamat Datang di Shoes Ecommerce",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SearchShoes(),
          ],
        ),
      ),
    );
  }
}

class SearchShoes extends StatefulWidget {
  const SearchShoes({Key? key}) : super(key: key);

  @override
  _SearchShoesState createState() => _SearchShoesState();
}

class _SearchShoesState extends State<SearchShoes> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Cari Sepatu',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        ShoesResult(searchQuery: searchQuery),
      ],
    );
  }
}

class ShoesResult extends StatelessWidget {
  final String searchQuery;

  const ShoesResult({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredShoes = ShoesInfoList.where((shoe) =>
        shoe.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth <= 600) {
      crossAxisCount = 2;
    } else if (screenWidth <= 900) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: filteredShoes.length,
        itemBuilder: (context, index) {
          final ShoesInfo shoes = filteredShoes[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailShoes(shoes: shoes);
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    shoes.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoes.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Rp. ${shoes.price}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < shoes.rate ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FavoriteButton(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class PersonButton extends StatelessWidget {
  const PersonButton({Key? key}) : super(key: key);

  void _showProfilePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "User Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Nama: John Doe"),
              Text("Email: johndoe@example.com"),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person, color: Colors.white),
      onPressed: () => _showProfilePopup(context),
    );
  }
}
