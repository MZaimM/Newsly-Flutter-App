class News {
  String author;
  String title;
  String image;
  String published;
  String content;
  String url;
  String source;

  News(
    {
       required this.author, 
       required this.title, 
       required this.image, 
      required this.published, 
      required this.content,
      required this.url,
       required this.source
    }
  );

  factory News.fromJson(Map<String, dynamic> json) {
    var imageUrl = "https://idtechsolusi.co.id/assets/img/no-image.png";
    return News(
      author : json['author'] == null ? "" : json['author'],
      title : json['title'] == null ? "" : json['title'],
      image : json['urlToImage'] == null ? imageUrl : json['urlToImage'],
      published : json['publishedAt'] == null ? "" : json['publishedAt'],
      content : json['content'] == null ? "" : json['content'],
      url: json['url'] == null ? "" : json['url'],
      source: json['source']['name']
    );
  }
}

// class NewsList {
//   List<News> newsL=[
//     News(
//       author: 'Yuni Riadi',
//       title: 'Bocor di Tenaa Xiaomi CC11 Pro Punya Layar 4K - Selular.ID',  
//       image: 'https://selular.id/wp-content/uploads/2021/07/Berita-Ke-3-Xiaomi-CC.jpg', 
//       published: '2021-10-01', 
//       content: 'Jakarta, Selular.ID – Pada Juli lalu informasi mengenai seri CC yang akan dirilis Xiaomi beredar. Melalui Wei Siqi, manajer produk dan juru bicara merek Xiaomi dengan jelas menyatakan bahwa model ser… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'M.Risman Noor',
//       title: 'Ponsel Android dan iPhone Tak Dapat Lagi Gunakan WhatsApp',  
//       image: 'https://cdn-2.tstatic.net/banjarmasin/foto/bank/images/whatsapp-bakal-meluncurkan-5-fitur-baru-di-2021-ini.jpg', 
//       published: '2021-10-01', 
//       content: 'BANJARMASINPOST.CO.ID - Satu bulan lagi memasuki 1 November 2021 pengguna ponsel android maupun iOs bakal tak bisa lagi menggunakan WhatsApp.\r\nPonsel mana saja yang nantinya tak bisa menggunakan apli… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Sahrul Sidiq', 
//       title: 'HP Harga Rp1 Jutaan Terbaru 2021 Ada Oppo A31, Vivo S1 serta Samsung Galaxy M02', 
//       image: 'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/samsung-galaxy-a32-samsung-galaxy-a52-dan-samsung-galaxy-a52.jpg', 
//       published: '2021-10-01', 
//       content: 'MANTRA SUKABUMI - Berikut kami rangkum daftar HP android Rp.1 Jutaan dari berbagai merk ada dari Oppo A31, Vivo S1 hingga Samsung Galaxy M02.\r\nWalau dengan harga yang kisaran Rp.1 Jutaan, baik Oppo, … \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Intan Rakhmayanti Dewi', 
//       title: 'Bos Microsoft Beberkan Kisah di Balik Gagalnya Akuisisi TikTok', 
//       image: 'https://img.inews.co.id/media/600/files/inews_new/2021/10/01/Aplikasi_TikTok.jpg', 
//       published: '2021-10-01', 
//       content: 'JAKARTA, iNews.id  - Microsoft sempat ingin meminang TikTok tahun lalu. Namun, upaya untuk mengakuisisi perusahaan video pendek itu pada akhirnya tidak terlaksana. Bagaimana kisahnya?\r\nSelang setahun… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Estu Suryowati', 
//       title: 'Monitor Gaming LG UltraGear Ditopang Nvidia G-Sync dan Nano IPS', 
//       image: 'https://images.soco.id/521-tips-mata-nyaman1.jpg.jpeg', 
//       published: '2021-10-01', 
//       content: 'JawaPos.com – Buat gamers yang bermain di perangkat PC, salah satu yang menunjang performa adalah monitor dengan kemampuan tinggi dalam menampilkan grafis. Di pasaran, cukup banyak tersedia monitor g… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
    
//   ];
// }

// class NewsHeadlines{
//   List<News> newsH=[
//     News(
//       author: 'Fahri Zulfikar', 
//       title: 'Sering Pakai Gadget untuk Sekolah Online? Awas Ada 200 Aplikasi Berbahaya', 
//       image: 'https://awsimages.detik.net.id/api/wm/2021/02/21/begini-cara-belajar-asyik-sambil-bermain-untuk-anak-1_169.jpeg?wid=54&w=650&v=1&t=jpeg', 
//       published: '2021-10-01', 
//       content: 'Jakarta - Belum seluruh daerah menjalankan PTM Terbatas membuat siswa masih harus menjalani sekolah daring atau online dari rumah. Namun, siswa perlu hati-hati dalam menggunakan gadget karena terdapa… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Kontan', 
//       title: 'Tiga Pembalap Muda Bersaing Ketat di Puncak Klasemen Kelas Rising Star HRSC 2', 
//       image: 'https://photo.kontan.co.id/photo/2021/10/01/1683201524p.jpg', 
//       published: '2021-10-01', 
//       content: 'Jakarta, 1 Oktober 2021 Seri keempat dari Honda Racing Simulator Championship (HRSC) musim kedua akan diselenggarakan akhir pekan ini, 2 Oktober 2021 dengan menggunakan sirkuit virtual Road Atlanta, … \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Agustinus Mario Damar', 
//       title: 'Dell Perkenalkan 2 Laptop Gaming Terbaru dari Seri Alienware dan G-Series', 
//       image: 'https://cdn0-production-images-kly.akamaized.net/1eA_BYbPWXYxtJaj98V095Xdd3U=/673x379/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3589310/original/065936600_1633063271-Dell_G15_family_photo_2.jpg', 
//       published: '2021-10-01', 
//       content: 'Liputan6.com, Jakarta - Dell Technologies baru saja meluncurkan laptop terbarunya, yakni Alienware M-Series dan Dell G-Series di Asia Selatan dan pasar berkembang Asia lainnya, termasuk di Indonesia.… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Dommara Hadi S', 
//       title: 'Pengguna iPhone enggan upgrade ke iOS 15', 
//       image: 'https://img.tek.id/share/content/2021/10/01/45495/duh-pengguna-iphone-enggan-upgrade-ke-ios-15-GTH8isKZtR.jpg', 
//       published: '2021-10-01', 
//       content: 'Sepekan sudah setelah Apple menggulirkan secara resmi OS terbaru mereka untuk iPhone dan iPad. Para pengguna pengguna pun diharapkan untuk segera melakukan pembaruan ke iOS 15 dari OS lama mereka.\r\nT… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
//     News(
//       author: 'Khoirunnisa', 
//       title: 'Cristiano Amon: Snapdragon Insiders Hadir di Indonesia', 
//       image: 'https://selular.id/wp-content/uploads/2021/10/Christiano-Amon.png', 
//       published: '2021-10-01', 
//       content: 'Jakarta, Selular.ID – Setelah diluncurkan secara global pada Maret 2021, Qualcomm hari ini secara resmi meluncurkan program Snapdragon Insiders di Indonesia. Program ini dibuat untuk mengumumkan beri… \n Ligula amet, morbi risus, blandit turpis turpis habitant odio. Sem pharetra accumsan pulvinar mauris eget quis. Donec orci, vitae quisque a velit tristique consectetur malesuada. Scelerisque id mi dui ullamcorper. \n Vulputate ut arcu nulla dui, elementum condimentum. Amet donec purus hendrerit pharetra, mauris amet pharetra nibh. Eget sit vestibulum nibh semper neque nisi, purus. Tortor adipiscing dictum vel et sodales donec velit. Arcu senectus posuere sit adipiscing proin et nisi placerat vitae.'
//     ),
    
//   ];
// }

