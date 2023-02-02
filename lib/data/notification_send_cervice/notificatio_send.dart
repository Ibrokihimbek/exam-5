import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class NotificationApiService {
  static Future<String> sendNotificationToAll() async {
    String key =
        "key=AAAAZKiZgwk:APA91bF_9IzwTHhgTFUfvuwHSjlueGaDUk0LkM9-TG1iBHFU1gM3FixRuPBTRdeBeFgkdBsN5p6juKrphGregQFwdWdzwy085eUT5sMjOPdp9puBw1VzQIvp-58VXWCQhxacy_jLLLBG";

    Map<String, dynamic> body = {
      "to": "/topics/news",
      "notification": {"title": "Xabar keldi", "body": "Biz Imtixondan o'tdik"},
      "data": {
        "news_title": "Bizda Imtixon",
        "news_body": "Biz Imtixondan o'tdik",
        "news_image":
            "https://buildfire.com/wp-content/uploads/2018/03/what-is-a-push-notification-and-why-it-matters-1200x675.jpg",
        "route": 'notification'
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    try {
      Response response = await https.post(
        uri,
        headers: {
          "Authorization": key,
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message_id"].toString();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
