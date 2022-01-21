import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maka_shop/features/inventory/presentation/inventory_screen.dart';
import 'package:maka_shop/features/live_show/presentation/live_show_screen.dart';
import 'package:maka_shop/injection_container.dart' as di;
import 'package:maka_shop/ui/theme/colors.dart';

import 'ui/theme/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 0;

  late PageController _pageController;

  final Map<int, Widget> children = <int, Widget>{
    0: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'LiveShow',
        style: smallTextStyle.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    1: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Inventory',
        style: smallTextStyle.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
  };

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 14.0,
                left: 30.0,
                right: 30.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: CupertinoSegmentedControl(
                  selectedColor: Colors.white,
                  unselectedColor: textGrey,
                  borderColor: textGrey,
                  onValueChanged: (int index) {
                    setState(() {
                      selectedTab = index;
                      navigationTapped(index);
                    });
                  },
                  pressedColor: textGrey,
                  children: children,
                  groupValue: selectedTab,
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(40),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: PageView(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          onPageChanged: (int page) {
            setState(() {
              selectedTab = page;
            });
          },
          children: const [LiveShowScreen(), InventoryScreen()],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
