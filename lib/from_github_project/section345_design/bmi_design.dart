import 'dart:math';

import 'package:flutter/material.dart';

class BmiDesign extends StatefulWidget {
  const BmiDesign({Key? key}) : super(key: key);

  @override
  _BmiDesignState createState() => _BmiDesignState();
}
class _BmiDesignState extends State<BmiDesign> {

  double _height = 175;
  bool _isMale = true;
  int _age = 20;
  int _weight = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        centerTitle: true,
        title: const Text("Bmi Application Test", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        //titleSpacing: 20,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: _isMale? Colors.purpleAccent: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/male.png", width: 80, height: 80,),
                            const SizedBox(height: 10,),
                           const  Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: !_isMale? Colors.purpleAccent: Colors.grey[400],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/female.png", width: 80, height: 80,),
                            const SizedBox(height: 10,),
                            const Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[400],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${_height.round()}",
                        style:const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text(
                        "CM",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Slider(
                    value: _height,//double.parse( _height.toStringAsFixed(2)),
                    onChanged: (value){
                      setState(() {
                        _height = value;
                      });
                    },
                    max: 220,
                    min: 80,

                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            '$_age',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    _age++;
                                  });
                                },
                                mini: true,
                                heroTag: "addButton",
                                child: const  Icon(Icons.add),
                              ),
                              const SizedBox(width: 10,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    _age--;
                                  });
                                },
                                mini: true,
                                heroTag: "minusButton",
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            '$_weight',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                mini: true,
                                heroTag: "addWeightButton",
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 10,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                mini: true,
                                heroTag: "minusWeightButton",
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            height: 60,
            width: double.infinity,
            child: MaterialButton(elevation: 25,
              onPressed: () {

                double _bmiResult = _weight/ pow(_height/100, 2);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BmiCalcule(
                      bmi: _bmiResult,
                      male: _isMale,
                      myAge: _age,
                      myHeight: _height,
                      myWeight: _weight,
                    ) ) ,
                );
              },
              child: const Text(
                "Calculate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BmiCalcule extends StatelessWidget {

  final double bmi;
  final double myHeight;
  final bool male;
  final int myAge;
  final int myWeight;

  const BmiCalcule({
    Key? key,
    required this.bmi,
    required this.myHeight,
    required this.myWeight,
    required this.myAge,
    required this.male,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    /*
     onWillPop: (){
        return Future.value(false);
      },
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Results'),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${male? "Male": "Female"}',
              style:const  TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              'Age : $myAge',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              'BMI : ${bmi.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
