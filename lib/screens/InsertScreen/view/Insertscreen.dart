import 'package:flutter/material.dart';
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
  TextEditingController txtp_date = TextEditingController();
  TextEditingController txtp_time = TextEditingController();
  TextEditingController txtp_price = TextEditingController();
  TextEditingController txtp_review = TextEditingController();
  TextEditingController txtp_warranty = TextEditingController();
  TextEditingController txtp_paytypes = TextEditingController();
  TextEditingController txtp_modelno = TextEditingController();

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
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Name',
                    label: Text("Name")
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_price,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Price',
                      label: Text("Price")
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 10),
                TextField(
                  controller: txtp_notes,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Notes',
                      label: Text("Notes")
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_paytypes,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Paytyps',
                      label: Text("Paytyps")
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtp_review,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: 'Review',
                      label: Text("Review")
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  FirebaseHelper.firebaseHelper.AddData(
                    price: txtp_price.text,
                    name: txtp_name.text,
                    notes: txtp_notes.text,
                    paytypes: txtp_paytypes.text,
                    review: txtp_review.text,
                    warranty: "",
                    modelno: "",
                  );
                  Get.back();
                }, child: Text("Enter")),
              ],
            ),
          ),
        )
      ),
    );
  }
}
