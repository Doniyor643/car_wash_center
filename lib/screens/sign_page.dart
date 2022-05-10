import 'package:car_wash_center/screens/home_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  static const String id = 'sign_page';
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool variant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.black,
              Colors.teal.shade900
            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 300,
                      color: Colors.cyan,
                    ),
                    const Text('C.W.C',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 65,
                      color: Colors.cyanAccent
                    ),),
                    Container(
                      height: 1,
                      width: 300,
                      color: Colors.cyan,
                    ),
                    const SizedBox(height: 10,),
                    const Text('Car Wash Center',style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                        color: Colors.cyanAccent
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  variant
                      ?
                  // name
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.cyan),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyanAccent, width: 2.0),)
                    ),
                  )
                      :
                  Container(),

                  //email
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.cyan),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyanAccent, width: 2.0),)
                    ),
                  ),
                  const SizedBox(height: 15,),

                  //parol
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        labelText: "Parol",
                        labelStyle: TextStyle(color: Colors.cyan),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyanAccent, width: 2.0),)
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black12,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black12
                        ),
                        child: variant
                            ?
                        const Text("Ro'yxatdan o'tish",style: TextStyle(
                            fontSize: 25,
                            color: Colors.cyanAccent
                        ),)
                            :
                        const Text("Kirish",style: TextStyle(
                            fontSize: 25,
                            color: Colors.cyanAccent
                        ),)
                    ),
                  ),
                ],),
              ),

              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  variant
                  ?
                  const Text("Ro'yxatdan o'tgan bo'lsangiz",style: TextStyle(
                      color: Colors.cyan
                  ),)
                  :
                  const Text("Ro'yxatdan o'tmagan bo'lsangiz",style: TextStyle(
                      color: Colors.cyan
                  ),),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          variant = !variant;
                        });
                      },
                      child: variant
                            ?
                      const Text("Tizimga kiring",style: TextStyle(
                          color: Colors.cyanAccent
                      ),)
                          :
                      const Text("Ro'yxatdan o'ting",style: TextStyle(
                          color: Colors.cyanAccent
                      ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
