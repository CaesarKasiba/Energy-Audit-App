import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/widgets/spacer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignupPage(),
    );
  }
}

///////////////////////////////////////


class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.lightBlue, // Customize the color as needed
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: EdgeInsets.only(top: 20.0), // Adjust the top margin as needed
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25.0), // Adjust the font size as needed
                ),
                ),
                Tab(child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 25.0), // Adjust the font size as needed
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SignUpPage(),
                LogInPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ChapWatt Energify',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          ),
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Facility'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Meter Number'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent, // Set the background color
            ),
            onPressed: () {
              // Handle Sign Up logic
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    ),
  );
}
}

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ChapWatt Energify',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline, fontStyle: FontStyle.italic
              ),
            ),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // Set the background color
              ),
              onPressed: () {
                // Handle Log In logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}











/////////////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Energy Audit: Hostels H, J, G"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to your Audit App for Hostels H, J and G',
                    style: TextStyle(fontSize: 24 ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Image.asset('assets/image1.jpg'),
                Image.asset('assets/image2.jpg'),
              ],
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent, // Set the background color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuditSelectionPage()),
                    );
                  },
                  child: Text('Start Audit'),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.book),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              title: Text('Audit'),
              leading: Icon(Icons.lightbulb),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuditPage()),
                );
              },
            ),

            ListTile(
              title: Text('Analytics'),
              leading: Icon(Icons.pie_chart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalyticsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Billing History & Consumption Analysis '),
              leading: Icon(Icons.money),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnualBillsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Graph'),
              leading: Icon(Icons.show_chart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GraphPage()),
                );
              },
            ),
            ListTile(
              title: Text('Recommendations and Energy Saving Tips'),
              leading: Icon(Icons.book),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecommendationsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.photo),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),

            Spacer(), // Add space above the bottom items
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignupPage()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}


////////////////////////////////////////////










class AuditPage extends StatefulWidget {
  @override
  _AuditPageState createState() => _AuditPageState();
}

class _AuditPageState extends State<AuditPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController weekController = TextEditingController();
  TextEditingController auditedByController = TextEditingController();
  TextEditingController facilityController = TextEditingController();
  TextEditingController recordedPowerController = TextEditingController();

  List<FlSpot> powerData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Audit',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(labelText: 'Date'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a date';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: weekController,
                      decoration: InputDecoration(labelText: 'Week'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a week';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: auditedByController,
                      decoration: InputDecoration(labelText: 'Audited By (Name)'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the auditor\'s name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: facilityController,
                      decoration: InputDecoration(labelText: 'Facility'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the facility';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: recordedPowerController,
                      decoration: InputDecoration(labelText: 'Recorded Power (KWh)'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the recorded power';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _saveData();
                          _updateGraph();
                          _formKey.currentState?.reset();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                  gridData: FlGridData(drawHorizontalLine: true, drawVerticalLine: true),
                  borderData: FlBorderData(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _getLineChartSpots(),
                      isCurved: true,
                      colors: [Colors.blue],
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getLineChartSpots() {
    return powerData.toList();
  }

  void _saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('date', dateController.text);
      prefs.setString('week', weekController.text);
      prefs.setString('auditedBy', auditedByController.text);
      prefs.setString('facility', facilityController.text);
      prefs.setString('power', recordedPowerController.text);
    } catch (e) {
      print("Error saving data to SharedPreferences: $e");
      _showErrorSnackbar();
    }
  }

  void _updateGraph() {
    try {
      double power = double.parse(recordedPowerController.text);
      int week = int.parse(weekController.text);

      // Validate week input
      if (week <= 0 || week > 6) {
        _showValidationErrorSnackbar('Week should be between 1 and 6');
        return;
      }

      // Assuming there are 6 weeks
      if (week >= powerData.length + 1) {
        setState(() {
          powerData.add(FlSpot(week.toDouble(), power));
        });
      } else {
        _showValidationErrorSnackbar('Please enter data for the next available week.');
      }
    } catch (e) {
      print("Error updating graph: $e");
      _showErrorSnackbar();
    }
  }

  void _showErrorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred. Please try again.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showValidationErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
















/////////////////////////////////////////////

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileListItem(
              icon: Icons.person,
              label: 'Name',
              value: 'Group 1',
            ),
            ProfileListItem(
              icon: Icons.email,
              label: 'Email',
              value: 'energyaudit@chapwatt.com',
            ),
            ProfileListItem(
              icon: Icons.home,
              label: 'Facility',
              value: 'Hostel H, J, G',
            ),
            ProfileListItem(
              icon: Icons.confirmation_number,
              label: 'Meter Number',
              value: '040008081827',
            ),
            ProfileListItem(
              icon: Icons.date_range,
              label: 'Member Since',
              value: '24/11/2023',
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                // Add logic for deleting account
              },
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Delete Account',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 10.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}



class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('About'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Group 1 members.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Macella Ouma - EC/36/19\n'
                    '2. Caleb Sagwe - TLE/27/19\n'
                    '3. Edward Otieno - EC/35/19\n'
                    '4. Alwala Ndolo - EC/01/19\n'
                    '5. Hilda Jepkoech - EC/09/19\n'
                    '6. Janet Ochia - EC/29/19\n'
                    '7. Caesar Kasiba - TLE/11/18\n'
                    '8. Reagan Ooko - TLE/37/19\n'
                    '9. Phoebe Odhiambo - TLE/15/17\n'
                    '10. Ian Langat - EC/15/19',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Select the hostel below to view its information:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HInformationPage(
                        hostelName: 'Hostel H',
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Hostel H',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JInformationPage(
                        hostelName: 'Hostel J',
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Hostel J',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GInformationPage(
                        hostelName: 'Hostel G',
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Hostel G',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HInformationPage extends StatelessWidget {
  final String hostelName;
  final Color backgroundColor;

  HInformationPage({required this.hostelName, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$hostelName Information'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hostel H, located at latitude 0.28588 and longitude 35.29404 at an altitude of 7301 feet is a residential facility built by Moi university in order to cater for students accomodation. Through the janitors office we were able to gather the occupancy data. For the first semester academic year 23/24, H hosts 440 students: With Three wings, Wing A has 120 occupied rooms, Wing B has 100 occupied rooms while wing C is fully Vacant. Hostel H has common rooms on each wing, 3 in wing A, 2 in wing B which are fully occupied. Appliances in Hostel H that consume energy are Electric kettles rated 1800 - 2200 Watts, water heaters rated 1500 watts, laptop chargers rated 19V 4.74A, and phone chargers rated 5V 1A.. In addition to that the hostel has Bulbs which are rated 60 Watts for both the 2ft and 4ft Fluorescent tubes and sockets which are rated 240V 13A. The external light bulbs are rated 50 Watts. ',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more information about the hostel as needed
          ],
        ),
      ),
    );
  }
}

class JInformationPage extends StatelessWidget {
  final String hostelName;
  final Color backgroundColor;

  JInformationPage({required this.hostelName, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$hostelName Information'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hostel J, located at latitude 0.28829 and longitude 35.28797 at an altitude of 7260 feet is a residential facility built by Moi university in order to cater for students accomodation. Through the janitors office we were able to gather the occupancy data. For the first semester academic year 23/24, Hostel J hosts 240 students: With Three wings, only wing A is occupied and the gates leading to Wing B and C were locked hence the data in those wings was not captured. Wing A has 120 occupied rooms with two students each room, Wing B and C are fully vacant. Hostel J has common rooms on each wing, 3 in wing A which are fully occupied. Appliances in Hostel J that consume energy are Electric kettles rated 1800 - 2200 Watts, water heaters rated 1500 watts, laptop chargers rated 19V 4.74A, and phone chargers rated 5V 1A. In addition to that the hostel has Bulbs which are rated 60 Watts for both the 2ft and 4ft Fluorescent tubes and sockets which are rated 240V 13A. The external light bulbs are rated 50 Watts.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more information about the hostel as needed
          ],
        ),
      ),
    );
  }
}

class GInformationPage extends StatelessWidget {
  final String hostelName;
  final Color backgroundColor;

  GInformationPage({required this.hostelName, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$hostelName Information'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hostel G in Soweto, located at latitude 0.27982 and longitude 35.29447 at an altitude of 7265 feet is a residential facility built by Moi university in order to cater for students accomodation. Through the janitors office we were able to gather the occupancy data for Hostel G. For the first semester academic year 23/24, Hostel G hosts 416 students: With Three wings, only wing A and B are occupied and the gates leading to Wing C were locked hence the data in that wing was not captured. Wing A has 52 occupied rooms with four students each room, Wing B has 52 rooms with four students each room while C is fully vacant. Hostel G has common rooms on each wing, 1 in wing A and 3 in wing B which are fully occupied. Appliances in Hostel G that consume energy are Electric kettles rated 1800 - 2200 Watts, water heaters rated 1500 watts, laptop chargers rated 19V 4.74A, and phone chargers rated 5V 1A. In addition to that the hostel has Bulbs which are rated 60 Watts for both the 2ft Fluorescent tubes rated 20 watts and 4ft Fluorescent tubes rated 34 watts, and sockets which are rated 240V 13A. The security light bulbs are rated 8 Watts.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more information about the hostel as needed
          ],
        ),
      ),
    );
  }
}








class RecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Recommendations & Tips'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionHeading('Recommendations', Icons.lightbulb),
          _buildCarousel(_recommendations),
          SizedBox(height: 16.0), // Add some space between carousels
          _buildSectionHeading('Energy Saving Tips', Icons.star),
          _buildCarousel(_energySavingTips),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28.0),
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(List<String> items) {
    return Container(
      height: 250.0, // Set a fixed height for the Carousel
      child: CarouselSlider(
        items: items.map((item) => _buildCarouselItem(item)).toList(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 7),
          enlargeCenterPage: true,
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Icon(Icons.lightbulb, size: 48.0, color: Colors.yellow[800]),
          SizedBox(height: 5.0),
          Text(
            text,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  final List<String> _recommendations = [
    'Develop a comprehensive plan to address physical constraints and secure access permissions for critical meter points and hostel areas to improve access during data collection.',
    'Implement measures to mitigate unanticipated load variations, such as installing energy storage solutions and incorporating predictive analytics.',
    'Establish a systematic scheduling system for electricians to ensure availability during crucial data collection periods.',
    'Explore options for individual metering of the three hostels by installing separate meters for each facility to provide more accurate and granular data.',
    'To streamline data collection processes and enhance accuracy, consider integrating advanced technologies, such as remote monitoring systems or smart meters.',
    'Implement a regular maintenance schedule for meters to address issues related to faulty or aging meters and ensure accurate readings.',
    'Promote using energy-saving bulbs and LEDs in hostels and associated facilities to reduce overall power consumption and contribute to sustainability goals.',
  ];

  final List<String> _energySavingTips = [
    'Turn off lights and electronic devices when not in use.',
    'Use energy-efficient appliances and light bulbs.',
    'Unplug chargers and electronic devices when they are fully charged.',


    'Wash clothes in cold water and use a clothesline instead of a dryer.',
    'Consider installing solar panels to generate clean energy.',
  ];
}









class AnnualBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Billing History and Consumption'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Below is the Billing History of Hostels H, J, and G From 2020 to 2022',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 16.0),
              // Add other page content as needed
              Image.asset(
                'assets/bill.png',
                width: 500.0,
                height: 600.0,
                // fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                'The months of January 2023 to July 2023 consistently exhibit lower power bills, suggesting a period of reduced energy consumption within Moi University Hostels G, H, and J. This observation aligns with the typical academic calendar, reflecting lower student occupancy during non-peak months, such as semester breaks or holidays. The marked decline in energy bills during these months underscores the influence of academic schedules on energy consumption, indicating that lower student numbers directly contribute to decreased power usage in the hostels.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
              // SizedBox(height: 16.0),
              // Add other page content as needed
              Image.asset(
                'assets/consumption.png',
                width: 500.0,
                height: 400.0,
                // fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}








class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Graphs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Click on the links below to access the Graphs',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillsPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    color: Colors.yellow,
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Bills in Ksh',
                        style: TextStyle(
                          color: Colors.blue,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnergyPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    color: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Occupancy vs Energy',
                        style: TextStyle(
                          color: Colors.white,

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Add other graph page content as needed
          ],
        ),
      ),
    );
  }
}

class BillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills against Months'),
      ),
      body: Center(
        child: Image.asset(
          'assets/graphs.png',
          width: 600.0,
          height: 700.0,
        ),
      ),
    );
  }
}

class EnergyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Occupancy vs Energy Comparison'),
      ),
      body: Center(
        child: Image.asset(
          'assets/graph2.png',
          width: 600.0,
          height: 800.0,
        ),
      ),
    );
  }
}









class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Images from our site visits',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
            ),
            GalleryImageWithCaption(
              imagePath: 'assets/image1.jpg',
              caption: 'Hostel H',
            ),
            GalleryImageWithCaption(
              imagePath: 'assets/image2.jpg',
              caption: 'Hostel J',
            ),
            // GalleryImageWithCaption(
            //   imagePath: 'assets/image3.jpg',
            //   caption: 'Meter Reading',
            // ),
            GalleryImageWithCaption(
              imagePath: 'assets/image4.jpg',
              caption: 'Metering Area',
            ),
            // GalleryImageWithCaption(
            //   imagePath: 'assets/image5.jpg',
            //   caption: 'Meter Number',
            // ),
            GalleryImageWithCaption(
              imagePath: 'assets/image6.jpg',
              caption: 'Fluorescent Bulb',
            ),
            GalleryImageWithCaption(
              imagePath: 'assets/image7.jpg',
              caption: 'Metering Area Transformer',
            ),
            GalleryImageWithCaption(
              imagePath: 'assets/image8.jpg',
              caption: 'Kettle',
            ),
            // GalleryImageWithCaption(
            //   imagePath: 'assets/image9.jpg',
            //   caption: 'Electricity Bill',
            // ),
            // GalleryImageWithCaption(
            //   imagePath: 'assets/image10.jpg',
            //   caption: 'Payment Voucher',
            // ),
            GalleryImageWithCaption(
              imagePath: 'assets/image11.jpg',
              caption: 'Fire Alarm System',
            ),
            GalleryImageWithCaption(
              imagePath: 'assets/image12.jpg',
              caption: 'Kettle',
            ),

          ],
        ),
      ),
    );
  }
}

class GalleryImageWithCaption extends StatelessWidget {
  final String imagePath;
  final String caption;

  GalleryImageWithCaption({required this.imagePath, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              caption,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
            ),
          ),
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.9,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}











class AuditSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Select a Hostel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HostelButton(icon: Icons.home, text: 'Hostel H', color: Colors.black),
            HostelButton(icon: Icons.home, text: 'Hostel J', color: Colors.blue),
            HostelButton(icon: Icons.home, text: 'Hostel G', color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class HostelButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  HostelButton({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecordDataPage()),
        );
      },
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size(300, 100),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}



class RecordDataPage extends StatefulWidget {
  @override
  _RecordDataPageState createState() => _RecordDataPageState();
}

class _RecordDataPageState extends State<RecordDataPage> {
  final TextEditingController totalCapacityController = TextEditingController();
  final TextEditingController occupancyController = TextEditingController();
  final TextEditingController bulbCountController = TextEditingController();
  final TextEditingController bulbWattageController = TextEditingController();
  final TextEditingController corridorBulbCountController = TextEditingController();
  final TextEditingController corridorBulbWattageController = TextEditingController();
  final TextEditingController kettleCountController = TextEditingController();
  final TextEditingController kettleRatingController = TextEditingController();
  final TextEditingController phoneChargerRatingController = TextEditingController();
  final TextEditingController laptopChargerRatingController = TextEditingController();
  final TextEditingController powerConsumptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Record your Data Below'),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: totalCapacityController,
              decoration: InputDecoration(labelText: 'Total Capacity'),
            ),
            TextField(
              controller: occupancyController,
              decoration: InputDecoration(labelText: 'Occupancy'),
            ),
            TextField(
              controller: bulbCountController,
              decoration: InputDecoration(labelText: 'Number of Bulbs(Rooms'),
            ),
            TextField(
              controller: bulbWattageController,
              decoration: InputDecoration(labelText: 'Wattage of Bulb'),
            ),
            TextField(
              controller: corridorBulbCountController,
              decoration: InputDecoration(labelText: 'Corridor Bulbs'),
            ),
            TextField(
              controller: corridorBulbWattageController,
              decoration: InputDecoration(labelText: 'Wattage of Bulb'),
            ),
            TextField(
              controller: kettleCountController,
              decoration: InputDecoration(labelText: 'Number of Kettles'),
            ),
            TextField(
              controller: kettleRatingController,
              decoration: InputDecoration(labelText: 'Kettle Ratings'),
            ),
            TextField(
              controller: phoneChargerRatingController,
              decoration: InputDecoration(labelText: 'Phone Charger Ratings'),
            ),
            TextField(
              controller: laptopChargerRatingController,
              decoration: InputDecoration(labelText: 'Laptop Charger Ratings'),
            ),
            TextField(
              controller: powerConsumptionController,
              decoration: InputDecoration(labelText: 'Recorded Power Consumption'),
            ),

            // Other input fields...

            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // Set the background color
              ),
              onPressed: () async {
                // Store data using SharedPreferences
                await storeData();

                // Navigate to the Data Summary page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataSummaryPage()),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Future<void> storeData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('totalCapacity', totalCapacityController.text);
    prefs.setString('occupancy', occupancyController.text);
    prefs.setString('bulbCount', bulbCountController.text);
    prefs.setString('bulbWattage', bulbWattageController.text);
    prefs.setString('corridorBulbCount', corridorBulbCountController.text);
    prefs.setString('corridorBulbWattage', corridorBulbWattageController.text);
    prefs.setString('kettleCount', kettleCountController.text);
    prefs.setString('kettleRating', kettleRatingController.text);
    prefs.setString('phoneChargerRating', phoneChargerRatingController.text);
    prefs.setString('laptopChargerRating', laptopChargerRatingController.text);
    prefs.setString('powerConsumption', powerConsumptionController.text);
  }
}

class DataSummaryPage extends StatefulWidget {
  @override
  _DataSummaryPageState createState() => _DataSummaryPageState();
}

class _DataSummaryPageState extends State<DataSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Data Summary'),
      ),
      body: FutureBuilder(
        future: retrieveData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Total Capacity: ${snapshot.data?['totalCapacity'] ?? 'N/A'}'),
                Text('Occupancy: ${snapshot.data?['occupancy'] ?? 'N/A'}'),
                Text('Number of Bulbs(Rooms): ${snapshot.data?['bulbCount'] ?? 'N/A'}'),
                Text('Wattage of Bulbs: ${snapshot.data?['bulbWattage'] ?? 'N/A'}'),
                Text('Corridor Bulbs: ${snapshot.data?['corridorBulbCount'] ?? 'N/A'}'),
                Text('Wattage of Bulbs: ${snapshot.data?['corridorBulbWattage'] ?? 'N/A'}'),
                Text('Number of Kettles: ${snapshot.data?['kettleCount'] ?? 'N/A'}'),
                Text('Kettle Ratings: ${snapshot.data?['kettleRating'] ?? 'N/A'}'),
                Text('Phone Charger Ratings: ${snapshot.data?['phoneChargerRating'] ?? 'N/A'}'),
                Text('Laptop Charger Ratings: ${snapshot.data?['laptopChargerRating'] ?? 'N/A'}'),
                Text('Recorded Power Consumption: ${snapshot.data?['powerConsumption'] ?? 'N/A'}'),
                // Display other data...

                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent, // Set the background color
                  ),
                  onPressed: () {
                    // Navigate to the Analytics page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnalyticsPage()),
                    );
                  },
                  child: Text('Hostel Data Information'),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<Map<String, String>> retrieveData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'totalCapacity': prefs.getString('totalCapacity') ?? 'N/A',
      'occupancy': prefs.getString('occupancy') ?? 'N/A',
      'bulbCount': prefs.getString('bulbCount') ?? 'N/A',
      'bulbWattage': prefs.getString('bulbWattage') ?? 'N/A',
      'corridorBulbCount': prefs.getString('corridorBulbCount') ?? 'N/A',
      'corridorBulbWattage': prefs.getString('corridorBulbWattage') ?? 'N/A',
      'kettleCount': prefs.getString('kettleCount') ?? 'N/A',
      'kettleRating': prefs.getString('kettleRating') ?? 'N/A',
      'phoneChargerRating': prefs.getString('phoneChargerRating') ?? 'N/A',
      'laptopChargerRating': prefs.getString('laptopChargerRating') ?? 'N/A',
      'powerConsumption': prefs.getString('powerConsumption') ?? 'N/A',
    };
  }
}

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Analytics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HostelDataCard(
              hostelName: 'Hostel H',
              totalCapacity: '680',
              occupancy: '440',
              bulbCount: '507',
              bulbWattage: '60W',
              corridorBulbCount: '21',
              corridorBulbWattage: '60W',
              kettleCount: '42',
              kettleRating: '1200W',
              phoneChargerRating: '5W',
              laptopChargerRating: '90W',
              powerConsumption: 'X',
            ),
            HostelDataCard(
              hostelName: 'Hostel J',
              totalCapacity: '243',
              occupancy: '243',
              bulbCount: '144',
              bulbWattage: '60W',
              corridorBulbCount: '7',
              corridorBulbWattage: '60W',
              kettleCount: '29',
              kettleRating: '1200W',
              phoneChargerRating: '5W',
              laptopChargerRating: '90W',
              powerConsumption: 'X',
            ),
            HostelDataCard(
              hostelName: 'Hostel G',
              totalCapacity: '416',
              occupancy: '416',
              bulbCount: '133',
              bulbWattage: '34W',
              corridorBulbCount: '7',
              corridorBulbWattage: '34W',
              kettleCount: '80',
              kettleRating: '1200W',
              phoneChargerRating: '5W',
              laptopChargerRating: '90W',
              powerConsumption: 'X',
            ),
          ],
        ),
      ),
    );
  }
}



class HostelDataCard extends StatelessWidget {
  final String hostelName;
  final String totalCapacity;
  final String occupancy;
  final String bulbCount;
  final String bulbWattage;
  final String corridorBulbCount;
  final String corridorBulbWattage;
  final String kettleCount;
  final String kettleRating;
  final String phoneChargerRating;
  final String laptopChargerRating;
  final String powerConsumption;

  HostelDataCard({
    required this.hostelName,
    required this.totalCapacity,
    required this.occupancy,
    required this.bulbCount,
    required this.bulbWattage,
    required this.corridorBulbCount,
    required this.corridorBulbWattage,
    required this.kettleCount,
    required this.kettleRating,
    required this.phoneChargerRating,
    required this.laptopChargerRating,
    required this.powerConsumption,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hostel: $hostelName',
              style: TextStyle( fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text('Total Capacity: $totalCapacity'),
            Text('Occupancy: $occupancy'),
            Text('Bulb Count: $bulbCount'),
            Text('Bulb Wattage: $bulbWattage'),
            Text('Corridor Bulb Count: $corridorBulbCount'),
            Text('Corridor Bulb Wattage: $corridorBulbWattage'),
            Text('Kettle Count: $kettleCount'),
            Text('Kettle Rating: $kettleRating'),
            Text('Phone Charger Rating: $phoneChargerRating'),
            Text('Laptop Charger Rating: $laptopChargerRating'),
            Text('Power Consumption: $powerConsumption'),
          ],
        ),
      ),
    );
  }


  // Widget build(BuildContext context) {
  //   return Image.asset(
  //     'assets/graphs.png', // Replace with the path to your image asset
  //     width: 200, // Adjust the width as needed
  //     height: 200, // Adjust the height as needed
  //     fit: BoxFit.cover, // Choose the BoxFit strategy that suits your layout
  //   );
  // }


}


