import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Blue Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 260, // Adjust the height as needed
                padding: EdgeInsets.all(10),
                color: Color(0xFF5000E1),
                child: Stack(
                  children: [
                    // Avatar and Greeting
                    Positioned(
                      left: 70,
                      top: 80,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/logo.jpg'), // Corrected image path
                            radius: 40,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                'Thomas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // List Icon at the Top Left
                    Positioned(
                      top: 25,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          // Add your onTap functionality here
                        },
                        child: Image.asset(
                          'assets/images/menu.png',
                          width: 24, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          color: Colors.white, // Optionally, you can apply color to the icon
                        ),
                      ),
                    ),
                    // Icons at the Top Right
                    Positioned(
                      top: 20,
                      right: 10,
                      child: Row(
                        children: [
                          IconButton(
                            icon: ImageIcon(
                              AssetImage('assets/images/profile.png'), // Path to your custom icon
                              color: Colors.white, // Icon color
                            ),
                            onPressed: () {
                              // Add your onPressed functionality here
                            },
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.notifications, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Quick Actions Container Overlapping Inside Blue Header Container
            Positioned(
              left: 0,
              right: 0,
              top: 250, // Adjust the top position as needed
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick Actions', style: TextStyle(color: Colors.purple,fontSize: 18, fontWeight: FontWeight.bold)),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _quickActionItem('Bills', 'assets/images/bils.png'),
                        _quickActionItem('Disconnect', 'assets/images/diss3.png'),
                        _quickActionItem('Transfer', 'assets/images/t.png'),
                        _quickActionItem('Services', 'assets/images/t.png'),
                        _quickActionItem('Complaints', 'assets/images/m.png'),
                        _quickActionItem('Update', 'assets/images/update2.png'),
                        _quickActionItem('Connection', 'assets/images/update2.png'),
                        _quickActionItem('Outage', 'assets/images/update2.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Scrollable Content
            Positioned(
              top: 550,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Gas Information
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gas | SA1234567', style: TextStyle(color:Colors.purple,fontSize: 16)),
                          DropdownButton<String>(
                            value: 'Last Month',
                            items: <String>['Last Month', 'This Month']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    // Bill Information
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 7.0,
                        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(25.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white, // Change background color to white
                                      ),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                          strokeWidth: 3.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Bills', style: TextStyle(fontSize: 18)),
                                      Text('20 Jan 2020', style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              Text('\$43', style: TextStyle(color:Colors.orange,fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.donut_large),
              label: 'Usage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic),
              label: 'Support',
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ),
    );
  }

  Widget _quickActionItem(String label, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 55,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
