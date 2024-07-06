import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.message_rounded, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "History",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 110),
                    Icon(Icons.arrow_downward_sharp),
                  ],
                ),
                Divider(),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800], // background color
                          foregroundColor: Colors.white, // text color
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        label: Text('Explore'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800], // background color
                          foregroundColor: Colors.white, // text color
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Create bot'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.white),
            title: Text('Your bots', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.subscriptions, color: Colors.white),
            title: Text('Subscribe', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.people, color: Colors.white),
            title: Text('Creators', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.white),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.white),
            title: Text('Send feedback', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Download iOS app'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Download Android app'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Download Windows app'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
