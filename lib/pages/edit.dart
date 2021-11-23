import 'package:examenam/providers/crud.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  dynamic post;

  EditPost({this.post});
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController? titulo;
  TextEditingController? descripcion;
   int?  id; 

  @override
  void initState() {
    titulo = new TextEditingController(text: widget.post['titulo']);
    id= widget.post['idpost'];
    descripcion = new TextEditingController(text: widget.post['descripcion']);
  }

  final functions = new CrudRepo();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: NetworkImage('https://static.wikia.nocookie.net/doblaje/images/a/aa/Pikachu_XY.png/revision/latest?cb=20161002184039&path-prefix=es')
         image: AssetImage('assets/lili.jpg')
          ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: new Text("Actualizar Post"),
          backgroundColor: Colors.pink[600],
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.title, color: Colors.purple),
                    
                    title: new TextFormField(
                      controller: titulo,
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                  ),
                  new ListTile(
                    leading: Icon(Icons.description, color: Colors.purple),
                    title: TextFormField(
                      controller: descripcion,
                      decoration: InputDecoration(labelText: 'Descripcion'),
                    ),
                  ),
                  const Divider(
                    height: 10.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(100),
                  ),
                  new TextButton(
                    child: new Text(
                      "Actulizar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      final snackBar = SnackBar(
                        content: const Text('Post actualizado!'),
                        action: SnackBarAction(
                          label: 'ok',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      final snackBa2r = SnackBar(
                        content: const Text('Error al actualizar!'),
                        action: SnackBarAction(
                          label: 'ok',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      final resp = await functions.update(
                          titulo?.text, descripcion?.text,id);
                      if (resp) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushNamed(context, '/');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBa2r);
                      }
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.purple[300]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
