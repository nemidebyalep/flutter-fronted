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
    return Scaffold(
        appBar: AppBar(
          title: Text('Crear Post'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(padding: EdgeInsets.all(15), children: [
          new TextFormField(
            controller: titulo,
            decoration: InputDecoration(
                labelText: 'Titulo', prefixIcon: Icon(Icons.title)),
          ),
          SizedBox(
            height: 20,
          ),
          new TextFormField(
            controller: descripcion,
            decoration: InputDecoration(
                labelText: 'Descripcion', prefixIcon: Icon(Icons.description)),
          ),
          SizedBox(
            height: 40,
          ),
          new TextButton(
            child: new Text(
              "Crear",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final snackBar = SnackBar(
                content: const Text('Post creado!'),
                action: SnackBarAction(
                  label: 'ok',
                  onPressed: () {
                    // Some code to undo the change.
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
                padding: EdgeInsets.all(20), backgroundColor: Colors.grey),
          )
        ]));
  }
}
