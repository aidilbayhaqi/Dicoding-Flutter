import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/detail_shoes.dart';
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
            Stack(
              children: [
                Image.asset(
                  'images/sepatu-5.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
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
                ),
              ],
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
  bool isLoading = false;

  void _onSearchChanged(String value) {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = value;
        isLoading = false;
      });
    });
  }

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
            onChanged: _onSearchChanged,
          ),
        ),
        const SizedBox(height: 20),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : ShoesResult(searchQuery: searchQuery),
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

    int crossAxisCount = screenWidth <= 400
        ? 1
        : screenWidth <= 600
            ? 2
            : screenWidth <= 900
                ? 3
                : 4;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: filteredShoes.isEmpty
          ? const Center(child: Text("Tidak ada sepatu ditemukan"))
          : GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredShoes.length,
              itemBuilder: (context, index) {
                final ShoesInfo shoes = filteredShoes[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < shoes.rate
                                  ? Icons.star
                                  : Icons.star_border,
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
