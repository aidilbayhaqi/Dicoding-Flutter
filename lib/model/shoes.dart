class ShoesInfo {
  String id;
  String name;
  String description;
  num price;
  num rate;
  String stock;
  String image;

  ShoesInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rate,
    required this.stock,
    required this.image,
  });
}

var ShoesInfoList = [
  ShoesInfo(
      id: '1',
      name: 'Vans Old Skool',
      description:
          'Vans Old Skool adalah sepatu skate klasik yang telah menjadi simbol budaya pop. Dengan desain yang sederhana namun ikonik, sepatu ini cocok untuk berbagai gaya, dari kasual hingga streetwear. Terbuat dari bahan kanvas dan suede berkualitas tinggi, Vans Old Skool menawarkan daya tahan dan kenyamanan yang luar biasa. Sol karet yang fleksibel memberikan traksi yang baik, menjadikannya pilihan sempurna untuk para skateboarder maupun penggemar mode. Dengan Vans Old Skool, Anda dapat mengekspresikan gaya unik Anda dengan percaya diri.',
      price: 200000,
      rate: 4.5,
      stock: '40',
      image: 'images/sepatu-1.jpg'),
  ShoesInfo(
      id: '2',
      name: 'Hoka One One Bondi 7',
      description:
          'Hoka One One Bondi 7 adalah sepatu lari yang dirancang untuk memberikan kenyamanan maksimal. Dengan bantalan yang sangat empuk, sepatu ini mengurangi dampak saat berlari, menjadikannya pilihan ideal untuk pelari jarak jauh. Desainnya yang ringan dan upper yang breathable memastikan kaki Anda tetap sejuk dan nyaman. Bondi 7 juga dilengkapi dengan outsole yang tahan lama, memberikan traksi yang baik di berbagai permukaan. Jika Anda mencari sepatu lari yang menawarkan kenyamanan dan dukungan, Hoka One One Bondi 7 adalah pilihan yang tepat.',
      price: 150000,
      rate: 5,
      stock: '30',
      image: 'images/sepatu-2.jpg'),
  ShoesInfo(
      id: '3',
      name: 'Converse Chuck Taylor All Star',
      description:
          'Converse Chuck Taylor All Star adalah sepatu kanvas klasik yang telah menjadi favorit di seluruh dunia. Dengan desain yang ikonik dan beragam pilihan warna, sepatu ini cocok untuk berbagai gaya dan kesempatan. Terbuat dari bahan kanvas yang ringan, sepatu ini memberikan kenyamanan dan fleksibilitas. Sol karet memberikan traksi yang baik, sementara desain tinggi memberikan dukungan tambahan. Converse Chuck Taylor All Star adalah pilihan sempurna untuk mereka yang ingin tampil stylish dengan sentuhan klasik.',
      price: 300000,
      rate: 4,
      stock: '50',
      image: 'images/sepatu-3.jpg'),
  ShoesInfo(
      id: '4',
      name: 'Air Jordan',
      description:
          'Air Jordan adalah sepatu olahraga yang tidak hanya nyaman tetapi juga memiliki desain yang keren dan stylish. Dikenal sebagai salah satu sepatu basket terbaik, Air Jordan menawarkan dukungan yang luar biasa dan teknologi bantalan yang responsif. Dengan berbagai pilihan warna dan edisi terbatas, sepatu ini menjadi favorit di kalangan penggemar olahraga dan kolektor. Apakah Anda bermain basket atau hanya ingin tampil gaya, Air Jordan adalah pilihan yang sempurna untuk Anda.',
      price: 350000,
      rate: 5,
      stock: '15',
      image: 'images/sepatu-4.jpg'),
  ShoesInfo(
      id: '5',
      name: 'Nike Air Max 270',
      description:
          'Nike Air Max 270 adalah sepatu sneakers yang dirancang untuk memberikan kenyamanan maksimal dan gaya yang modern. Dengan teknologi Air Max yang ikonik, sepatu ini menawarkan bantalan yang responsif dan ringan, membuat setiap langkah terasa lebih nyaman. Bagian atas terbuat dari bahan mesh yang breathable, memastikan kaki Anda tetap sejuk dan nyaman sepanjang hari. Desainnya yang stylish dan beragam pilihan warna menjadikannya pilihan sempurna untuk berbagai kesempatan, baik untuk berolahraga maupun untuk gaya kasual sehari-hari.',
      price: 400000,
      rate: 4,
      stock: '15',
      image: 'images/sepatu-5.jpg'),
  ShoesInfo(
      id: '6',
      name: 'Adidas Ultraboost 21',
      description:
          'Adidas Ultraboost 21 adalah sepatu lari premium yang dirancang untuk memberikan performa terbaik. Dengan teknologi Boost yang inovatif, sepatu ini menawarkan responsif yang luar biasa dan kenyamanan yang tak tertandingi. Upper yang terbuat dari Primeknit memberikan dukungan yang fleksibel dan pas di kaki, sementara outsole Continental™ Rubber memastikan traksi yang optimal di berbagai permukaan. Cocok untuk pelari serius maupun penggemar kebugaran, Ultraboost 21 adalah kombinasi sempurna antara gaya dan fungsi.',
      price: 450000,
      rate: 3,
      stock: '45',
      image: 'images/sepatu-6.jpg'),
  ShoesInfo(
      id: '7',
      name: 'Puma RS-X',
      description:
          'Puma RS-X adalah sepatu retro yang menggabungkan gaya klasik dengan teknologi modern. Dengan desain yang berani dan warna-warna cerah, sepatu ini cocok untuk mereka yang ingin tampil beda. Dikenal dengan kenyamanan yang luar biasa, RS-X dilengkapi dengan midsole yang empuk dan outsole yang tahan lama. Sepatu ini tidak hanya nyaman untuk dipakai sehari-hari, tetapi juga memberikan dukungan yang baik saat berolahraga. Dengan Puma RS-X, Anda dapat mengekspresikan gaya pribadi Anda tanpa mengorbankan kenyamanan.',
      price: 500000,
      rate: 4,
      stock: '65',
      image: 'images/sepatu-7.jpg'),
  ShoesInfo(
      id: '8',
      name: 'Reebok Classic Leather',
      description:
          'Reebok Classic Leather adalah sepatu ikonik yang telah menjadi favorit sepanjang masa. Dengan desain yang sederhana namun elegan, sepatu ini cocok untuk berbagai gaya dan kesempatan. Terbuat dari kulit berkualitas tinggi, sepatu ini menawarkan daya tahan dan kenyamanan yang luar biasa. Sol karet memberikan traksi yang baik, sementara bantalan di dalam sepatu memastikan kenyamanan sepanjang hari. Reebok Classic Leather adalah pilihan sempurna untuk mereka yang menghargai gaya.',
      price: 190000,
      rate: 4,
      stock: '70',
      image: 'images/sepatu-8.jpg'),
  ShoesInfo(
      id: '9',
      name: 'New Balance 990v5',
      description:
          'New Balance 990v5 adalah sepatu lari yang dirancang untuk memberikan dukungan dan kenyamanan maksimal. Dengan teknologi ENCAP yang inovatif, sepatu ini menawarkan stabilitas dan daya tahan yang luar biasa. Upper terbuat dari bahan mesh dan suede berkualitas tinggi, memberikan ventilasi yang baik dan tampilan yang stylish. Cocok untuk pelari jarak jauh maupun penggunaan sehari-hari, 990v5 adalah kombinasi sempurna antara performa dan gaya. Dengan desain yang timeless, sepatu ini akan menjadi bagian dari koleksi sepatu Anda selama bertahun-tahun.',
      price: 250000,
      rate: 5,
      stock: '70',
      image: 'images/sepatu-8.jpg'),
  ShoesInfo(
      id: '10',
      name: 'Asics Gel-Kayano 27',
      description:
          'Asics Gel-Kayano 27 adalah sepatu lari yang dirancang untuk memberikan kenyamanan dan dukungan optimal. Dengan teknologi Gel yang terkenal, sepatu ini menawarkan bantalan yang responsif dan mengurangi dampak saat berlari. Upper yang terbuat dari mesh yang breathable memastikan kaki Anda tetap sejuk, sementara sistem dukungan Dynamic DuoMax™ memberikan stabilitas tambahan. Cocok untuk pelari dengan pronasi berlebih, Gel-Kayano 27 adalah pilihan ideal untuk pelari serius yang mencari performa terbaik. Dengan desain yang ergonomis, sepatu ini akan membantu Anda mencapai tujuan kebugaran Anda dengan lebih nyaman.',
      price: 299000,
      rate: 5,
      stock: '50',
      image: 'images/sepatu-10.jpg'),
];
