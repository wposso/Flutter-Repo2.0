// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app_crud_v01/screens/screens.dart';
import 'package:flutter/material.dart';

class ListadoUsuariosScreen extends StatefulWidget {
  final List<datosUsuarios> listadoUsuarios;
  final nombreControl;
  final apellidoControl;
  final telefonoControl;
  final direccionControl;
  final Function(int) actualizarUsuarios;
  final Function(int) eliminarUsuarios;
   
  const ListadoUsuariosScreen({
    super.key, 
    required this.listadoUsuarios, 
    this.nombreControl, 
    this.apellidoControl, 
    required this.actualizarUsuarios, 
    required this.eliminarUsuarios, 
    this.telefonoControl, 
    this.direccionControl});

  @override
  State<ListadoUsuariosScreen> createState() => _ListadoUsuariosScreenState();
}

class _ListadoUsuariosScreenState extends State<ListadoUsuariosScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Listado usuarios'),
        centerTitle: true,
        leading: const Icon(Icons.receipt_long_sharp),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView.builder(
          itemCount: widget.listadoUsuarios.length,
          itemBuilder: (context, index) {
            final datos = widget.listadoUsuarios[index];
            return Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 233, 231, 225),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: ListTile(
                            title: Text('${datos.nombre} ${datos.apellido}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                IconButton(
                                  onPressed: (){
                                    widget.nombreControl.text = widget.listadoUsuarios[index].nombre;
                                    widget.apellidoControl.text = widget.listadoUsuarios[index].apellido;

                                    showDialog(
                                      context: context, 
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Editar usuario'),
                                          content: Column(
                                            children: [

                                              const Text('Aquí podrás editar la información de los usuarios.'),
                                              const SizedBox(height: 20,),

                                              TextFormField(
                                                controller: widget.nombreControl,
                                                decoration: const InputDecoration(
                                                  hintText: 'Editar nombre',
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                                  )
                                                ),
                                              ),

                                              const SizedBox(height: 10,),
                                              TextFormField(
                                                controller: widget.apellidoControl,
                                                decoration: const InputDecoration(
                                                  hintText: 'Editar apellido',
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      widget.actualizarUsuarios(index);  
                                                    });
                                                  }, 
                                                  child: Text('Actualizar', style: TextStyle(color: Colors.green[300]),)),

                                                const SizedBox(width: 40,),
                                                TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  }, 
                                                  child: const Text('Cancelar'))
                                              ],
                                            )
                                          ],
                                        );
                                      },);
                                  }, 
                                  icon: const Icon(Icons.edit)),

                                const SizedBox(width: 20,),
                                IconButton(
                                  onPressed: (){
                                    showDialog(
                                      context: context, 
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Editar usuario'),
                                          content: const Text('¿Estas seguro que deseas eliminar este usuario?, no podras recuperarlo despues'),
                                          actions: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      widget.eliminarUsuarios(index);  
                                                    });
                                                  }, 
                                                  child: const Text('Eliminar', style: TextStyle(color: const Color.fromARGB(255, 207, 15, 15)),)),

                                                const SizedBox(width: 40,),
                                                TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  }, 
                                                  child: const Text('Cancelar'))
                                              ],
                                            )
                                          ],
                                        );
                                      },);
                                  }, 
                                  icon: const Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10,)
                      ],
                    );
          },)),

          bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
            topRight: Radius.circular(20))
          ),
          child: Row(
            children: [

              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(Icons.person_add, color: Colors.white, size: 30,))
            ],
          ),
        ),
    );
  }
}
