import 'package:ecommerce_mobile/model/shoes.dart';
import 'package:flutter/material.dart';

class DetailShoes extends StatelessWidget {
  final ShoesInfo shoes;

  const DetailShoes({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoes.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(shoes.image),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                shoes.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Rp. ${shoes.price}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < shoes.rate ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                shoes.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _showPurchaseDialog(context);
                },
                child: Text(
                  'Buy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPurchaseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembayaran'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Produk: ${shoes.name}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              Text(
                'Harga: Rp ${shoes.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(
                'Jumlah Produk ${shoes.stock='1'}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _processPayment(context);
              },
              child: Text('Konfirmasi'),
            ),
          ],
        );
      },
    );
  }

  void _processPayment(BuildContext context) {
    print('Pembayaran untuk ${shoes.name} sebesar Rp ${shoes.price} diproses.');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pembelian ${shoes.name} berhasil!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
