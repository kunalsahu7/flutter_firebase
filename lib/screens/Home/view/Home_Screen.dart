import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/Home/Model/HomeModel.dart';
import 'package:flutter_firebase/utils/Firebasepage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("FireBase"),
          actions: [
            ElevatedButton(
              child: Icon(Icons.login_outlined),
              onPressed: () {
                FirebaseHelper.firebaseHelper.signOut();
                Get.offAndToNamed('/SignIn');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<HomeModel> DataList = [];
              QuerySnapshot? snapdata = snapshot.data;
              for (var x in snapdata!.docs) {

                x.id;


                Map data = x.data() as Map;
                String? name = data['name'];
                String? price = data['price'];
                String? notes = data['notes'];
                String? date = data['date'];
                String? time = data['time'];
                String? review = data['review'];
                String? warranty = data['warranty'];
                String? paytypes = data['paytypes'];
                String? modelno = data['modelno'];

                HomeModel homeModel = HomeModel(
                  date: date,
                  modelno: modelno,
                  name: name,
                  notes: notes,
                  paytypes: paytypes,
                  price: price,
                  review: review,
                  time: time,
                  warranty: warranty,
                  key: x.id,
                );

                DataList.add(homeModel);
              }

              return ListView.builder(
                itemCount: DataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onLongPress: () {
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown.shade200
                            ),
                            child: Column(
                              children: [
                                Text("${DataList[index].name}"),
                                SizedBox(height: 5),
                                Text("${DataList[index].price}"),
                                SizedBox(height: 5),
                                Text("${DataList[index].paytypes}"),
                                SizedBox(height: 5),
                                Text("${DataList[index].notes}"),
                                SizedBox(height: 5),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/Insert');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
