import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:uuid/uuid.dart';

// FeedbackForm StatefulWidget
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

// FeedbackForm State
class _FeedbackFormState extends State<FeedbackForm> {
  File? feedbackImage;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool _isLoading = false;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String categoryController = "";

  Future<void> _pickImage() async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      File convertedFile = File(selectedImage.path);
      setState(() {
        feedbackImage = convertedFile;
        _image = selectedImage;
      });
      print("Image selected");
    } else {
      print("No Image Selected");
    }
  }

  void submitHandler() async {
    setState(() {
      _isLoading = true;
    });
    String title = titleController.text.trim();
    String description = descriptionController.text.trim();
    String category = categoryController;

    titleController.clear();
    descriptionController.clear();

    if (title != "" &&
        description != "" &&
        category != "" &&
        feedbackImage != null) {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("feedbackImagePath")
          .child(Uuid().v1())
          .putFile(feedbackImage!);

      TaskSnapshot taskSnapShot = await uploadTask;
      String downloadURL = await taskSnapShot.ref.getDownloadURL();

      Map<String, dynamic> feedbackData = {
        "title": title,
        "description": description,
        "category": category,
        "imageURL": downloadURL
      };
      FirebaseFirestore.instance.collection("feedback").add(feedbackData);
      print("Feedback provied Successfully");
      setState(() {
        _image = null;
        _isLoading = false;
      });
    } else {
      print("Enter all the fields");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void printUserEmail() {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;
    print('Current user email: $userEmail');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(messFeedbackImage2),
              height: 40,
            ), // Adjust the path and height as needed
            Text('Feedback/Complaints'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Image(
              image: AssetImage(messFeedbackImage4),
              width: 200,
              height: 200,
            ),
            // Title input field
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Description input field
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            // Category dropdown
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(child: Text('Vendors'), value: 'vendors'),
                DropdownMenuItem(child: Text('Food Related'), value: 'food'),
                DropdownMenuItem(child: Text('Other'), value: 'other'),
              ],
              onChanged: (value) {
                setState(() {
                  categoryController = value ?? '';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24.0),
            // Image display (if selected)
            if (_image != null) Image.file(File(_image!.path)),
            // Image upload button
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 24.0),
            // Submit button
            ElevatedButton(
              child: (_isLoading == false)
                  ? Text("Submit")
                  : CircularProgressIndicator(),
              onPressed: submitHandler,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: printUserEmail, child: Text("User Email"))
            // CupertinoButton(
            //   onPressed: _pickImage,
            //   padding: EdgeInsets.zero,
            //   child: CircleAvatar(
            //     backgroundImage:
            //         (feedbackImage != null) ? FileImage(feedbackImage!) : null,
            //     backgroundColor: Colors.grey,
            //     radius: 40,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
