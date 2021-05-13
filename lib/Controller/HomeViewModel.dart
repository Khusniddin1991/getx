





import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxflutter/Model/Post.dart';

import 'Network.dart';

class ViewModel extends GetxController{

  var isLoading = false.obs;
 var items = new List<Post>().obs;

  Future apiPostList() async {
    isLoading  (true);

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = new List();
    }

    isLoading  (false);
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading  (true);

    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading  (false);
    return response != null;
  }
  void sendApiToServer(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

    String title=titleController.text.trim();
    String body=bodyController.text.trim();
    var time=DateTime.now().microsecond;
    print(time);
    print(body);
    if(title.isEmpty&&body.isEmpty){
      return;
    }
    Post posts=Post(title: title,body:body ,userId:1);
    add(posts,context);
  }
  void add(Post post,BuildContext context)async {
    isLoading  (true);
    var res=await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(res);
    try{
      if(res==null){
        isLoading  (true);
        Navigator.of(context).pop({"data":"the result"});
      }
    }catch(e){
      print(e);
    }

  }

  void sendApiToServers(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

    String title=titleController.text.trim();
    String body=bodyController.text.trim();

    var time=DateTime.now().microsecond;
    print(time);
    print(body);
    if(title.isEmpty&&body.isEmpty){
      return;
    }
    Post posts=Post(title: title,body:body ,userId:1,id: 1);
    add(posts,context);
  }
  void adds(Post post,context)async {

    isLoading  (true);

    var res=await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post));
    print(res);
    try{
      if(res==null){

        isLoading  (false);

        Navigator.of(context).pop({"data":"the result"});
      }
    }catch(e){
      print(e);
    }

  }











}