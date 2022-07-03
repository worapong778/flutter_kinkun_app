import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUI extends StatefulWidget {
  String? name;
  String? websit;
  String? facebook;
  String? mobile;
  String? image;
  String? lat;
  String? lng;

  DetailUI({
    this.name,
    this.websit,
    this.facebook,
    this.mobile,
    this.image,
    this.lat,
    this.lng,
  });

  @override
  State<DetailUI> createState() => _DetailUIState();
}

class _DetailUIState extends State<DetailUI> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'กินกัน (รายละเอียด)',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/' + widget.image!,
                height: 200.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80.0,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.shop,
                          color: Colors.green[500],
                        ),
                        title: Text(
                          widget.name!,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(
                              widget.websit!,
                            ),
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.sitemap,
                          color: Colors.red[500],
                        ),
                        title: Text(
                          widget.websit!,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(
                              'https://fb.com/' + widget.facebook!,
                            ),
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.facebook,
                          color: Color(0xFF3B5998),
                        ),
                        title: Text(
                          'http://fb.com/' + widget.facebook!,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _makePhoneCall(
                            widget.mobile!,
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.yellow[800],
                        ),
                        title: Text(
                          'Tel : ' + widget.mobile!,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(
                              'https://www.google.co.th/maps/@${widget.lat},${widget.lng},15z',
                            ),
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.mapLocation,
                          color: Colors.blue[500],
                        ),
                        title: Text(
                          'เปิดแผนที่ร้าน',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
