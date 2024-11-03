import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Planter',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(143, 148, 251, 1),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Help') {
                print('Help selected');
              } else if (value == 'Contact Us') {
                print('Contact Us selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Help', 'Contact Us'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice == 'Help' ? '❓ Help' : '📞 Contact Us',
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Top icons
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.ac_unit, size: 40), // Increased size
                      Icon(Icons.ac_unit, size: 40),
                      Icon(Icons.ac_unit, size: 40),
                      Icon(Icons.ac_unit, size: 40),
                    ],
                  ),*/
                  // Weather and location
                  WeatherContainer(),
                  // Save your crop
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Save your crop',
                          style: TextStyle(
                            fontSize: 24, // Increased font size
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(
                                143, 148, 251, 1), // Violet color
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Color.fromRGBO(
                              129, 133, 221, 1), // Violet background
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Column(
                                  children: [
                                    Icon(Icons.camera_alt,
                                        size: 40, color: Colors.white),
                                    Text('Take a picture',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Icon(Icons.arrow_forward,
                                    size: 40, color: Colors.white),
                                Column(
                                  children: [
                                    Icon(Icons.description,
                                        size: 40, color: Colors.white),
                                    Text('See diagnosis',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Icon(Icons.arrow_forward,
                                    size: 40, color: Colors.white),
                                Column(
                                  children: [
                                    Icon(Icons.medical_services,
                                        size: 40, color: Colors.white),
                                    Text('Get medicine',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Take a picture'),
                        ),
                      ],
                    ),
                  ),
                  // Other options
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1, // Single column
                    childAspectRatio: 5, // Adjust for desired height
                    padding: const EdgeInsets.all(8.0),
                    children: const [
                      Card(
                        color: Color(0xFFE3F2FD), // Light blue color
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0), // Vertical spacing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.calculate, color: Colors.blue),
                          title: Text('Fertilizer calculator',
                              style: TextStyle(fontSize: 16)),
                          trailing:
                              Icon(Icons.arrow_forward, color: Colors.blue),
                        ),
                      ),
                      Card(
                        color: Color(0xFFFFF3E0), // Light orange color
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0), // Vertical spacing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.bug_report, color: Colors.orange),
                          title: Text('Pests & diseases',
                              style: TextStyle(fontSize: 16)),
                          trailing:
                              Icon(Icons.arrow_forward, color: Colors.orange),
                        ),
                      ),
                      Card(
                        color: Color(0xFFE8F5E9), // Light green color
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0), // Vertical spacing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ListTile(
                          leading:
                              Icon(Icons.tips_and_updates, color: Colors.green),
                          title: Text('Cultivation Tips',
                              style: TextStyle(fontSize: 16)),
                          trailing:
                              Icon(Icons.arrow_forward, color: Colors.green),
                        ),
                      ),
                      /*
                      Card(
                        color: Color(0xFFFFEBEE), // Light red color
                        margin:
                            EdgeInsets.symmetric(vertical: 8.0), // Vertical spacing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.warning, color: Colors.red),
                          title: Text('Pests and Disease Alert',
                              style: TextStyle(fontSize: 16)),
                          trailing: Icon(Icons.arrow_forward, color: Colors.red),
                        ),
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 70, // Increase the height as needed
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.grass),
            title: const Text('Your crops'),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Community'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.store),
            title: const Text('Dukaan'),
            activeColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('You'),
            activeColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class WeatherContainer extends StatefulWidget {
  @override
  _WeatherContainerState createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  String temperature = '';
  String description = '';
  String date = '';
  IconData weatherIcon = Icons.wb_sunny;
  Color iconColor = Colors.yellow;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=YourCity&appid=YourAPIKey&units=metric'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = '${data['main']['temp']}°C';
        description = data['weather'][0]['description'];
        date = 'Today, ${DateTime.now().day} ${DateTime.now().month}';
        updateWeatherIcon(description);
      });
    } else {
      // Handle error
    }
  }

  void updateWeatherIcon(String description) {
    if (description.contains('clear')) {
      weatherIcon = Icons.wb_sunny;
      iconColor = Colors.yellow;
    } else if (description.contains('rain')) {
      weatherIcon = Icons.beach_access;
      iconColor = Colors.blue;
    } else if (description.contains('cloud')) {
      weatherIcon = Icons.cloud;
      iconColor = Colors.grey;
    } else {
      weatherIcon = Icons.wb_sunny;
      iconColor = Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date),
              Text(description),
            ],
          ),
          Text(temperature),
          Icon(weatherIcon, size: 40, color: iconColor),
        ],
      ),
    );
  }
}
