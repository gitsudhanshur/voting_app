import 'package:flutter/material.dart';

class VotingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'vote.org.my',
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: .5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: .5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: .5),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.share, color: Colors.black54),
                    onPressed: () {},
                  ),
                ),
                style: TextStyle(color: Colors.black),
                maxLines: 1,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerBanner(),
            SizedBox(height: 20),
            liveVoteResults(),
            SizedBox(height: 20),
            otherContestants(),
            SizedBox(height: 20),
            contestVideo(),
            SizedBox(height: 20),
            upcomingEvents(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: Colors.grey), // Lock icon
              SizedBox(width: 8), // Small space between lock and text
              Text(
                'lorem.org.my',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        elevation: 0,
        color: Colors.white,
      ),
    );
  }

  Widget headerBanner() {
    return Container(
      width: 380,
      height: 130,
      child: Image.asset(
        "assets/images/header.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget liveVoteResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Live Vote Results",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        Text(
          "Winner Contestant",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFF8B64C)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 160, 160),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/Omar.png',
                        width: 100,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              "Omar D. Regalado",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Lorem ipsum loremipsum",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: Image.asset(
                  'assets/images/Star.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            voteCard("Total Votes", "560", Color.fromARGB(255, 4, 150, 255)),
            SizedBox(width: 25),
            voteCard("Total Votes", "50%", Color.fromARGB(255, 124, 173, 191)),
          ],
        ),
      ],
    );
  }

  Widget voteCard(String title, String value, Color? color) {
    return Container(
      width: 145,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }


  Widget otherContestants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Positioned(
          left: 39,
          child: Text("Others Contestant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
        SizedBox(height: 15),
        contestantCard('Chester Cheng', '196 Votes', '35%', const Color.fromARGB(255, 161, 210, 245), 'assets/images/chester.png'),
        SizedBox(height: 10),
        contestantCard('Robert Soliman', '56 Votes', '10%', const Color.fromARGB(255, 161, 245, 211), 'assets/images/Robert.png'),
        SizedBox(height: 10),
        contestantCard('Kristine Lim', '28 Votes', '5%', const Color.fromARGB(255, 187, 245, 161), 'assets/images/Kristine.png'),
      ],
    );
  }

  Widget contestantCard(String name, String votes, String percent, Color color, String imagePath) {
  return Card(
    color: color,
    child: ListTile(
      leading: Image.asset(
        imagePath, // Set the image from assets
        width: 40,  // Set the width of the image
        height: 70, // Set the height of the image
        fit: BoxFit.cover, // Adjust how the image fits the box
      ),
      title: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
      subtitle: Text(votes, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
      trailing: Text(percent, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
    ),
  );
}


  Widget contestVideo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Contest Videos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            // Handle navigation to video
          },
          child: Text(
            "https://www.youtube.com/watch?v=aLtXzKyNxkY",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget upcomingEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upcoming Events", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        eventCard('Music Festivals', '30/09/2024', 'assets/images/Music.png'),
        SizedBox(height: 5),
        eventCard('Sports Events', '30/09/2024', 'assets/images/Sport.png'),
      ],
    );
  }

  Widget eventCard(String eventName, String date, String imagePath) {
  return Card(
    child: ListTile(
      leading: Image.asset(
        imagePath, // Using the image asset here
        width: 50,
        height: 70,
        fit: BoxFit.cover,
      ),
      title: Text(eventName,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
      subtitle: Text('Date: $date',
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
      trailing: Image.asset('assets/images/arrow.png'),
    ),
  );
}
}

