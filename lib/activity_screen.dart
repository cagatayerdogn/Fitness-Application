import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = FirebaseAuth.instance.currentUser!.uid;

    void _resetActivities() {
      firestore.collection('activities')
          .where('userId', isEqualTo: userId)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete(); // Her bir aktiviteyi siliyor
        });
      })
      .catchError((error) {
        print("Hata oluştu: $error");
        // Hata durumunda kullanıcıya bilgi veriyor
      });
    }

    void _showResetConfirmationDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Aktiviteleri Sıfırla"),
            content: Text("Tüm aktivitelerinizi sıfırlamak istediğinizden emin misiniz? Bu işlem geri alınamaz."),
            actions: <Widget>[
              TextButton(
                child: Text("İptal"),
                onPressed: () {
                  Navigator.of(context).pop(); // Dialog kapat
                },
              ),
              TextButton(
                child: Text("Sıfırla"),
                onPressed: () {
                  _resetActivities(); // Aktiviteleri sıfırla fonksiyonunu çağır
                  Navigator.of(context).pop(); // Dialog kapat
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitelerim'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        
        actions: [
          
          IconButton(
            icon: Icon(CupertinoIcons.refresh, color: Colors.white,),
            onPressed: () {
              _showResetConfirmationDialog(context); // Sıfırlama onayı için uyarı dialogu
            },
          ),
        ],
        leading: IconButton(onPressed:() {Navigator.of(context).pop();}, icon: Icon(CupertinoIcons.arrow_left, color: Colors.white,))
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('activities')
            .where('userId', isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}', style: TextStyle(color: Colors.white)));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Henüz kayıtlı aktivite yok.', style: TextStyle(color: Colors.white)));
          }

          var activities = snapshot.data!.docs;

          // Günlere göre aktiviteleri gruplandırma
          Map<String, Map<String, dynamic>> groupedActivities = {};

          activities.forEach((activity) {
            var data = activity.data() as Map<String, dynamic>;
            var timestamp = data['timestamp'];
            if (timestamp != null) {
              var date = (timestamp as Timestamp).toDate().toString().split(' ')[0];
              var bodyPart = data['bodyPart'] ?? 'Bilinmiyor';
              var title = data['title'] ?? '-';
              var calorieAmount = data['calorieAmount'] ?? 0;

              if (!groupedActivities.containsKey(date)) {
                groupedActivities[date] = {};
              }

              if (!groupedActivities[date]!.containsKey(bodyPart)) {
                groupedActivities[date]![bodyPart] = {'titles': <Map<String, dynamic>>[], 'calorieAmount': calorieAmount};
              }
              
              groupedActivities[date]![bodyPart]!['titles'].add({'title': title, 'timestamp': timestamp});
              groupedActivities[date]![bodyPart]!['calorieAmount'] += calorieAmount;
            } else {
              print('Missing timestamp in activity: ${activity.id}');
            }
          });

          List<Color> colors = [
            Colors.red.withOpacity(0.3),
            Colors.green.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
            Colors.yellow.withOpacity(0.3),
            Colors.purple.withOpacity(0.3),
            Colors.orange.withOpacity(0.3),
            Colors.teal.withOpacity(0.3),
          ];

          var sortedDates = groupedActivities.keys.toList();
          sortedDates.sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a))); // Yapılma zamanlarına göre sıraladım
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: sortedDates.map((date) {
              var activitiesByDate = groupedActivities[date]!;
              int totalCalories = 0;

              List<Widget> bodyPartWidgets = [];

              ['Bacak', 'Göğüs', 'Karın', 'Kol', 'Sırt'].forEach((bodyPart) {
                var titles = '-';
                var calorieAmount = 0;

                if (activitiesByDate.containsKey(bodyPart)) {
                  var titlesList = (activitiesByDate[bodyPart]!['titles'] as List<Map<String, dynamic>>);
                  titlesList.sort((a, b) => (a['timestamp'] as Timestamp).compareTo(b['timestamp']));
                  titles = titlesList.map((item) => item['title']).join(', ');
                  calorieAmount = activitiesByDate[bodyPart]!['calorieAmount'];
                  totalCalories += calorieAmount;
                }

                bodyPartWidgets.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$bodyPart: $titles', style: TextStyle(color: Colors.white)),
                    Text('Kalori: $calorieAmount', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 8),
                  ],
                ));
              });

              var colorIndex = sortedDates.indexOf(date) % colors.length;
              var containerColor = colors[colorIndex];

              return Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(bottom: 16.0),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gün: $date',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ...bodyPartWidgets,
                    Text(
                      'Toplam Yakılan Kalori: $totalCalories',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
