import 'package:ejercicio01/pages/crear_tarea_page.dart';
import 'package:flutter/material.dart';

import '../models/tarea.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //1.Necesitamos un lista de tareas
  List<Tarea> tareasList = [];
  Tarea? tarea;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        actions: [
          Text(contador.toString())
        ],
      ),
      body:_devolverWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //Navegar a la otra pagina donde insertaremos tareas
          //1.Necesitamos una variable de tipo Tarea para guardar
          // la tarea que me devuelva la otra pagina
          tarea = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => CrearTareaPage() )
          );
          if(tarea != null){
            setState(() {
              //Lo añadimos a la lista
              tareasList.add(tarea!);
              contador = tareasList.where((tarea) => !tarea.completada).length;
            });
          }

        },
      ),
    );
  }

  Widget _devolverWidget() {
    if(tareasList.isEmpty){
      return const Center(
        child: Text('No existen tareas en la lista'),
      );
    }
    return ListView.builder(
        itemCount: tareasList.length,
        itemBuilder: (context, int i){// (i = 0; i< tareasList.length; i++)



          return ListTile(
            leading: IconButton(
              icon: const Icon(Icons.remove_circle_outlined, color:  Colors.red,),
              onPressed: (){
                //Borrar la tarea de la lista
                setState(() {
                  tareasList.removeAt(i);
                  //Devuelve una lista que satisfaga  la logica interna del where
                  // en este caso que completa = false;
                  contador = tareasList.where((tarea) => !tarea.completada).length;
                });
              },
            ),
            title: Text(tareasList[i].nombre),
            subtitle: Text(tareasList[i].descripcion),
            trailing: Checkbox(
              value: tareasList[i].completada,
              onChanged: (bool? valor){
                setState(() {
                  tareasList[i].completada = valor!;
                  contador = tareasList.where((tarea) => !tarea.completada).length;
                });
              },
            ),
          );
        }
    );

  }
}
