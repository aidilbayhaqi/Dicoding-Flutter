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
        actions: [
          const PersonButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage('images/sepatu-5.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Container(
                  child: const Text(
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
            decoration: InputDecoration(
              labelText: 'Cari Sepatu',
              border: OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
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

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.8),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
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
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(shoes.image,
                          height: 120, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shoes.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Rp. ${shoes.price}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FavoriteButton(),
                          IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.share)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
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
        icon: isFavorite
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}

class PersonButton extends StatefulWidget {
  const PersonButton({Key? key}) : super(key: key);

  @override
  _PersonButtonState createState() => _PersonButtonState();
}

class _PersonButtonState extends State<PersonButton> {
  bool isPerson = false;

  void _showProfilePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("User  Profile",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Nama: John Doe",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text("Email: johndoe@example.com",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
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
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isPerson = !isPerson;
          });
          _showProfilePopup(context);
        });
  }
}
