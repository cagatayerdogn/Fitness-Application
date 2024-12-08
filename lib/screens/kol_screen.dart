import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spor1/activities.dart';  

class KolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kol Antrenmanları'),
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
                image: AssetImage('resimler/kol.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              _buildButton(
                context,
                title: 'Biceps Curl',
                description:
                    'Biceps curl, biceps kaslarınızı hedefleyen bir egzersizdir. Biceps curl, dumbbellları avuç içleriniz vücudunuza bakacak şekilde tutup, dirseklerinizi sabit tutarak yavaşça omuzlarınıza doğru kaldırıp indirerek yapılan bir egzersizdir.',
                calorieInfo:
                    '10 dakika boyunca biceps curl hareketi yaparak yaklaşık 60 kalori yakabilirsiniz.',
                calorieAmount: 60,
                color: Colors.blue,
                imageAsset: 'resimler/bicepscurl.jpg',
                bodyPart: 'Kol',
              ),
              _buildButton(
                context,
                title: 'Triceps Dip',
                description:
                    'Triceps dip, triceps kaslarını güçlendiren bir egzersizdir. Bench veya paralel çubuk üzerinde vücudunuzu yukarı ve aşağı indirerek yapılır.',
                calorieInfo:
                    '10 dakika boyunca triceps dip hareketi yaparak yaklaşık 70 kalori yakabilirsiniz.',
                calorieAmount: 70,
                color: Colors.green,
                imageAsset: 'resimler/tricepsdip.jpg',
                bodyPart: 'Kol',
              ),
              _buildButton(
                context,
                title: 'Hammer Curl',
                description:
                    'Hammer curl, biceps ve ön kol kaslarını çalıştıran bir egzersizdir. Hammer curl, her iki elde birer dumbbell tutularak yapılan bir biceps egzersizidir; avuç içleri vücuda bakacak şekilde dirsekleri sabit tutarak kolları yavaşça kaldırıp indirerek yapılan bir harekettir.',
                calorieInfo:
                    '10 dakika boyunca hammer curl hareketi yaparak yaklaşık 50 kalori yakabilirsiniz.',
                calorieAmount: 50,
                color: Colors.orange,
                imageAsset: 'resimler/hammercurl.jpg',
                bodyPart: 'Kol',
              ),
              _buildButton(
                context,
                title: 'Push-down',
                description:
                    'Push-down, triceps kaslarını güçlendiren bir egzersizdir. Kablo makinesi veya direnç bandı ile yapılan bu hareket, dirseklerinizi düz bir çizgi boyunca aşağı doğru itmenizi sağlar.',
                calorieInfo:
                    '10 dakika boyunca push-down hareketi yaparak yaklaşık 65 kalori yakabilirsiniz.',
                calorieAmount: 65,
                color: Colors.purple,
                imageAsset: 'resimler/pushdown.jpg',
                bodyPart: 'Kol',
              ),
              _buildButton(
                context,
                title: 'Barbell Curl',
                description:
                    'Barbell curl, biceps kaslarınızı hedefleyen temel bir egzersizdir. Barbell ile yapılan bu hareket, dirseklerinizi bükerek ağırlığı omuz hizasına kadar kaldırmanızı sağlar.',
                calorieInfo:
                    '10 dakika boyunca barbell curl hareketi yaparak yaklaşık 55 kalori yakabilirsiniz.',
                calorieAmount: 55,
                color: Colors.teal,
                imageAsset: 'resimler/barbellcurl.jpg',
                bodyPart: 'Kol',
              ),
              _buildButton(
                context,
                title: 'Dumbbell Triceps Extension',
                description:
                    'Dumbbell triceps extension, triceps kaslarını güçlendiren bir egzersizdir. Dumbbell Triceps Extension, bir dumbbellı iki elle başınızın arkasında tutarak dirseklerinizi sabit tutup kollarınızı düz bir şekilde yukarı kaldırıp indirerek yapılan bir triceps egzersizidir.',
                calorieInfo:
                    '10 dakika boyunca dumbbell triceps extension hareketi yaparak yaklaşık 75 kalori yakabilirsiniz.',
                calorieAmount: 75,
                color: Colors.red,
                imageAsset: 'resimler/dumbbelltricepsextension.jpg',
                bodyPart: 'Kol',
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
              builder: (context) => KolScreenDetail(
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
