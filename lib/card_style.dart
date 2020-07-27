import 'package:flutter/material.dart';
import 'package:flutterapp/data/place_data.dart';
import 'package:flutterapp/page/search/place_detail.dart';

// A card which display viewpoint data in the list.
class CardStyle extends StatelessWidget {
  List<PlaceItem> listItems = PlaceItems.getInstance().listItems;
  PlaceItem current_place;
  int placeId;

  CardStyle(this.placeId) {
    current_place = listItems.elementAt(placeId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaceDetail(placeId: current_place.id)),
          );
        },
        child: Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
            child: SizedBox(
                height: 130.0,
                width: double.infinity,
                child: new Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Image.asset(current_place.image),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(current_place.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  current_place.subtitle,
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Icon(Icons.location_on),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                          current_place.check_num.toString()),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 2,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Icon(Icons.comment),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                          current_place.message_num.toString()),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ])))));
  }
}
