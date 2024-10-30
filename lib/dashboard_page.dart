import 'package:flutter/material.dart';
import 'login_page.dart'; // Pastikan untuk mengimpor login_page.dart

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Menghapus tombol kembali
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tabel yang berisi pesan selamat datang
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Selamat, $username, Anda berhasil login ke aplikasi ini.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tombol Logout
            ElevatedButton(
              onPressed: () {
                // Menampilkan pop-up konfirmasi logout
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Logout'),
                      content: Text('Apakah Anda yakin ingin logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Menutup dialog
                          },
                          child: Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Menutup dialog
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (Route<dynamic> route) => false,
                            ); // Navigasi ke halaman Login dan menghapus stack
                          },
                          child: Text('Logout'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Warna skyblue
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
