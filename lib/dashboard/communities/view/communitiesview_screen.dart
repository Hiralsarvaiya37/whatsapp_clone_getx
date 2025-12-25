import 'package:flutter/material.dart';

class CommunitiesviewScreen extends StatelessWidget {
  const  CommunitiesviewScreen({super.key});

   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),

          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.groups_2_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade400,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(Icons.add, size: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Text(
                "New community",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://s2.best-wallpaper.net/wallpaper/1920x1080/1810/White-lily-flowers-close-up_1920x1080.jpg",
                  height: 55,
                  width: 55,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "hudh huheudjwns sxhwudu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.campaign, color: Colors.white, size: 30),
              ),
              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Announcements",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Yesterday",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "+15487851454 hbcsdwdwdh bxhsbhsbsh",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunitiesviewScreen(),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        // print("+++++++++");
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommunitiesScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 30),
                          Text(
                            "View all",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 35),

                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://s2.best-wallpaper.net/wallpaper/1920x1080/1810/White-lily-flowers-close-up_1920x1080.jpg",
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "hudh heujwns sjhdu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.campaign,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Announcements",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "8/4/25",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "+15487851454 hbcsdwdwdh bxhsbhsbsh...",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://s2.best-wallpaper.net/wallpaper/1920x1080/1810/White-lily-flowers-close-up_1920x1080.jpg",
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "hudh huheud",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "hudh huudjwns sxhwudu",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                ],
              );
            },
          separatorBuilder: (context, index) => SizedBox(height: 20,),),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // print("===========");
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommunitiesScreen()));
            },
            child: Row(
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey.shade400,
                ),
                SizedBox(width: 30),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
