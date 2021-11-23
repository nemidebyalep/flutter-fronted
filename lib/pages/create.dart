import 'package:examenam/providers/crud.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController titulo = new TextEditingController();
  TextEditingController descripcion = new TextEditingController();
  final functions = new CrudRepo(); 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://static.wikia.nocookie.net/doblaje/images/a/aa/Pikachu_XY.png/revision/latest?cb=20161002184039&path-prefix=es')
         //image: AssetImage('assets/bebe.jpg')
          ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          
          appBar: AppBar(

            title: Text('Registrar Post'),
            centerTitle: true,
            backgroundColor: Colors.pink[600],
          ),
          body: 
            ListView(
            padding: EdgeInsets.all(15),
            children: [
                new TextFormField(
                   controller: titulo,
                   style: TextStyle(
                     color: Colors.white
                   ),
                   decoration: InputDecoration(
                   hintText: 'Titulo',  
                   hintStyle: TextStyle(color: Colors.white),
                   prefixIcon: Icon(Icons.title, color: Colors.white),   
                   enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink
                      )
                  ),               
                   
                   ),
                ),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                 controller: descripcion,
                 style: TextStyle(
                     color: Colors.white
                   ),
                 decoration: InputDecoration( 
                  hintText: 'Descripcion', 
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.description,color: Colors.white,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink
                      )
                  ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
            new TextButton(
                  child:new Text( "Guardar", style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final snackBar = SnackBar(
                    content: const Text('Post creado!'),
                    action: SnackBarAction(
                    label: 'ok',
                    onPressed: () { // Some code to undo the change.
                    },
                    ),
                  );
                  final snackBa2r = SnackBar(
                    content: const Text('Error al crear!'),
                    action: SnackBarAction(
                    label: 'ok',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                    ),
                  );
                  final resp =
                    await functions.crearpost(titulo.text, descripcion.text);
                    if (resp) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushNamed(context, '/');
                    } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBa2r);
                    }
                },
                  style: TextButton.styleFrom(
                  padding: EdgeInsets.all(20), backgroundColor: Colors.pink[200]
                  ),
            )          
          ]
          )
            
        ),
    );
  }
}