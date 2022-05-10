import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddServices extends StatefulWidget {
  static const String id = "add_services";
  const AddServices({Key? key}) : super(key: key);

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {

  late XFile _selectedFile;
  final ImagePicker _picker = ImagePicker();
  String _selectedFileName = "";
  String _upLoadedPath = "";
  bool _isLoading = false;

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Davron');


  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black38,
        title: const Text("Ma'lumot kiritish",style: TextStyle(
            fontSize: 30,
            color: Colors.green,
          fontWeight: FontWeight.w400
        ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/auto.png"),
                fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(height: 100,),
              TextField(
                style: const TextStyle(color: Colors.cyanAccent),
                  controller: nameController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white12,
                    filled: true,
                    labelText: "Nomi",
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                  ),
                ),
              const SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.cyanAccent),
                controller: priceController,
                decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  labelText: "Narxi",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyanAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.cyanAccent),
                controller: textController,
                decoration: const InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  labelText: "Sharx",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyanAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white12
                ),
                child: Center(
                  child: _selectedFileName==""
                      ?
                  IconButton(
                    onPressed: (){
                      funSelectFile();
                    },
                    iconSize: 25,
                    color: Colors.grey,
                    icon: const Icon(Icons.add))
                      :
                  Image.file(File(_selectedFile.path))
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    uploadFile(_selectedFile).then((value){
                      createData(
                        name: nameController.text.trim(),
                        price: priceController.text.trim(),
                        text: textController.text.trim(),
                        url: value
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text("Kiritish",style: TextStyle(fontSize: 25),),
                ),
              )

            ],),
          ),
        ),
      ),
    );
  }
  // Galereyadan o'qish
  Future<void> funSelectFile()async{
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedFile = img!;
      _selectedFileName = img.name.toString();
    });
  }

  // Serverga jo'natish 2 - usul Jo'natilgan rasm nomi o'zgarib boradi
  Future<String> uploadFile(XFile xFile)async{
    String fileNameHour = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = _firebaseStorage
        .ref()
        .child('PictureService')
        .child(fileNameHour);
    UploadTask uploadTask = reference.putFile(File(xFile.path));
    uploadTask.snapshotEvents.listen((event) {
      setState(() {
        _isLoading = true;
      });
    });

    await uploadTask.whenComplete(() async {
      _upLoadedPath = await uploadTask.snapshot.ref.getDownloadURL();
      print(_upLoadedPath);
      setState(() {
        _isLoading = false;
      });
    });
    return _upLoadedPath;
  }

  void createData({name, price, text, url}){
    String? key = databaseRef.child('CarWashCenter').child('Services').push().key;
    databaseRef.child('CarWashCenter').child('Services').push().set({
      'id':key,
      'name':name,
      'price':price,
      'text':text,
      'url':url
    });
    nameController.clear();
    priceController.clear();
    textController.clear();
  }

}
