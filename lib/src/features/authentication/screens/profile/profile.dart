// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:mess_management_system/src/constants/colors.dart';
// import 'package:mess_management_system/src/constants/image_strings.dart';
// import 'package:mess_management_system/src/constants/sizes.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(MessDefaultSize),
//           child: Column(
//             //   Profile Picture
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.white10,
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Center(
//                         child: Image(
//                           fit: BoxFit.fill,
//                           image: AssetImage(messProfilePic),
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text("Change Profile Picture"),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Divider(),
//               const SizedBox(
//                 height: 16,
//               ),
//               const MessSectionHeading(
//                   title: "Profile Information", showActionButton: false),
//               const SizedBox(
//                 height: MessDefaultSize,
//               ),
//               ProfileMenu(
//                 title: "Name",
//                 content: "Ratnakar Gautam",
//               ),
//               ProfileMenu(
//                 title: "Email",
//                 content: "ratnakarg@iitbhilai.ac.in",
//               ),
//               ProfileMenu(
//                 title: "ID No.",
//                 content: "12141360",
//               ),
//               ProfileMenu(
//                 title: "Contact No.",
//                 content: "+91 9044906728",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileMenu extends StatelessWidget {
//   const ProfileMenu({
//     super.key,
//     required this.title,
//     required this.content,
//   });
//
//   final String title;
//   final String content;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//             flex: 3,
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.bodySmall,
//               overflow: TextOverflow.ellipsis,
//             )),
//         Expanded(
//             flex: 5,
//             child: Text(
//               content,
//               style: Theme.of(context).textTheme.bodyMedium,
//               overflow: TextOverflow.ellipsis,
//             )),
//         const Expanded(
//             child: Icon(
//           Iconsax.star_copy,
//           size: 10,
//         )),
//         SizedBox(
//           height: MessDefaultSize * 1.3,
//         )
//       ],
//     );
//   }
// }
//
// class MessSectionHeading extends StatelessWidget {
//   const MessSectionHeading(
//       {super.key,
//       required this.title,
//       this.buttonTitle = "View all",
//       this.onPressed,
//       required this.showActionButton,
//       this.textColor});
//   final String title, buttonTitle;
//   final bool showActionButton;
//   final Color? textColor;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context)
//               .textTheme
//               .headlineSmall!
//               .apply(color: textColor),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         if (showActionButton)
//           TextButton(onPressed: onPressed, child: Text(buttonTitle))
//       ],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  Future<DocumentSnapshot> getUserDetails() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    } else {
      throw Exception('No user is currently logged in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserDetails(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            String name = data['name'];
            String email = data['email'];
            String rollNumber = data['rollNumber'];

            String initials = name.isNotEmpty
                ? name.trim().split(' ').map((l) => l[0]).take(2).join()
                : '';

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      initials,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Name: $name'),
                  Text('Email: $email'),
                  Text('Roll Number: $rollNumber'),
                  Text("Contact No: +91 9044906728"),
                  Text("Mess: Kumar Mess")
                  // Add other fields as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
