import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor1/activities.dart';

class BacakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bacak Antrenmanları'),
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
                image: AssetImage('resimler/bacak.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              _buildButton(
                context,
                title: 'Squat',
                description:
                    'Squat hareketi bacak kaslarını çalıştırmak için mükemmel bir egzersizdir. Ayaklarınızı omuz genişliğinde açarak çömelme hareketi yapın ve tekrar doğrulun.',
                calorieInfo:
                    '10 dakika boyunca squat hareketi yaparak yaklaşık 80 kalori yakabilirsiniz.',
                calorieAmount: 80,
                color: Colors.blue,
                imageAsset: 'resimler/squat.jpg',
                bodyPart: 'Bacak',
              ),
              _buildButton(
                context,
                title: 'Lunges',
                description:
                    'Lunges hareketi bacakların ön ve arka bölümlerini güçlendirmek için etkili bir egzersizdir. Adımlar atarak tek bacakla öne doğru eğilin, ardından diğer bacakla tekrarlayın.',
                calorieInfo:
                    '10 dakika boyunca lunges hareketi yaparak yaklaşık 70 kalori yakabilirsiniz.',
                calorieAmount: 70,
                color: Colors.green,
                imageAsset: 'resimler/lunges.jpg',
                bodyPart: 'Bacak',
              ),
              _buildButton(
                context,
                title: 'Bulgarian Split Squat',
                description:
                    'Bulgarian split squat, bacak kaslarınızı güçlendirmenin yanı sıra denge ve esnekliğinizi de artıran bir egzersizdir. Bir bacağınızı arkaya doğru uzatarak diğer bacakla çömelin, ardından doğrulun.',
                calorieInfo:
                    '10 dakika boyunca Bulgarian split squat hareketi yaparak yaklaşık 70 kalori yakabilirsiniz.',
                calorieAmount: 70,
                color: Colors.orange,
                imageAsset: 'resimler/bulgariansplitsquat.jpg',
                bodyPart: 'Bacak',
              ),
              _buildButton(
                context,
                title: 'Leg Press',
                description:
                    'Leg press, bacak kaslarınızı güçlendirmenin yanı sıra kalça ve uyluk kaslarını da hedefleyen bir egzersizdir. Makine üzerinde oturarak bacaklarınızı iterek ağırlık kaldırma işlemi yapılır.',
                calorieInfo:
                    '10 dakika boyunca leg press hareketi yaparak yaklaşık 90 kalori yakabilirsiniz.',
                calorieAmount: 90,
                color: Colors.purple,
                imageAsset: 'resimler/legpress.jpg',
                bodyPart: 'Bacak',
              ),
              _buildButton(
                context,
                title: 'Calf Raise',
                description:
                    'Calf raise, baldırlarınızı güçlendirmek için yapılan bir egzersizdir. Ayaklarınızın ön kısmını yükseltmek suretiyle ayak parmaklarınız üzerine çıkın ve tekrar indirin.',
                calorieInfo:
                    '10 dakika boyunca calf raise hareketi yaparak yaklaşık 50 kalori yakabilirsiniz.',
                calorieAmount: 50,
                color: Colors.teal,
                imageAsset: 'resimler/calfraise.jpg',
                bodyPart: 'Bacak',
              ),
              _buildButton(
                context,
                title: 'Step-up',
                description:
                    'Step-up, bacaklarınızı güçlendirmek ve kalori yakmak için etkili bir egzersizdir. Yüksek bir platforma tek bacakla çıkın ve inin, ardından diğer bacakla tekrarlayın.',
                calorieInfo:
                    '10 dakika boyunca step-up hareketi yaparak yaklaşık 60 kalori yakabilirsiniz.', // Bu bilgiyi direkt olarak string olarak geçiriyoruz
                calorieAmount:
                    60, // Kalori miktarını integer olarak geçiriyoruz
                color: Colors.red,
                imageAsset: 'resimler/stepup.jpg',
                bodyPart: 'Bacak',
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
