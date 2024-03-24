import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';

// FeedbackForm StatefulWidget
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

// FeedbackForm State
class _FeedbackFormState extends State<FeedbackForm> {
  // ImagePicker instance
  final ImagePicker _picker = ImagePicker();
  // Selected image file
  XFile? _image;

  // Function to handle image picking
  Future<void> _pickImage() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = selectedImage;
    });
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
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Description input field
            TextFormField(
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
              onChanged: (value) {},
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
              child: const Text('Submit'),
              onPressed: () {
                // TODO: Validate and submit feedback
              },
            ),
          ],
        ),
      ),
    );
  }
}
