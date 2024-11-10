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

<details>
  
   <summary><b>🏡Tugas 8</b></summary>
   
   #### 🍄‍🟫  Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
   Keyword `const` pada flutter digunakan untuk membuat sebuah object menjadi immutable atau object tersebut tidak akan berubah selama aplikasi berjalam. Penggunaan `const` akan memberitahu bahwa suatu object hanya akan dibuat sekali saat kompilasi dan akan disimpan dalam memori, sehingga memberikan keuntungan dalam hal efisiensi serta pernggunaan sumber daya yang lebih sedikit. Namun, `const` tidak baik digunakan jika object seperti widget ataupun variabel tersebut bersifat dinamis atau nilainya dapat berubah saat aplikasi berjalan.
   
   #### 🍄‍🟫  Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Pada Flutter, `Column` dan `Row` adalah dua layout widget yang digunakan untuk menyusun elemen dalam arah vertikal dan horizontal.
1. `Column` : Digunakan untuk menyusun widget secara vertikal, dari atas ke bawah.
   ex:
    ```
    Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
              child: Text(
                'Welcome to Cohand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  color: Color(0xFF5B5247),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ItemCard(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
    ```
2. `Row` : Digunakan untuk menyusun widget secara horizontal, dari kiri ke kanan
   ex:
    ```
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.home),
        Icon(Icons.search),
        Icon(Icons.settings),
      ],
    ),
    ```
    
#### 🍄‍🟫  Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
   
   Pada tugas saya kali ini, saya menggunakan dua elemen input, yaitu:
   - `TextFormField`: Digunakan untuk input teks, seperti nama produk, harga produk, dan deskripsi produk.
   - `ElevatedButton`: Digunakan sebagai tombol submit untuk menyimpan produk.
   
   Namun, masih banyak lagi elemen input yang disediakan oleh fluuter selain yang saya gunakan, antara lain:
  - `Checkbox`: Untuk membuat pilihan boolean (ya/tidak).
  - `Radio`: Untuk membuat pilihan tunggal dari beberapa opsi.
  - `Switch`: Alternatif untuk Checkbox dengan tampilan saklar.
   
   #### 🍄‍🟫  Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
   Untuk mengatur tema dalam aplikasi flutter, saya menggunakan `ThemeData` pada `MaterialApp` untuk mendefinisikan `primaryColor`, `secondaryColor`, dan warna latar belakang `scaffoldBackgroundColor`. Dengan pendefinisian color theme tersebut, elemen-elemen yang terdapat pada aplikasi saya menjadi konsisten.
   `NOTES`: Saya belum sepenuhnya menggunakan `ThemeData` yang saya definisikan, namun seperti background color sudah saya gunakan.
   
   #### 🍄‍🟫  Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
   Pada aplikasi saya, saya menggunakan `Navigator` seperti `Navigator.push` untuk menambahkan halaman baru ke dalam stack dan `Navigator.pushReplacement` di saat ingin kembali ke halaman utaman untuk menghindari stack yang berlapis. Dengan berbagai metode ini, saya dapat menangani navigasi dalam aplikasi dengan lebih fleksibel dan efisien, mengelola stack dengan baik, serta memastikan pengguna memiliki pengalaman navigasi yang lancar.

</details>
