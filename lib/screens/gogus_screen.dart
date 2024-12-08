import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor1/activities.dart';

class GogusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Göğüs Antrenmanları'),
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
                image: AssetImage('resimler/gogus.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
      ListView(
        children: [
          _buildButton(
            context,
            title: 'Bench Press',
            description:
                'Bench press hareketi göğüs kaslarını çalıştırmak için mükemmel bir egzersizdir. Bench üzerinde sırtüstü uzanın, ağırlık barını göğsünüze indirin ve tekrar yukarı itin.',
            calorieInfo:
                '10 dakika boyunca bench press hareketi yaparak yaklaşık 70 kalori yakabilirsiniz.',
                calorieAmount: 70,
            color: Colors.blue,
            imageAsset: 'resimler/benchpress.jpg',
            bodyPart: 'Göğüs',
          ),
          _buildButton(
            context,
            title: 'Dumbbell Fly',
            description:
                'Dumbbell fly, göğüs kaslarınızı genişletmek ve şekillendirmek için etkili bir egzersizdir. Dumbbellı göğsünüzün üzerinde açarak yavaşça aşağı indirin, ardından tekrar yukarı kaldırın.',
            calorieInfo:
                '10 dakika boyunca dumbbell fly hareketi yaparak yaklaşık 60 kalori yakabilirsiniz.',
                calorieAmount: 60,
            color: Colors.green,
            imageAsset: 'resimler/dumbbellfly.jpg',
            bodyPart: 'Göğüs',
          ),
          _buildButton(
            context,
            title: 'Push-up',
            description:
                'Push-up, göğüs kaslarınızı güçlendirmenin yanı sıra kol ve omuz kaslarını da çalıştıran temel bir egzersizdir. Vücudunuzu düz bir çizgi oluşturacak şekilde yere paralel olarak tutun, göğsünüzü yere doğru indirin ve yukarı itin.',
            calorieInfo:
                '10 dakika boyunca push-up hareketi yaparak yaklaşık 50 kalori yakabilirsiniz.',
                calorieAmount: 50,
            color: Colors.orange,
            imageAsset: 'resimler/pushup.jpg',
            bodyPart: 'Göğüs',
          ),
          _buildButton(
            context,
            title: 'Chest Dip',
            description:
                'Chest dip, özellikle üst göğüs kaslarını güçlendirmek için etkili bir egzersizdir. Paralel çubuklara asılıp dirsekleri büküp vücudu aşağı indirerek ve göğüs kaslarını çalıştırmak için üst vücudu hafifçe öne eğip kolları tekrar düzleştirerek yapılır.',
            calorieInfo:
                '10 dakika boyunca chest dip hareketi yaparak yaklaşık 80 kalori yakabilirsiniz.',
                calorieAmount: 80,
            color: Colors.purple,
            imageAsset: 'resimler/chestdip.jpg',
            bodyPart: 'Göğüs',
          ),
          _buildButton(
            context,
            title: 'Incline Bench Press',
            description:
                'Incline bench press, üst göğüs kaslarınızı hedefleyen bir egzersizdir. Benchin eğimli bölümünde sırtüstü uzanarak ağırlık barını göğsünüze indirip yukarı kaldırın.',
            calorieInfo:
                '10 dakika boyunca incline bench press hareketi yaparak yaklaşık 65 kalori yakabilirsiniz.',
                calorieAmount: 65,
            color: Colors.teal,
            imageAsset: 'resimler/inclinebenchpress.jpg',
            bodyPart: 'Göğüs',
          ),
          _buildButton(
            context,
            title: 'Cable Crossover',
            description:
                'Cable crossover, göğüs kaslarınızı çapraz hareketlerle çalıştırmak için ideal bir egzersizdir. Cable crossover, iki kablo istasyonu arasına geçerek makaralı kabloları kavrayıp kollarınızı geniş bir pozisyondan öne doğru getirerek göğüs kaslarınıza direnç uygulayarak yapılan bir egzersizdir.',
            calorieInfo:
                '10 dakika boyunca cable crossover hareketi yaparak yaklaşık 55 kalori yakabilirsiniz.',
                calorieAmount: 55,
            color: Colors.red,
            imageAsset: 'resimler/cablecrossover.jpg',
            bodyPart: 'Göğüs',
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