
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InicioSesionScreen extends StatefulWidget {

  final VoidCallback loginMethod;
  final nombreControl;
  final apellidoControl;
   
  const InicioSesionScreen({
    super.key, 
    required this.loginMethod, 
    this.nombreControl, 
    this.apellidoControl});

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
      body: Padding(padding: const EdgeInsets.all(25),
      child: Column(
        children: [

          const SizedBox(height: 20,),
          TextField(
            controller: widget.nombreControl,
            decoration: const InputDecoration(
              label: Text('Nombre'),
              hintText: 'Nombre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),

          const SizedBox(height: 10,),
          TextField(
            controller: widget.apellidoControl,
            decoration: const InputDecoration(
              label: Text('Apellido'),
              hintText: 'Apellido',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              )
            ),
          ),
          
          const SizedBox(height: 50,),
          ElevatedButton(
            // style: ElevatedButton.styleFrom(),
            onPressed: (){
              widget.loginMethod;
            }, 
            child: Text('Registrar'))
        ],
      ),)
    );
  }
}