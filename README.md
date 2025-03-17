# Coffee_Shop_Sales_Dashboard

## Tujuan Projek
Dashboard ini dirancang untuk memonitor dan menganalisis performa penjualan di sebuah coffee shop dalam periode tertentu untuk mengidentifikasi tren penjualan, memahami pola pelanggan, dan mengoptimalkan strategi bisnis

## Dataset yang Digunakan
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Coffee%20Shop%20Sales.xlsx">Dataset Power BI</a>
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Coffee%20Shop%20Sales.csv">Dataset MySQL</a>

## Persyaratan KPI
1. **Analisis Total Penjualan**
   - Menghitung total penjualan untuk setiap bulan
   - Menentukan peningkatan atau penurunan penjualan dari bulan ke bulan
   - Menghitung selisih penjualan antara bulan yang dipilih dengan bulan sebelumnya
2. **Analisis Total Pesanan**
   - Menghitung total jumlah pesanan untuk setiap bulan
   - Menentukan peningkatan atau penurunan jumlah pesanan dari bulan ke bulan
   - Menghitung selisih jumlah pesanan antara bulan yang dipilih dan bulan sebelumnya
3. **Analisis Total Kuantitas Terjual**
   - Menghitung total kuantitas produk yang terjual untuk setiap bulan
   - Menentukan peningkatan atau penurunan total kuantitas yang terjual dari bulan ke bulan
   - Menghitung selisih total kuantitas terjual antara bulan yang dipilih dan bulan sebelumnya

## Persyaratan Grafik
1. **Kalender Heat Map**
   - Menerapkan kalender Heat Map yang secara dinamis menyesuaikan berdasarkan bulan yang dipilih dari slicer
   - Setiap hari pada kalender akan diberi kode warna untuk menunjukkan volume penjualan, dengan warna yang lebih gelap menandakan penjualan lebih tinggi
   - Menambahkan tooltip untuk menampilkan metrik detail (Penjualan, pesanan, kuantitas) saat mengarahkan kursor ke hari tertentu
2. **Analisis Penjualan Berdasarkan Weekday dan Weekend**
   - Mengelompokkan data penjualan ke dalam hari kerja dan akhir pekan untuk menganalisis variasi kerja
   - Memberikan wawasan apakah pola penjualan berbeda secara signifikan antara hari kerja dan akhir pekan.
3. **Analisis Penjualan berdasarkan Lokasi Toko**
   - Memvisualisasikan data penjualan berdasarkan lokasi toko yang berbeda
   - Menyertakan metrik selisih bulan ke bulan (Month-over-Month/MoM) berdasarkan bulan yang dipilih di slicer
   - Menyoroti peningkatan atau penurunan penjualan MoM untuk setiap lokasi toko guna mengidentifikasi tren
4. **Analisis Penjualan Harian dengan Garis Rata-Rata**
   - Menampilkan penjualan harian untuk bulan yang dipilih dalam bentuk grafik garis
   - Menambahkan garis rata-rata pada grafik untuk mempresentasikan rata-rata penjualan harian
   - Menyoroti batang yang melebihi atau berada di bawah rata-rata penjualan guna mengidentifikasi hari dengan penjualan luar biasa.
5. **Analisis Penjualan berdasarkan Kategori Produk**
   - Menganalisis kinerja penjualan di berbagai kategori produk
   - Memberikan wawasan mengenai kategori produk mana yang memberikan kontribusi terbesar terhadap total penjualan
6. **10 Produk Terlaris berdasarkan Penjualan**
   - Mengidentifikasi dan menampilkan 10 produk teratas berdasarkan volume penjualan
   -  Memungkinkan pengguna dengan cepat melihat produk yang berkinerja terbaik dalam hal penjualan
7. **Analisis Penjualan berdasarkan Hari dan Jam**
   - Menggunakan heat map untuk memvisualisasikan pola penjualan berdasarkan hari dan jam
   - Menambahkan tooltip untuk menampilkan metrik detail (Penjualan, Pesanan, Kuantitas) saat mengarahkan kursos ke hari dan jam tertentu
  
## Perhitungan dengan Menggunakan MySQL Workbench
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Coffee_Shop_Sales_Query.sql">Query</a>
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Penjelasan%20Queries%20Coffee%20Shop%20Sales.docx">Penjelasan Query</a>

## Interaksi Dashboard
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Coffe%20Shop%20Sales.pbix">Dashboard</a>

## Tampilan Dashboard
![Coffee_Shop_Sales_Dashboard](https://github.com/user-attachments/assets/eac2ce15-7c15-48eb-8a86-f89a8b06d8ea)
- <a href="https://github.com/ifanapridarahman/Coffee_Shop_Sales_Dashboard/blob/main/Coffee_Shop_Sales_Dashboard.png">Dashboard</a>

## Analisis Dashboard "Coffee Shop Sales" - Mei 2023
Dashboard ini akan memberikan wawasan mendalam tentang performa penjualan coffee shop untuk bulan Mei 2023. Berikut adalah beberapa insight utama dari data yang ditampilkan
1. **Ringkasan Kinerja Penjualan**
   - **Total Sales**: $157K, mengalami peningkatan 31,8% atau meningkat $37,8K dibanding bulan sebelumnya
   - **Total Order**: 33.527 transasksi, meningkat 32.3% atau terdapat 8.200 transaksi lebih banyak dibanding bulan sebelumnya
   - **Total Quantity Sold**: 48.233 unit, meningkat 32.3% atau ada tambahan 11.800 unit produk terjual dibanding bulan lalu.
2. **Tren Penjualan**
   - Grafik **Sales Trend Over the Period** menunjukkan pola penjualan harian sepanjang bulan Mei.
   - Terlihat adanya fluktuasi, dengan beberapa puncak penjualan pada hari-hari tertentu
   - Avg Sales pada grafik Sales Trend Over the Period merepresentasikan rata-rata pendapatan per hari dalam bulan Mei
3. **Analisis Penjualan Berdasarkan Waktu**
   - **Sales by Weekend/Weekday**
     - Penjualan hari kerja lebih tinggi dibandingkan akhir pekan ($117K vs $40)
     - Hal ini menunjukkan bahwa coffee shop lebih ramai pada hari kerja, kemungkinan besar karena pelanggan pekerja kantoran
   - **Sales by Days/Hours**
     - Heatmap menunjukkan waktu-waktu dengan volume penjualan tertinggi, membantu dalam optimalisasi jam operasional dan strategi promosi.
4. **Analisis Produk Terlaris**
   - **Kategori Terlaris**
     - **Coffee** ($85,12K, naik 3,35%) mendominasi penjualan
     - **Bakery** ($15,52K, naik 3,12%) juga menunjukkan pertumbuhan
   - **Produk Terlaris**
     - **Barista Espresso** menjadi produk dengan penjualan tertinggi
     - Disusul oleh Brawed Chai, Hot Chocolate, dan Gourmet Brewed Coffee
   - Tren positif pada beberapa produk menunjukkan potensi peningkatan stok dan promosi lebih lanjut
5. **Analisis Penjualan Berdasarkan Lokasi**
   - Hall's Kitchen ($52,20K) menjadi lokasi dengan penjualan tertinggi
   - Astoria ($52,43K) dan Lower Manhattan ($53,70K) juga memiliki performa baik

## Kesimpulan
1. Peningkatan penjualan bulan Mei menunjukkan tren positif dibanding bulan sebelumnya
2. Hari kerja lebih ramai dibandingkan akhir pekan, menunjukkan coffee shop melayani banyak pekerja atau pelanggan rutin
3. Barista Espresso dan Kategori Coffe mendominasi penjualan, sehingga strategi promosi bisa difokuskan pada variasi ini
4. Lokasi dengan performa terbaik dapat dijadikan acuan untuk meningkatkan strategi di cabang lain.

**Catatan**: Untuk melihat data bulan lainnya, silakan akses melalui link Interaksi Dashboard



