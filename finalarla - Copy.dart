import 'dart:io';

class Kereta {
  String nama;
  Map<String, int> hargaTiket;

  Kereta(this.nama, this.hargaTiket);
}

class PesananTiket {
  String namaKereta;
  String kategoriTiket;
  int jumlahTiket;
  int totalHarga;
  String namaLengkap;
  String email;
  String nomorTelepon;
  String metodePembayaran;
  String detailPembayaran;

  PesananTiket(
    this.namaKereta,
    this.kategoriTiket,
    this.jumlahTiket,
    this.totalHarga,
    this.namaLengkap,
    this.email,
    this.nomorTelepon,
    this.metodePembayaran,
    this.detailPembayaran,
  );
}

void main() {
  List<Kereta> keretaList = [
    Kereta('Argo Bromo Anggrek', {'Eksekutif': 500000, 'Bisnis': 300000, 'Ekonomi': 200000}),
    Kereta('Taksaka Pagi', {'Eksekutif': 450000, 'Bisnis': 275000, 'Ekonomi': 175000}),
  ];

  List<String> metodePembayaranList = ['Transfer Bank', 'E-Wallet'];

  print('Selamat datang di sistem pemesanan tiket kereta!\n');

  // Menampilkan dan mengurutkan daftar kereta berdasarkan nama
  keretaList.sort((a, b) => a.nama.compareTo(b.nama));
  print('Kereta yang tersedia:');
  for (int i = 0; i < keretaList.length; i++) {
    print('${i + 1}. ${keretaList[i].nama}');
  }

  // Memilih kereta
  stdout.write('Pilih kereta (1-${keretaList.length}): ');
  int pilihanKereta = int.parse(stdin.readLineSync()!);
  Kereta keretaTerpilih = keretaList[pilihanKereta - 1];
  print('Anda memilih: ${keretaTerpilih.nama}\n');

  // Menampilkan kategori tiket dan harga
  print('Kategori tiket untuk ${keretaTerpilih.nama}:');
  List<String> kategoriTiketList = keretaTerpilih.hargaTiket.keys.toList();
  for (int i = 0; i < kategoriTiketList.length; i++) {
    String kategori = kategoriTiketList[i];
    print('${i + 1}. $kategori: Rp ${keretaTerpilih.hargaTiket[kategori]}');
  }

  // Memilih kategori tiket
  stdout.write('Pilih kategori tiket (1-${kategoriTiketList.length}): ');
  int pilihanKategori = int.parse(stdin.readLineSync()!);
  String kategoriTiket = kategoriTiketList[pilihanKategori - 1];
  int hargaTiket = keretaTerpilih.hargaTiket[kategoriTiket]!;

  // Memasukkan jumlah tiket
  stdout.write('Masukkan jumlah tiket: ');
  int jumlahTiket = int.parse(stdin.readLineSync()!);
  int totalHarga = hargaTiket * jumlahTiket;
  print('Total harga: Rp $totalHarga\n');

  // Memasukkan informasi pribadi
  stdout.write('Masukkan nama lengkap: ');
  String namaLengkap = stdin.readLineSync()!;
  stdout.write('Masukkan alamat email: ');
  String email = stdin.readLineSync()!;
  stdout.write('Masukkan nomor telepon: ');
  String nomorTelepon = stdin.readLineSync()!;

  // Memilih metode pembayaran
  print('\nMetode pembayaran yang tersedia:');
  for (int i = 0; i < metodePembayaranList.length; i++) {
    print('${i + 1}. ${metodePembayaranList[i]}');
  }
  stdout.write('Pilih metode pembayaran (1-${metodePembayaranList.length}): ');
  int pilihanMetode = int.parse(stdin.readLineSync()!);
  String metodePembayaran = metodePembayaranList[pilihanMetode - 1];
  print('Anda memilih metode pembayaran: $metodePembayaran\n');

  String detailPembayaran = '';
  // Jika metode pembayaran adalah Transfer Bank
  if (metodePembayaran == 'Transfer Bank') {
    stdout.write('Pilih bank Anda (BCA, Mandiri, BRI): ');
    String pilihanBank = stdin.readLineSync()!;
    detailPembayaran = pilihanBank;
    print('Anda telah memilih $pilihanBank sebagai metode pembayaran.\n');
  }
  // Jika metode pembayaran adalah E-Wallet
  else if (metodePembayaran == 'E-Wallet') {
    stdout.write('Masukkan nama layanan E-Wallet Anda (GoPay, OVO, Dana): ');
    String pilihanEWallet = stdin.readLineSync()!;
    detailPembayaran = pilihanEWallet;
    print('Anda telah memilih $pilihanEWallet sebagai metode pembayaran.\n');
  }

  // Konfirmasi pembelian
  print('\n--- Konfirmasi Pembelian ---');
  print('Nama: $namaLengkap');
  print('Email: $email');
  print('Nomor Telepon: $nomorTelepon');
  print('Kereta: ${keretaTerpilih.nama}');
  print('Kategori Tiket: $kategoriTiket');
  print('Jumlah Tiket Yang Dibeli: $jumlahTiket');
  print('Total Harga: Rp $totalHarga');
  print('Metode Pembayaran: $metodePembayaran');
  if (metodePembayaran == 'Transfer Bank') {
    print('Bank: $detailPembayaran');
  } else if (metodePembayaran == 'E-Wallet') {
    print('Layanan E-Wallet: $detailPembayaran');
  }

  stdout.write('\nApakah informasi ini sudah benar? (y/n): ');
  String konfirmasi = stdin.readLineSync()!;

  // Stack untuk menyimpan pesanan tiket
  Stack<PesananTiket> tumpukanPesanan = Stack<PesananTiket>();

  if (konfirmasi.toLowerCase() == 'y') {
    // Membuat pesanan tiket dan menambahkannya ke stack
    PesananTiket pesanan = PesananTiket(
      keretaTerpilih.nama,
      kategoriTiket,
      jumlahTiket,
      totalHarga,
      namaLengkap,
      email,
      nomorTelepon,
      metodePembayaran,
      detailPembayaran,
    );
    tumpukanPesanan.push(pesanan);
    print('\nPembelian tiket berhasil! Tiket akan dikirim ke email Anda.');

    // Menampilkan struk pembayaran
    stdout.write('\nApakah Anda ingin menampilkan struk pembayaran? (y/n): ');
    String tampilkanStruk = stdin.readLineSync()!;
    if (tampilkanStruk.toLowerCase() == 'y') {
      print('\n--- Struk Pembayaran ---');
      print('Nama: ${pesanan.namaLengkap}');
      print('Email: ${pesanan.email}');
      print('Nomor Telepon: ${pesanan.nomorTelepon}');
      print('Kereta: ${pesanan.namaKereta}');
      print('Kategori Tiket: ${pesanan.kategoriTiket}');
      print('Jumlah Tiket: ${pesanan.jumlahTiket}');
      print('Total Harga: Rp ${pesanan.totalHarga}');
      print('Metode Pembayaran: ${pesanan.metodePembayaran}');
      if (pesanan.metodePembayaran == 'Transfer Bank') {
        print('Bank: ${pesanan.detailPembayaran}');
      } else if (pesanan.metodePembayaran == 'E-Wallet') {
        print('Layanan E-Wallet: ${pesanan.detailPembayaran}');
      }
    }
  } else {
    print('\nTerima Kasih!');
  }
} 
class Stack<T> {
  final List<T> _list = [];

  void push(T value) {
    _list.add(value);
  }

  T pop() {
    if (_list.isEmpty) {
      throw StateError('Tidak ada elemen di dalam stack.');
    }
    return _list.removeLast();
  }

  T peek() {
    if (_list.isEmpty) {
      throw StateError('Tidak ada elemen di dalam stack.');
    }
    return _list.last;
  }

  bool get isEmpty => _list.isEmpty;

  int get length =>_list.length;
}