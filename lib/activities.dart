import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class KarinScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String calorieInfo;
  final int calorieAmount;
  final String imageAsset;
  final String bodyPart;

  KarinScreenDetail({
    required this.title,
    required this.description,
    required this.calorieInfo,
    required this.calorieAmount,
    required this.imageAsset,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
        ),
        title: Text(title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(imageAsset),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Yakılan Kalori:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              calorieInfo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveActivity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Aktiviteyi Yaptım'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveActivity(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId =
        FirebaseAuth.instance.currentUser!.uid; // Kullanıcı kimliğini al

    try {
      await firestore.collection('activities').add({
        'title': title,
        'description': description,
        'calorieInfo': calorieInfo,
        'calorieAmount': calorieAmount,
        'bodyPart': bodyPart,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, // Kullanıcı kimliğini ekle
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedildi!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedilirken bir hata oluştu: $e')),
      );
    }
  }
}

class SirtScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String calorieInfo;
  final int calorieAmount;
  final String imageAsset;
  final String bodyPart;

  SirtScreenDetail({
    required this.title,
    required this.description,
    required this.calorieInfo,
    required this.calorieAmount,
    required this.imageAsset,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
        ),
        title: Text(title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(imageAsset),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Yakılan Kalori:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              calorieInfo,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveActivity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Aktiviteyi Yaptım'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveActivity(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId =
        FirebaseAuth.instance.currentUser!.uid; // Kullanıcı kimliğini al

    try {
      await firestore.collection('activities').add({
        'title': title,
        'description': description,
        'calorieInfo': calorieInfo,
        'calorieAmount': calorieAmount,
        'bodyPart': bodyPart,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, // Kullanıcı kimliğini ekle
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedildi!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedilirken bir hata oluştu: $e')),
      );
    }
  }
}

class BacakScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String calorieInfo;
  final int calorieAmount;
  final String imageAsset;
  final String bodyPart;

  BacakScreenDetail({
    required this.title,
    required this.description,
    required this.calorieInfo,
    required this.calorieAmount,
    required this.imageAsset,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
        ),
        title: Text(title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(imageAsset),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Yakılan Kalori:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              calorieInfo,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveActivity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Aktiviteyi Yaptım'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveActivity(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId =
        FirebaseAuth.instance.currentUser!.uid; // Kullanıcı kimliğini al

    try {
      await firestore.collection('activities').add({
        'title': title,
        'description': description,
        'calorieInfo': calorieInfo,
        'calorieAmount': calorieAmount,
        'bodyPart': bodyPart,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, // Kullanıcı kimliğini ekle
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedildi!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedilirken bir hata oluştu: $e')),
      );
    }
  }
}

class GogusScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String calorieInfo;
  final int calorieAmount;
  final String imageAsset;
  final String bodyPart;

  GogusScreenDetail({
    required this.title,
    required this.description,
    required this.calorieInfo,
    required this.calorieAmount,
    required this.imageAsset,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
        ),
        title: Text(title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(imageAsset),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Yakılan Kalori:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              calorieInfo,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveActivity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Aktiviteyi Yaptım'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveActivity(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId =
        FirebaseAuth.instance.currentUser!.uid; // Kullanıcı kimliğini al

    try {
      await firestore.collection('activities').add({
        'title': title,
        'description': description,
        'calorieInfo': calorieInfo,
        'calorieAmount': calorieAmount,
        'bodyPart': bodyPart,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, // Kullanıcı kimliğini ekle
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedildi!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedilirken bir hata oluştu: $e')),
      );
    }
  }
}

class KolScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String calorieInfo;
  final int calorieAmount;
  final String imageAsset;
  final String bodyPart;

  KolScreenDetail({
    required this.title,
    required this.description,
    required this.calorieInfo,
    required this.calorieAmount,
    required this.imageAsset,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
        ),
        title: Text(title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(imageAsset),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Yakılan Kalori:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              calorieInfo,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveActivity(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Aktiviteyi Yaptım'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveActivity(BuildContext context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId =
        FirebaseAuth.instance.currentUser!.uid; // Kullanıcı kimliğini al

    try {
      await firestore.collection('activities').add({
        'title': title,
        'description': description,
        'calorieInfo': calorieInfo,
        'calorieAmount': calorieAmount,
        'bodyPart': bodyPart,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': userId, // Kullanıcı kimliğini ekle
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedildi!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivite kaydedilirken bir hata oluştu: $e')),
      );
    }
  }
}