import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venturo/model/app_model.dart';
import 'package:venturo/model/youtube_model.dart';
import 'package:venturo/theme.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String videoID = "PuMz4v5PYKc";

  @override
  void initState() {
    super.initState();
    _getVideos();
  }

  _getVideos() async {
    Provider.of<AppModel>(context, listen: false).getListVideos();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyles(
                            value: "Jhon Doe",
                            size: 14,
                            weight: FontWeight.bold,
                          ),
                          TextStyles(
                            value: "Super Admin",
                            size: 12,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.home),
                  ),
                  TextStyles(
                    value: "Home",
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.notifications),
                  ),
                  TextStyles(
                    value: "Notification",
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.account_box),
                  ),
                  TextStyles(
                    value: "Profile",
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.logout_outlined),
                  ),
                  TextStyles(
                    value: "Log Out",
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF363563),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
        title: TextStyles(
          value: "Materi Pembelajaran",
          size: 14,
          color: Colors.white,
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppModel>(
          builder: (context, value, child) {
            return value.isLoading
                ? Center(
                    child: spinDancing,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/images/top_home.png"),
                          Positioned(
                            top: 60,
                            left: 25,
                            child: TextStyles(
                              value: "MATEMATIKA BAB I",
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 195,
                            left: 110,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFF363563),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextStyles(
                                    value: "Kelas",
                                    size: 10,
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  ),
                                  TextStyles(
                                    value: "VII - A",
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.listModel.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 21.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      color: primaryColors,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextStyles(
                                        value:
                                            value.listModel.data![index].nama,
                                        color: Colors.white,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  youtubeMethod(value.listModel.data![index])
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  Container youtubeMethod(Data video) {
    double heightVid = video.detail!.length.toDouble();
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 200 * heightVid,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: video.detail!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Image.network(
              YoutubePlayerController.getThumbnail(
                  videoId: video.detail![index].youtubeId,
                  // todo: get thumbnail quality from list
                  quality: ThumbnailQuality.max,
                  webp: false),
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
