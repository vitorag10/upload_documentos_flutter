import 'package:flutter/material.dart';
import '../page/pgUpload.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/pgUpload',
      routes: {
        '/pgUpload' : (context) => PguploadPage()
      },
    );
  }
}