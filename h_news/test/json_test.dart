import 'package:h_news/json_parsing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test("parses topstories.json", () {
    const jsonString =
        "[17238241,17239602,17238135,17236788,17237510,17238089,17230960,17238070,17238911,17238953,17236022,17239753,17237792,17235171,17237567,17236187,17236473,17236242,17237442,17239413,17238766,17235832,17234537,17237468,17234448,17235749,17237183,17237876,17234498,17234416,17237295,17236405,17236294,17235810,17239740,17239036,17237526,17233371,17239259,17230273,17235056,17239061,17237026,17237373,17236039,17235063,17223926,17231593,17233824,17236110,17229397,17230583,17233979,17235160,17234615,17226225,17233208,17238146,17234627,17230262,17235375,17237153,17231847,17233811,17230720,17238639,17230469,17230916,17233448,17221885,17231355,17230863,17227564,17238015,17231349,17233538,17222827,17230510,17231806,17230785,17224772,17232884,17221379,17230090,17237490,17234526,17229264,17230513,17217815,17222861,17216634,17231120,17232169,17219379,17228517,17230631,17235354,17231704,17226900,17234488,17235027,17230143,17232447,17235949,17217827,17232200,17220861,17232357,17224329,17229085,17234350,17236351,17218831,17226243,17234483,17234124,17231178,17220002,17230120,17229491,17223749,17230029,17233835,17234217,17228369,17229940,17217081,17231493,17229971,17228480,17216178,17230578,17235609,17221221,17217526,17236300,17228891,17218080,17235692,17233106,17220356,17234452,17220006,17232083,17220507,17219101,17228384,17223116,17232519,17217203,17233908,17214827,17216937,17220252,17221483,17234090,17234723,17218573,17231773,17221211,17217069,17218190,17220630,17221498,17217210,17214953,17220387,17229435,17219185,17220325,17235614,17231337,17221794,17218833,17220016,17216878,17217673,17217324,17214711,17225725,17220396,17215474,17214986,17217444,17229793,17231091,17220382,17234800,17216078,17218160,17216452,17220660,17215391,17236760,17217155,17216972,17239039,17222252,17214857,17214841,17214750,17216536,17215409,17234933,17218605,17234371,17221239,17216441,17232945,17226485,17226781,17225327,17222177,17215679,17216319,17226169,17224758,17215603,17216039,17229973,17215829,17234230,17217653,17218285,17230539,17219059,17215089,17219092,17218348,17218473,17231576,17217498,17214867,17230934,17217044,17219111,17215332,17216193,17230413,17230239,17218657,17216293,17230047,17232799,17221486,17222460,17232302,17218576,17223855,17214676,17219217,17217637,17215476,17225889,17219249,17230394,17215407,17216035,17220226,17223383,17216564,17223579,17217881,17228234,17220369,17215966,17217733,17222439,17215931,17221696,17233726,17216114,17225665,17233923,17216249,17227307,17215950,17215514,17222576,17224805,17230766,17219556,17228458,17221435,17223935,17217688,17219162,17215836,17215299,17225599,17224474,17217625,17223375,17216271,17220590,17215605,17221670,17224920,17220761,17217584,17224948,17215372,17216239,17219734,17224382,17216260,17217472,17216851,17216188,17217799,17216649,17220544,17216192,17215738,17215074,17219885,17215881,17220163,17220803,17217407,17217359,17219992,17228099,17215381,17215051,17234826,17223628,17227286,17218250,17225756,17227299,17220662,17221527,17228704,17218302,17232456,17231289,17229848,17228097,17230995,17225957,17226063,17229200,17217193,17239580,17233367,17229374]";

    expect(parseTopStories(jsonString).first, 17238241);
  });

  test("parses item.json", () {
    const jsonString =
        """{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8952,8917,8884,8887,8943,8869,8940,8908,8958,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}""";
    expect(parseArticle(jsonString).by, "dhouston");
  });

  test("parses item.json over a network", () async {
    final url = 'https://hacker-news.firebaseio.com/v0/newstories.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final idListJson = json.decode(response.body);
          expect(parseArticle(response.body).by, "dhouston");
    }
  });
}