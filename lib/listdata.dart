import 'dart:convert';

List decodeJson(jsonStrdata) {
  List listJson = json.decode('$jsonStrdata');
  var data0x01 = listJson[1].toString();
  var data0x02 = listJson[2].toString();
  var data0x03 = listJson[3].toString();
  var data0x04 = listJson[4].toString();
  var data0x05 = listJson[5].toString();
  var data0x06 = listJson[6].toString();
  var data0x07 = listJson[7].toString();
  var data0x08 = listJson[8].toString();
  var data0x09 = listJson[9].toString();
  var data0x0A = listJson[10].toString();
  var data0x0B = listJson[11].toString();
  var data0x0C = listJson[0].toString();

  List listData = [
    {
      "title": 'U相电流',
      "data": (int.parse(data0x01) / 1000).toStringAsFixed(2), //数据除以1000保留2位小数
      "unit": ' A',
      "imageUrl": 'images/电流.png',
    },
    {
      "title": 'V相电流',
      "data": (int.parse(data0x02) / 1000).toStringAsFixed(2),
      "unit": ' A',
      "imageUrl": 'images/电流.png',
    },
    {
      "title": 'W相电流',
      "data": (int.parse(data0x03) / 1000).toStringAsFixed(2),
      "unit": ' A',
      "imageUrl": 'images/电流.png',
    },
    {
      "title": 'U相电流有效值',
      "data": (int.parse(data0x04) / 1000).toStringAsFixed(2),
      "unit": ' A',
      "imageUrl": 'images/电流2.png',
    },
    {
      "title": 'V相电流有效值',
      "data": (int.parse(data0x05) / 1000).toStringAsFixed(2),
      "unit": ' A',
      "imageUrl": 'images/电流2.png',
    },
    {
      "title": 'W相电流有效值',
      "data": (int.parse(data0x06) / 1000).toStringAsFixed(2),
      "unit": ' A',
      "imageUrl": 'images/电流2.png',
    },
    {
      "title": 'X轴振动加速度',
      "data": (int.parse(data0x07) / 1000).toStringAsFixed(2),
      "unit": ' g',
      "imageUrl": 'images/x轴加速度.png',
    },
    {
      "title": 'Y轴振动加速度',
      "data": (int.parse(data0x08) / 1000).toStringAsFixed(2),
      "unit": ' g',
      "imageUrl": 'images/y轴加速度.png',
    },
    {
      "title": 'Z轴振动加速度',
      "data": (int.parse(data0x09) / 1000).toStringAsFixed(2),
      "unit": ' g',
      "imageUrl": 'images/z轴加速度.png',
    },
    {
      "title": '加速度矢量和',
      "data": (int.parse(data0x0A) / 1000).toStringAsFixed(2),
      "unit": ' g',
      "imageUrl": 'images/振动加速度.png',
    },
    {
      "title": '温度',
      "data": data0x0B,
      "unit": ' ℃',
      "imageUrl": 'images/温度.png',
    },
    {
      "title": '数据刷新时间',
      "data": data0x0C,
      "unit": '',
      "imageUrl": 'images/time.png',
    },
  ];

  return listData;
}
