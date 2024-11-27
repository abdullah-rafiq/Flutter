import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white, // Background color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile_sc'); // Navigate to Profile
                      },
                      child:const Align(
                        alignment: Alignment.topLeft,
                        child:CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your asset
                        ),
                      ),
                    ),
                  const Spacer(),
                     GestureDetector(
                        onTap: () {
                        Navigator.pushNamed(context, '/profile_sc'); // Navigate to Profile
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.info_outline_rounded),
                          onPressed: () {
                          Navigator.pushNamed(context, '/settings_sc');
                      },
                    ),
                  ),
                ),
                  ],
                ),
                const SizedBox(height: 10),
                // User Info
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'John Doe', // Name
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '@johndoe', // Username
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        '100 Following', // Following
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '200 Followers', // Followers
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          // Drawer Menu Items
          Expanded(
            child: ListView(
              
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () => Navigator.pushNamed(context, '/profile_sc'),
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark),
                  title: const Text('Bookmarks'),
                  onTap: () => Navigator.pushNamed(context, '/bookmarks_sc'),
                ),
                ListTile(
                  leading: const Icon(Icons.work),
                  title: const Text('Jobs'),
                  onTap: () => Navigator.pushNamed(context, '/jobs_sc'),
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Lists'),
                  onTap: () => Navigator.pushNamed(context, '/lists_sc'),
                ),
                ListTile(
                  leading: const Icon(Icons.space_dashboard),
                  title: const Text('Spaces'),
                  onTap: () => Navigator.pushNamed(context, '/spaces_sc'),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Monetization'),
                  onTap: () => Navigator.pushNamed(context, '/monetization_Sc'),
                ),
              ],
            ),
          ),

          // Settings & Privacy
          Divider(),
          Padding(
  padding: const EdgeInsets.only(bottom: 100),
  child: ExpansionTile(
    title: const Text('Settings & Privacy'),
    trailing: const Icon(Icons.arrow_drop_down), // Dropdown icon
    children: [
      ListTile(
        title: const Text('Settings'),
        onTap: () => Navigator.pushNamed(context, '/setting_sc'),
      ),
      ListTile(
        title: const Text('Help Center'),
        onTap: () => Navigator.pushNamed(context, '/help_sc'),
      ),
    ],
  ),
),
        ],
      ),
    );
  }
}
