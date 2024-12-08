import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor1/activities.dart';

class KarinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Karın Antrenmanları'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ))),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resimler/karin.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              _buildButton(
                context,
                title: 'Mekik',
                description:
                    'Mekik hareketi karın kaslarını çalıştırmak için mükemmel bir egzersizdir. Yere sırt üstü uzanın, dizlerinizi bükün ve ayaklarınızı yere düz basın. Ellerinizi başınızın arkasında birleştirin. Karın kaslarınızı sıkarak üst gövdenizi yukarı kaldırın ve tekrar yere indirin.',
                calorieInfo:
                    '10 dakika boyunca mekik hareketi yaparak yaklaşık 50 kalori yakabilirsiniz.',
                color: Colors.blue,
                calorieAmount: 50,
                imageAsset: 'resimler/mekik.jpg',
                bodyPart: 'Karın',
              ),
              _buildButton(
                context,
                title: 'Plank',
                description:
                    'Plank, karın kaslarınızı güçlendirmenin yanı sıra omuz ve sırt kaslarınızı da çalıştıran etkili bir egzersizdir. Yere yüz üstü uzanın ve vücudunuzu kollarınızın üzerine doğru kaldırın. Vücudunuz bir düz çizgi olacak şekilde dizlerinizi ve dirseklerinizi kırmadan sabit tutun.',
                calorieInfo:
                    '10 dakika boyunca plank pozisyonunda durarak yaklaşık 70 kalori yakabilirsiniz.',
                calorieAmount: 70,
                color: Colors.green,
                imageAsset: 'resimler/plank2.jpg',
                bodyPart: 'Karın',
              ),
              _buildButton(
                context,
                title: 'Leg Raise',
                description:
                    'Leg raise, alt karın kaslarını güçlendirmek için etkili bir egzersizdir. Sırt üstü uzanın, ellerinizi kalçalarınızın altına koyun ve bacaklarınızı kaldırarak vücudunuzla bir düz çizgi oluşturun. Bacaklarınızı yavaşça indirin ve tekrar kaldırın.',
                calorieInfo:
                    '10 dakika boyunca leg raise hareketi yaparak yaklaşık 60 kalori yakabilirsiniz.',
                calorieAmount: 60,
                color: Colors.orange,
                imageAsset: 'resimler/legraise.jpg',
                bodyPart: 'Karın',
              ),
              _buildButton(
                context,
                title: 'Crunch',
                description:
                    'Crunch, üst karın kaslarını çalıştırmak için etkili bir egzersizdir. Sırt üstü uzanın, dizlerinizi bükün ve ayaklarınızı yere düz basın. Ellerinizi başınızın arkasında birleştirin ve karın kaslarınızı sıkarak omuzlarınızı yere doğru kaldırın.',
                calorieInfo:
                    '10 dakika boyunca crunch hareketi yaparak yaklaşık 55 kalori yakabilirsiniz.',
                calorieAmount: 55,
                color: Colors.purple,
                imageAsset: 'resimler/crunch.jpg',
                bodyPart: 'Karın',
              ),
              _buildButton(
                context,
                title: 'Mountain Climber',
                description:
                    'Mountain climber, karın kaslarınızı güçlendirmenin yanı sıra kardiyovasküler sistemizi de harekete geçiren bir egzersizdir. Plank pozisyonunda elleriniz ve ayaklarınızla desteklenin. Sırayla her iki dizinizi de göğsünüze doğru çekin.',
                calorieInfo:
                    '10 dakika boyunca mountain climber yaparak yaklaşık 80 kalori yakabilirsiniz.',
                calorieAmount: 80,
                color: Colors.teal,
                imageAsset: 'resimler/mountainclimbers.jpg',
                bodyPart: 'Karın',
              ),
              _buildButton(
                context,
                title: 'Russian Twist',
                description:
                    'Russian twist, yan karın kaslarınızı güçlendiren ve dengeyi artıran bir egzersizdir. Oturarak yerde dizlerinizi bükün ve vücudunuzla bir 45 derece açı oluşturun. Ellerinizi göğsünüzün önünde birleştirin ve vücudunuzu sağa sola döndürün.',
                calorieInfo:
                    '10 dakika boyunca russian twist yaparak yaklaşık 65 kalori yakabilirsiniz.',
                calorieAmount: 65,
                color: Colors.red,
                imageAsset: 'resimler/russiantwist.jpg',
                bodyPart: 'Karın',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title,
      required String description,
      required String calorieInfo,
      required int calorieAmount,
      required Color color,
      required String imageAsset,
      required String bodyPart}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return color.withOpacity(0.8);
              }
              return color.withOpacity(0.7);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BacakScreenDetail(
                title: title,
                description: description,
                calorieInfo: calorieInfo,
                calorieAmount: calorieAmount,
                imageAsset: imageAsset,
                bodyPart: bodyPart,
              ),
            ),
          );
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
