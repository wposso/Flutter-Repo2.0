
import 'package:flutter/material.dart';

class InicioSesionScreen extends StatefulWidget {
   
  const InicioSesionScreen({super.key});

  @override
  State<InicioSesionScreen> createState() => _InicioSesionScreenState();
}

class _InicioSesionScreenState extends State<InicioSesionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        foregroundColor: Colors.white,
        title: const Text('Iniciar sesión'),
        centerTitle: true,
      ),
      body: const Padding(padding: EdgeInsets.all(25),
      child: Column(
        children: [

          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Apellido',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),

          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Telefono',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),

          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Dirección',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),

          SizedBox(height: 50,),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(),
            onPressed: null, 
            child: Text('Registrar'))
        ],
      ),)
    );
  }
}