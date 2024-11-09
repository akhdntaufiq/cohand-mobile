# Co-Hand (Mobile App Version)
**Crafted Original by Hand**  
*Your Online Handmade Shop 🛍🧶*
###### by Akhdan Taufiq Syofyan | PBP-D | 2306152475

This repository contains the mobile application version of **Co-Hand**, designed to bring a seamless, mobile-friendly shopping experience for handmade, original crafts. Developed for users who love discovering unique, handcrafted items on the go.

---

<details>
  
   <summary><b>🏡Tugas 7</b></summary>
   
   #### 🍄‍🟫  Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
   - **Stateless widget** adalah widget yang tidak berubah selama berjalannya aplikasi. Widget ini bersifat statis dan tidak bisa mengubah tampilannya setelah dibuat.
   - **Stateful widget** adalah widget yang interaktif atau bisa berubah-ubah selama aplikasi berjalan. Stateful widget memberikan respon terhadap interaksi pengguna berubah perubahan tampilan ataupun data setiap nilai statenya berubah.
   - Pada intinya, **perbedaan** dari keduanya adalah stateless widget tidak memiliki state dan tidak dapat berubah, sedangkan stateful widget memiliki state yang bisa berubah dan ketika berubah akan berefek terhadap perubahan widget yang sesuai.


   #### 🍄‍🟫  Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
   - **MaterialApp**: Root widget aplikasi, mengatur theme dan title.
   - **Scaffold**: Struktur dasar halaman dengan appBar dan body.
   - **AppBar**: Bagian atas halaman, menampilkan judul atau navigasi.
   - **Padding**: Memberi jarak di sekitar widget untuk layout.
   - **Column**: Menyusun widget secara vertikal.
   - **GridView**: Menampilkan item dalam grid dengan jumlah kolom tertentu.
   - **Card**: Container dengan elevasi, tampilan seperti kartu.
   - **Text**: Menampilkan teks statis.
   - **InkWell**: Efek sentuhan untuk widget yang dibungkus.
   - **Icon**: Menampilkan ikon grafis.
  
   #### 🍄‍🟫  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
   - Fungsi dari `setState()` adalah untuk meminta flutter merender ulang UI ketika state dari suatu widget terdapat perubahan sehingga saat fungsi tersebut dipanggil, widget akan memicu pemanggilan ulang build untuk merefleksikan perubahan data pada UI.
   - Variabel yang terdampak dari fungsi `setState()` adalah variabel yang terdapat di dalam State dari StatefulWidget, seperti teks dinamis atau kondisi interaktif lainnya.
  
   #### 🍄‍🟫  Jelaskan perbedaan antara const dengan final.
   - `const`: Variabel atau objek yang diatur pada waktu kompilasi dan tidak bisa diubah. Digunakan untuk nilai tetap yang sudah diketahui, seperti warna tetap.

   - `final`: Variabel yang hanya diinisialisasi sekali dan tidak dapat diubah setelahnya, tetapi nilainya bisa ditentukan saat aplikasi berjalan. Digunakan untuk nilai tetap yang diperoleh dari perhitungan atau input pengguna.
  
   #### 🍄‍🟫  Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
   - Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
   ```
    flutter create cohand_mobile
   ```
   - Membuat aplikasi Flutter dengan `MaterialApp` yang memiliki tema dasar. Judul aplikasi diatur menjadi "Cohand" dan warna utama diatur menggunakan `primaryColor`.
   ```
   void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cohand',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          primary:    const Color(0xFF5B5247),
          secondary:  const Color(0xFF99A485),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F5E8),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
   ```
   - Membuat `MyHomePage`, halaman utama aplikasi, dengan tiga tombol yang sesuai dengan kebutuhan: Lihat Daftar Produk, Tambah Produk, dan Logout.
   ```
   class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFF99a485)),
    ItemHomepage("Tambah Produk", Icons.add, const Color(0xFF525D42)),       
    ItemHomepage("Logout", Icons.logout, const Color(0xFFe44747)),            
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cohand',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Cohand',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
   ```
   - Membuat Class `ItemHomepage` untuk menyimpan data dari setiap tombol: name, icon, dan color.
   ```
   class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
   ```
   - Menampilkan Tombol Menggunakan `ItemCard` dan Menambahkan Fungsi `Snackbar`.
   ```
   class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          // Menampilkan pesan snackbar sesuai dengan tombol yang ditekan
          String message = "Kamu telah menekan tombol ${item.name}";
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(message)),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

   ```

</details>
