import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switchValue = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Hello There'),
                ],
              ),
            ),
          );
        },
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 46),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      maxRadius: 16,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Wallet",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(children: const [
                Text(
                  "Mobile Team",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(90 / 360),
                  child: Icon(
                    Icons.code,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
                Spacer(),
              ]),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const TopCard(
                      icon: Icon(
                        Icons.pages_outlined,
                        color: Colors.white,
                      ),
                      name: "Your address",
                      isSelected: true,
                    ),
                    const TopCard(
                      icon: Icon(Icons.account_circle_outlined),
                      name: "Aliases",
                      isSelected: false,
                    ),
                    TopCard(
                      icon: CupertinoSwitch(
                        value: switchValue,
                        activeColor: Colors.blue,
                        onChanged: (bool value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                      name: "Balance",
                      isSelected: false,
                    ),
                    const TopCard(
                      icon: Icon(Icons.compare_arrows),
                      name: "Reconnect",
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: const [
                Text(
                  "Tokens",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Leasing",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
              ]),
              const SizedBox(
                height: 2,
              ),
              Container(
                color: Colors.blue,
                width: 15,
                height: 3,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 36,
                      child: TextField(
                        controller: TextEditingController(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        showCursor: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: const Icon(
                      Icons.swap_vert,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BottomCard(
                icon: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 10,
                ),
                color: Colors.white,
                symbol: RotationTransition(
                  turns: const AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    color: Colors.blue,
                    width: 18,
                    height: 18,
                  ),
                ),
                text: Row(
                  children: const [
                    Text(
                      "Waves",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ],
                ),
                price: "5.0054",
              ),
              const BottomCard(
                icon: Icon(
                  Icons.code,
                  color: Colors.black,
                  size: 10,
                ),
                color: Colors.grey,
                symbol: Text(
                  "P",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                text: Text(
                  "Pigeon / My Token",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                price: "1444.04556321",
              ),
              const BottomCard(
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 10,
                ),
                color: Colors.green,
                symbol: Text(
                  "\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                text: Text(
                  "US Dollar",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                price: "199.24",
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hidden tokens (2)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Suspicious tokens (15)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final Widget icon;
  final String name;
  final bool isSelected;

  const TopCard({
    super.key,
    required this.icon,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  final Widget symbol;
  final Color color;
  final Widget icon;
  final Widget text;
  final String price;

  const BottomCard({
    super.key,
    required this.symbol,
    required this.color,
    required this.icon,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Stack(children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 20,
                  child: symbol,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 20,
                    padding: const EdgeInsets.all(2),
                    child: icon,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                const SizedBox(
                  height: 5,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
