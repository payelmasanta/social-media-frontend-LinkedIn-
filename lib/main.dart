import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import './cities.dart';
import 'nextpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool _search = true;

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<AutoCompleteTextFieldState<Cities>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;
  TextEditingController controller = new TextEditingController();

  _MyHomePageState();

  void _loadData() async {
    await CitiesViewModel.loadCities();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "YM",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )),
        actions: [
          _search
              ? Container(
                  width: 0,
                )
              : Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  width: 180,
                  child: searchTextField = AutoCompleteTextField<Cities>(
                      textCapitalization: TextCapitalization.words,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat'),
                      decoration: new InputDecoration(
                          filled: true,
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat')),
                      itemSubmitted: (item) {
                        setState(() => searchTextField
                            .textField.controller.text = item.autocompleteterm);
                        print(searchTextField.textField.controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NextPage(searchTextField
                                    .textField.controller.text)));
                      },
                      clearOnSubmit: false,
                      key: key,
                      suggestions: CitiesViewModel.cities,
                      itemBuilder: (context, item) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.all(5.0)),
                                Text(
                                  item.autocompleteterm,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: 'Montserrat'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                            ),
                          ],
                        );
                      },
                      itemSorter: (a, b) {
                        return a.autocompleteterm.compareTo(b.autocompleteterm);
                      },
                      itemFilter: (item, query) {
                        return item.autocompleteterm
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      }),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    if (_search) {
                      _search = false;
                    } else {
                      _search = true;
                    }
                  });
                },
                fillColor: Colors.grey[100],
                child: Icon(
                  Icons.search,
                  size: 23,
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ],
      ),
      body: Container(
        child: Center(child: Image.asset('assets/homepage.png')),
      ),
    );
  }
}
