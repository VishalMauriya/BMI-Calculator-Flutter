import 'package:bmi/navDrawer.dart';
import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash_Screen(),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? myBanner;
  var weightController = TextEditingController();
  var heightFController = TextEditingController();
  var heightIController = TextEditingController();
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  var result = '';
  var _text = '';
  var _subText = '';
  var _color = Colors.green;
  var _width = 0.0;
  var _height = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createBannerAd();
    // createInterAd();
    // createRewardedAd();
  }

  void createBannerAd(){
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-7901315668637108/4939028579',
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: listener,
    )..load();
  }

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png", width: 100,),
              // DialogExample(),
              InkWell(
                  onTap: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('BMI CALCULATOR', style: TextStyle(color: Colors.green),),
                        content: const Text('BMI between 18 - 25,\nYour weight is Ok, You are Healthy \n\n'
                            'BMI below 18,\nYour weight is less than normal, You should gain weight \n\n'
                            'BMI above 25,\nYour weight is more than normal, You should gain weight'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.info)),
            ],
          ),
          // title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xfffff1eb), Color(0xfface0f9)]
              )
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onTap: (){
                        _height = 0.0;
                        _width = 0.0;
                      },
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      decoration: InputDecoration(
                        label: Text('Enter your Weight (in kgs)'),
                          errorText: _validate1 ? 'Value Can\'t Be Empty' : null,
                        prefixIcon: Icon(Icons.monitor_weight_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),

                    SizedBox(height: 20),
                    TextField(
                      onTap: (){
                        _height = 0.0;
                        _width = 0.0;
                      },
                      keyboardType: TextInputType.number,
                      controller: heightFController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height (feet)'),
                          errorText: _validate2 ? 'Value Can\'t Be Empty' : null,
                          prefixIcon: Icon(Icons.height_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(height: 20),
                    TextField(
                      onTap: (){
                        _height = 0.0;
                        _width = 0.0;
                      },
                      keyboardType: TextInputType.number,
                      controller: heightIController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height (inch)'),
                          errorText: _validate3 ? 'Value Can\'t Be Empty' : null,
                          prefixIcon: Icon(Icons.height_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(height: 40),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)
                                )
                            ),
                          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          fixedSize: MaterialStatePropertyAll(Size(200, 40)),
                        ),

                        onPressed: (){
                          FocusScope.of(context).unfocus();

                          var wt = weightController.text.toString();
                          var ft = heightFController.text.toString();
                          var Inch = heightIController.text.toString();

                          if(weightController.text.isEmpty || heightFController.text.isEmpty || heightIController.text.isEmpty){
                            setState(() {
                              weightController.text.isEmpty ? _validate1 = true : _validate1 = false;
                              heightFController.text.isEmpty ? _validate2 = true : _validate2 = false;
                              heightIController.text.isEmpty ? _validate3 = true : _validate3 = false;
                              result = '';
                              _text = '';
                              _subText = '';
                              _width = 0.0;
                              _height = 0.0;
                            });

                          }else{
                            _width = 150;
                            _height = 150;
                            var iwt = int.parse((wt));
                            var ift = int.parse(ft);
                            var iInch = int.parse(Inch);

                            var totalInches = ift * 12 + iInch;
                            var totalCms = totalInches * 2.54;
                            var totalM = totalCms/100;

                            var bmi = iwt/(totalM*totalM);
                            setState(() {
                              if(bmi > 25){
                                _color = Colors.red;
                                _subText = "You are over weighted!";
                              }
                              else if(bmi < 18){
                                _color = Colors.deepOrange;
                                _subText = "You are under weighted!";
                              }
                              else {
                                _color = Colors.green;
                                _subText = "You are Healthy!";
                              }

                              _text = 'Your BMI is   ';
                              result =  bmi.toStringAsFixed(2);
                              _validate1 = false;
                              _validate2 = false;
                              _validate3 = false;
                            });
                          }

                    }, child: Text('CALCULATE', style: TextStyle(fontWeight: FontWeight.bold),)),

                    SizedBox(height: 60),
                    AnimatedContainer(
                      height: _height,
                      width: _width,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(seconds: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: _color)
                      ),
                      child: Center(
                        child: Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: result,
                                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: _color),
                              ),
                              TextSpan(
                                text: '\n$_subText',
                                style: TextStyle(fontSize: 10,color: _color)
                              )
                            ],
                        ),),
                      ),

                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: myBanner == null ? Container()
            : Container(
          child: AdWidget(ad: myBanner!),
          margin: EdgeInsets.only(bottom: 0.8),
          height: 52,
        ),
      ),
    );
  }
}


