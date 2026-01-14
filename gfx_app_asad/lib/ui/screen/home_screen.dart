import 'package:flutter/material.dart';
import '../widget/creators_pick.dart';
import '../widget/asarumu_gfx.dart';
import '../widget/karhyl_gfx.dart';
import '../widget/trizero_gfx.dart';
import '../widget/remote_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: const Color(0xFF67C090),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: const Color(0xFFF7F7F7)),
                  Text('GFX App V2',
                      style: TextStyle(
                          color: const Color(0xFFF7F7F7),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.account_circle_outlined, color: const Color(0xFFF7F7F7), size: 35),
                ],
              ),
            ),

            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFFFAF7F3),
              margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Images from Supabase',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            
            const RemoteGallery(),


            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFFFAF7F3),
              margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Creator Picks',
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: const Color(0xFF333333)),
                ],
              ),
            ),

            const CreatorsPick(),

            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFFFAF7F3),
              margin: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Asarumu's Best Picks",
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: const Color(0xFF333333)),
                ],
              ),
            ),

            const AsarumuGFX(),

            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFFFAF7F3),
              margin: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Karhyl.'s Best Picks",
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: const Color(0xFF333333)),
                ],
              ),
            ),

            const KarhylGFX(),

            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xFFFAF7F3),
              margin: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Triz3ro's Best Picks",
                      style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: const Color(0xFF333333)),
                ],
              ),
            ),

            const TrizeroGFX(),
            
          ],
        ),
      ),
    );
  }
}