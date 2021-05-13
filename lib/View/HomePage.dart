import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getxflutter/Controller/HomeViewModel.dart';
import 'package:getxflutter/Model/Post.dart';
import 'package:getxflutter/View/UpdatePage.dart';
import 'DetailPage.dart';





class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final getcontroller=Get.put(ViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcontroller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Getx"),
          centerTitle: true,
        ),
        body: Obx(()=>Stack(
          children: [
            ListView.builder(
              itemCount: getcontroller.items.length,
              itemBuilder: (ctx, index) {
                return itemOfPost(getcontroller.items[index]);
              },
            ),
            getcontroller.isLoading()
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox.shrink(),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(DetailPage());
          },
          child: Icon(Icons.add),
        ));
  }

  Widget itemOfPost(Post post) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(post.body),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Update',
          color: Colors.indigo,
          icon: Icons.edit,
          onTap: () {
            Get.to(UpdatePage());
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            getcontroller.apiPostDelete(post);
          },
        ),
      ],
    );
  }
}