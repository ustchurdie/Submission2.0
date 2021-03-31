import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('back')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8.0),
              primary: Colors.teal,
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {},
            child: Text("Option 1")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8.0),
              primary: Colors.teal,
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {},
            child: Text("Option 2")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8.0),
              primary: Colors.teal,
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {},
            child: Text("Option 3")),
        ],
      ),
    );
  }
}

// AppBar(
//       toolbarHeight: 60,
//       title: Text('ShopInfo'),
//       backgroundColor: Colors.green[200],
//       automaticallyImplyLeading: false,
//       elevation: 10,
//       actions: [
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.all(8.0),
//               primary: Colors.teal,
//               onPrimary: Colors.white,
//               shape: const BeveledRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//             ),
//             onPressed: () {},
//             child: Text("Option 1")),
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.all(8.0),
//               primary: Colors.teal,
//               onPrimary: Colors.white,
//               shape: const BeveledRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//             ),
//             onPressed: () {},
//             child: Text("Option 1")),
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.all(8.0),
//               primary: Colors.teal,
//               onPrimary: Colors.white,
//               shape: const BeveledRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//             ),
//             onPressed: () {},
//             child: Text("Option 1")),
//       ],
//     );