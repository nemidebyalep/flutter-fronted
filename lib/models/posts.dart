import 'dart:convert';


class Posts{
  List<Post> posts = [];

  Posts();
  Posts.fromJsonList(List<dynamic> list){
      
      if(list.length>0){
          Post post;
        list.forEach((element) {
            post = Post.fromJson(element);
            posts.add(post);
          
        });
       
      }else{
         print('no se pudo we F');
      
      }
  }
}

class Post {
    Post({
        this.idpost,
        this.titulo,
        this.descripcion,
        this.fecha,
    });

    int? idpost;
    String? titulo;
    String? descripcion;
    DateTime? fecha;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        idpost: json["idpost"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
    );

    Map<String, dynamic> toJson() => {
        "idpost": idpost,
        "titulo": titulo,
        "descripcion": descripcion,
        "fecha": fecha,
    };
}