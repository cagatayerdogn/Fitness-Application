import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spor1/features/auth/views/sign_in.dart';
import 'screens/karin_screen.dart';
import 'screens/sirt_screen.dart';
import 'screens/bacak_screen.dart';
import 'screens/gogus_screen.dart';
import 'screens/kol_screen.dart';
import 'activity_screen.dart';
import 'package:spor1/features/auth/controller/auth_controller.dart';
import 'package:spor1/features/auth/repository/auth.repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _formKey = GlobalKey<FormState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOŞ GELDİNİZ!',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Consumer(builder: (context, ref, child) {
            return IconButton(
              icon: const Icon(
                CupertinoIcons.clear_circled,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignIn(),
                          ),
                          (route) => false),
                    );
              },
            );
          }),
        ],
        backgroundColor: const Color.fromARGB(255, 12, 79, 47),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resimler/anamenü4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildGreetingText(),
                const SizedBox(height: 170),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(width: 12),
                  _buildCategoryButton(
                    context,
                    'Aktivitelerim',
                    ActivityScreen(),
                    'resimler/schedule.jpg',
                  ),
                  const SizedBox(width: 12),
                  _buildCategoryButton(
                    context,
                    'Karın\nAntrenmanları',
                    KarinScreen(),
                    'resimler/karin6.jpg',
                  ),
                ]),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryButton(
                      context,
                      'Bacak\nAntrenmanları',
                      BacakScreen(),
                      'resimler/bacak5.jpg',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryButton(
                      context,
                      'Göğüs\nAntrenmanları',
                      GogusScreen(),
                      'resimler/gogus4.jpg',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryButton(
                      context,
                      'Kol\nAntrenmanları',
                      KolScreen(),
                      'resimler/kol6.jpg',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    _buildCategoryButton(
                      context,
                      'Sırt\nAntrenmanları',
                      SirtScreen(),
                      'resimler/sirt6.jpg',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingText() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical:
              10), // Bugün Hangi Antrenmanları Yapmak İstersiniz Yazısının biraz boşlukla görünmesi için
      color: Colors.black.withOpacity(0.3),
      child: const Text(
        'Bugün Hangi Antrenmanları Yapmak İstersiniz?',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String buttonText,
      Widget screen, String imagePath) {
    return ClipOval(
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 12, 79, 47).withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(
                buttonText,
                style: const TextStyle(fontSize: 17, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
