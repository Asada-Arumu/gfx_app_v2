import 'package:flutter/material.dart';
import '../widget/asarumu_gfx.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Center(
              child: Icon(Icons.account_circle_rounded, color: const Color(0xFF67C090), size: 150),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: Center(
              child: Text(
                'Muhammad Asad Al-Mursalin',
                style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              ),
            ),

            Center(
             child: Text(
              'NIM: 23552011461',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(top: 70, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,                
                children: [                  
                  Text('Your Posts', style: TextStyle(color: const Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            AsarumuGFX(),

            // Special Thanks untuk karyanya
            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 70, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,                
                children: [                  
                  Text('Big Special thanks to:', style: TextStyle(color: const Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 15, right: 20, bottom: 30),
              child: Text(
                'Terimakasih sebanyak-banyaknya kepada Kahryl dan juga Trizero atas izin penggunaan karya mereka dalam aplikasi ini. \n\nBagaimana dengan Asarumu? Wong itu saya kok. Hehehe.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
              ),
            ),

            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 50, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,                
                children: [                  
                  Text("Don't forget to follow:", style: TextStyle(color: const Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Karhyl section
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 20),
              child: Text('・Karhyl', style: TextStyle(color: const Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/karhyl_profile.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: Text('Image not found')),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              child: Center(
              child: Text(
                "Karhyl's Instagram (www.instagram.com/krhylselft)",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              ),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/karhyl_profile2.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: Text('Image not found')),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: Center(
              child: Text(
                "Karhyl's Pinterest (pinterest.com/Karhylselft)",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              ),
            ),

            // Trizero section
            Container(
              margin: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
              child: Text('・Trizero', style: TextStyle(color: const Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/trizero_profile.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: Text('Image not found')),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: Center(
              child: Text(
                "Trizero's Instagram (instagram.com/triz3ro)",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              ),
            ),

            // About section
            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 15),
              margin: const EdgeInsets.only(top: 70, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,                
                children: [                  
                  Text('About', style: TextStyle(color: const Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 15, right: 20, bottom: 30),
              child: Text(
                'Update dari GFX App yang dikerjakan pada saat UTS sebelumnya. Terdapat perubahan kecil di mana semua gambar kecuali pada halaman profil ini yang di load bukan diambil dari dalam aplikasinya tetapi dari fetch ke database. Tidak ada perubahan besar pada tampilan aplikasi dan fiturnya karena ada beberapa faktor waktu yang bentrok dan keterbatasan pada device.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.75),
              ),
            ),
        

          ],
        ),
      ),
    );
  }
}