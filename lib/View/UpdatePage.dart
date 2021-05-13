import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:getxflutter/Controller/HomeViewModel.dart';
import 'package:sizer/sizer.dart';



class UpdatePage extends StatefulWidget {
  // @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final getcontroller=Get.put(ViewModel());
  final titleController =new TextEditingController();
  final bodyController =new TextEditingController();

  // @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple,
        body: Obx(()=>Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)
                      ),child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title",
                          hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                      ),
                    ),
                    ),SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)
                      ),child: TextField(
                      controller: bodyController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Body",
                          hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                      ),
                    ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: 9.h,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)
                      ),child: FlatButton(
                      splashColor: Colors.blue,
                      onPressed: (){
                        getcontroller.sendApiToServers(titleController, bodyController, context);
                        // Navigator.of(context).pop();
                      },child: Text("update  it",style: TextStyle(
                        color: Colors.grey,fontSize: 16
                    ),),

                    ),
                    )



                  ],),),
            ),getcontroller.isLoading()?Center(child: CircularProgressIndicator(),):SizedBox.shrink()
          ],)));

  }

}