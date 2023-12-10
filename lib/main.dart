import 'package:flutter/material.dart';
import 'data/FakeDogDatabase.dart';
import 'data/Dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Dog List")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dogList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: DogList(dogList[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondWidget(p1: dogList[index].id),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  int p1;
  SecondWidget({this.p1 = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dog Item"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: DogInformation(dogList[p1]),
          ),
        ),
      ),
    );
  }
}


Widget DogList(Dog dog) {
  return Card(
    margin: EdgeInsets.all(10),
    color: Color.fromARGB(238, 220, 220, 220),
    elevation: 20,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "drawable/${dog.image}",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(dog.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Container(
                      decoration: BoxDecoration(
                        color: dog.gender == 'Male' ? Color.fromARGB(255, 207, 231, 238) : Color.fromARGB(255, 255, 192, 243),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(dog.gender, style: TextStyle(color: dog.gender == 'Male' ? Colors.blue : Colors.pink, fontSize: 12)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("${dog.age} yrs | Playful", style: TextStyle(fontSize: 10)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 12, color: Colors.red),
                        Text(" ${dog.distance}", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                    Text("12 min ago", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget DogInformation(Dog dog) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      children: [
        Image.asset("drawable/${dog.image}", width: double.infinity, height: 250, fit: BoxFit.cover),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dog.name,
                style: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF151B1E),
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: dog.gender == "Male"
                      ? Color.fromARGB(255, 207, 231, 238)
                      : Color.fromARGB(255, 255, 192, 203),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(dog.gender,
                    style: TextStyle(
                        color: dog.gender == "Male" ? Colors.blue : Colors.pink)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 15, color: Colors.red),
              Text(" ${dog.distance}",
                  style: const TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF151B1E),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12 min ago",
                style: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF151B1E),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${dog.age} yrs | Playful",
                style: const TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF151B1E),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 8),
          child: Text(
            "About ${dog.name}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF151B1E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Text(
            dog.description,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF151B1E),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 8),
          child: Text(
            "Quick Infos",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF151B1E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(" ${dog.age} yrs",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(children: [
                Text(" ${dog.color}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
              ]),
              Row(children: [
                Text(" ${dog.weight} kg",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
              ])
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("age",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(children: [
                Text("color",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
              ]),
              Row(children: [
                Text("weight",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
              ])
            ],
          ),
        ),
      ],
    ),
  );
}
