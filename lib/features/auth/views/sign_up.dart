import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spor1/features/auth/controller/auth_controller.dart';
import 'package:spor1/features/auth/repository/auth.repository.dart';
import 'package:spor1/features/auth/views/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('resimler/kaydol.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 25, // Beyaz kutunun alt kenarının ekrandan 50 piksel yukarıda olmasını sağlar
            child: Container(
              padding:EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.9, // Genişliği ekranın %90'ı olarak ayarlar
              height: MediaQuery.of(context).size.height * 0.52, // Yüksekliği ekranın %30'u olarak ayarlar
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction ,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical:10 ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hesap Oluştur",
                          style:TextStyle(
                          color: Colors.black, 
                          fontSize:24,
                          ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:5),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value){
                            if (value!.isEmpty){
                              return "E-Mail Gerekli";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                            labelText:"E-Mail",
                            border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20) ,
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              
                            ),
                        
                          ) ,
                        
                        
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:5),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value){
                            if (value!.isEmpty){
                              return "Şifre Gerekli";
                            }
                            return null;
                          },
                          decoration:InputDecoration(
                            labelText:"Şifre",
                            border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20) ,
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              
                            ),
                        
                          ) ,
                        
                        
                        ),
                      ),
                        Consumer(
                        builder: (context, ref, child){
                          return                  Padding(
                        padding: const EdgeInsets.symmetric(vertical:5),
                        child: MaterialButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              ref
                              .read(authControllerProvider)
                              .SignUpWithEmailAndPassword(
                                email: _emailController.text, 
                                password: _passwordController.text,
                                ).then((value)=> Navigator.pop(context)
                                );

                            }
                           
                          },
                        shape : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: Colors.black,
                        minWidth: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical:10,
                          ),
                          child: Text (
                            "Giriş Yap",
                            style: TextStyle(
                              color : Colors.white, 
                            ),
                          ),
                        ),
                        ),
                      ) ;
                        },
                      ),
                  

                      Padding(padding: EdgeInsets.symmetric(vertical: 5,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Zaten hesabın var mı?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize : 14,
                            ),
                  
                          ),
                  
                          TextButton(
                            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignIn(),),),
                            child: Text("Giriş Yap",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:12,
                          
                            ) ,
                            
                            ),
                          
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}