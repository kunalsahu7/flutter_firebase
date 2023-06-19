import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/Home/Controllor/HomeControllor.dart';
import 'package:flutter_firebase/screens/Home/Model/HomeModel.dart';
import 'package:flutter_firebase/utils/Firebasepage.dart';
import 'package:get/get.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController txtp_name = TextEditingController();
  TextEditingController txtp_notes = TextEditingController();
  TextEditingController txtp_price = TextEditingController();
  TextEditingController txtp_review = TextEditingController();
  TextEditingController txtp_warranty = TextEditingController();
  TextEditingController txtp_paytypes = TextEditingController();
  TextEditingController txtp_modelno = TextEditingController();
  TextEditingController txtp_image = TextEditingController();

  HomeControllor homeControllor = Get.put(HomeControllor());

  HomeModel homeModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    homeModel.chekupadtedata == 1 ? AddDataControllor() : BlankDataContorllo();
  }

  void AddDataControllor() {
    txtp_name = TextEditingController(text: "${homeModel.name}");
    txtp_notes = TextEditingController(text: "${homeModel.notes}");
    txtp_price = TextEditingController(text: "${homeModel.price}");
    txtp_review = TextEditingController(text: "${homeModel.review}");
    txtp_warranty = TextEditingController(text: "${homeModel.warranty}");
    txtp_paytypes = TextEditingController(text: "${homeModel.paytypes}");
    txtp_modelno = TextEditingController(text: "${homeModel.modelno}");
    txtp_image = TextEditingController(text: "${homeModel.image}");
  }

  void BlankDataContorllo() {
    txtp_price = TextEditingController();
    txtp_review = TextEditingController();
    txtp_paytypes = TextEditingController();
    txtp_notes = TextEditingController();
    txtp_name = TextEditingController();
    txtp_modelno = TextEditingController();
    txtp_warranty = TextEditingController();
    txtp_image = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: txtp_name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Name',
                    label: Text(
                      "Name",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_price,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Price',
                    label: Text(
                      "Price",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_notes,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Notes',
                    label: Text(
                      "Notes",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_paytypes,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Paytyps',
                    label: Text(
                      "Paytyps",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_review,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Review',
                    label: Text(
                      "Review",
                    ),
                  ),
                ), SizedBox(height: 10),
                TextField(
                  controller: txtp_image,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'image',
                    label: Text(
                      "image",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      // isCheck == 0

                      // Get.back();

                      homeModel.chekupadtedata == 1
                          ? FirebaseHelper.firebaseHelper.UpdateData(
                              key: homeModel.key,
                              price: txtp_price.text,
                              name: txtp_name.text,
                              notes: txtp_notes.text,
                              paytypes: txtp_paytypes.text,
                              review: txtp_review.text,
                              warranty: "",
                              image: txtp_image.text,
                              modelno: "",
                            )
                          : FirebaseHelper.firebaseHelper.AddData(
                              price: txtp_price.text,
                              name: txtp_name.text,
                              notes: txtp_notes.text,
                              paytypes: txtp_paytypes.text,
                              image: txtp_image.text,
                              review: txtp_review.text,
                              warranty: "",
                              modelno: "",
                            );
                      Get.back();
                    },
                    child:
                        Text(homeModel.chekupadtedata == 1 ? "Update" : "Add")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
