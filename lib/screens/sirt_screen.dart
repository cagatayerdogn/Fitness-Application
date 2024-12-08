import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor1/activities.dart';

class SirtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sırt Antrenmanları'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        leading: IconButton(onPressed:() {Navigator.of(context).pop();}, icon: Icon(CupertinoIcons.arrow_left, color: Colors.white,))
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resimler/sirt.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              _buildButton(
                context,
                title: 'Deadlift',
                description:
                    'Deadlift hareketi sırt kaslarını çalıştırmak için mükemmel bir egzersizdir. Ağırlık barını yerden kaldırmak için bacaklarınızı ve sırtınızı kullanarak doğrulun. Barı yere indirirken kontrollü olun.',
                calorieInfo:
                    '10 dakika boyunca deadlift hareketi yaparak yaklaşık 100 kalori yakabilirsiniz.',
                    calorieAmount: 100,
                color: Colors.blue,
                imageAsset: 'resimler/deadlift.jpg',
                bodyPart: 'Sırt',
              ),
              _buildButton(
                context,
                title: 'Pull-up',
                description:
                    'Pull-up, sırt kaslarınızı ve kollarınızı güçlendirmek için etkili bir egzersizdir. Çubuğa asılıp vücudu yukarı doğru çekerek yapılır.',
                calorieInfo:
                    '10 dakika boyunca pull-up hareketi yaparak yaklaşık 70 kalori yakabilirsiniz.',
                    calorieAmount: 70,
                color: Colors.green,
                imageAsset: 'resimler/pullup.jpg',
                bodyPart: 'Sırt',
              ),
              _buildButton(
                context,
                title: 'Barbell Row',
                description:
                    'Barbell row, sırt kaslarınızı ve omuzlarınızı güçlendirmek için kullanılan bir egzersizdir. Barbell row yapmak için, ayaklar omuz genişliğinde açık ve dizler hafif bükülü şekilde belden öne eğilerek halteri omuz genişliğinde tutup, dirsekleri vücuda yakın tutarak gövdeye doğru çekin ve sırt kaslarınızı sıkıştırın.',
                calorieInfo:
                    '10 dakika boyunca barbell row hareketi yaparak yaklaşık 80 kalori yakabilirsiniz.',
                    calorieAmount: 80,
                color: Colors.orange,
                imageAsset: 'resimler/barbellrow.jpg',
                bodyPart: 'Sırt',
              ),
              _buildButton(
                context,
                title: 'Lat Pulldown',
                description:
                    'Lat pulldown, sırt kaslarınızı genişletmek ve güçlendirmek için kullanılan bir egzersizdir. Lat pulldown yapmak için, makinede oturarak dizlerinizi pedlerin altına sıkıştırın, barı geniş bir tutuşla kavrayın, ardından barı göğsünüzün üst kısmına çekip sırt kaslarınızı sıkıştırarak kontrollü bir şekilde başlangıç pozisyonuna geri dönün.',
                calorieInfo:
                    '10 dakika boyunca lat pulldown hareketi yaparak yaklaşık 60 kalori yakabilirsiniz.',
                    calorieAmount: 60,
                color: Colors.purple,
                imageAsset: 'resimler/latpulldown.jpg',
                bodyPart: 'Sırt',
              ),
              _buildButton(
                context,
                title: 'T-bar Row',
                description:
                    'T-bar row, sırt kaslarınızı ve arka omuzlarınızı hedefleyen bir egzersizdir. T-bar row yapmak için, ayaklarınızı omuz genişliğinde açarak hafifçe dizlerinizi bükün, belden öne doğru eğilin, barı sıkıca kavrayın, ardından dirseklerinizi vücuda yakın tutarak barı gövdenize doğru çekip sırt kaslarınızı sıkıştırın.',
                calorieInfo:
                    '10 dakika boyunca T-bar row hareketi yaparak yaklaşık 90 kalori yakabilirsiniz.',
                    calorieAmount: 90,
                color: Colors.teal,
                imageAsset: 'resimler/tbarrow.jpg',
                bodyPart: 'Sırt',
              ),
              _buildButton(
                context,
                title: 'Dumbbell Row',
                description:
                    'Dumbbell row, sırt kaslarınızı hedefleyen bir egzersizdir ve dambıl kullanılarak yapılır. Dumbbell row yapmak için, bir dizinizi ve aynı taraftaki elinizi bench üzerine yerleştirerek diğer ayağınızı yere sağlam basın, boşta kalan elinizle dumbbellı tutun, ardından dirseğinizi vücudunuza yakın tutarak dumbbellı gövdenize doğru çekip sırt kaslarınızı sıkıştırarak başlangıç pozisyonuna geri dönün.',
                calorieInfo:
                    '10 dakika boyunca dumbbell row hareketi yaparak yaklaşık 75 kalori yakabilirsiniz.',
                    calorieAmount: 75,
                color: Colors.red,
                imageAsset: 'resimler/dumbbellrow.jpg',
                bodyPart: 'Sırt',
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