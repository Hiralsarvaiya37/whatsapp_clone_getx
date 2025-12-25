import 'package:flutter/material.dart';

class ChatviewScreen extends StatelessWidget {
  ChatviewScreen({super.key});

  final List<String> filters = ["All", "Unread", "Favorites", "Groups", "+"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.greenAccent.shade400,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey.shade800,

            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey.shade300,
            ),
            hint: Text(
              "Ask Meta AI or Search",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 17),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 22),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade800,
                          ),
                          child: Text(
                            filters[index],
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.separated(
                  itemCount: 50,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemBuilder: (context, index) => Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          "https://thumbs.dreamstime.com/b/two-ladybugs-orange-spring-flower-flight-insect-artistic-macro-image-concept-spring-summer-two-ladybugs-orange-125140826.jpg",
                        ),
                      ),

                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "gyssbhuhduhebehdbb",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "123548856514",
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("11:11", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Icon(Icons.push_pin, color: Colors.white, size: 20),
                        ],
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 22),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
