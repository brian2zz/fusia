import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/voucher/pembayaran.dart';
//simport 'package:fusia/view/voucher/tes.dart';
import 'package:fusia/view/voucher/app_bar.dart';

class getVoucher extends StatelessWidget {
  final AssetImage Banner;
  final int Poin;
  final String HargaVoucher;

  getVoucher({
    Key? key,
    required this.HargaVoucher,
    required this.Banner,
    required this.Poin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle circleFont = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold);

    TextStyle header1 = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.sp,
        color: Color.fromRGBO(80, 36, 35, 1),
        fontWeight: FontWeight.w600);

    TextStyle header2 = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.sp,
        color: Color.fromRGBO(80, 36, 35, 1),
        fontWeight: FontWeight.w500);

    TextStyle isi1 = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10.sp,
        color: Color.fromRGBO(80, 36, 35, 1),
        fontWeight: FontWeight.normal);

    TextStyle isi1Red = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10.sp,
        color: Colors.red,
        fontWeight: FontWeight.normal);

    TextStyle isi2 = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.sp,
      color: Color.fromRGBO(86, 86, 86, 1),
      fontWeight: FontWeight.normal,
    );

    Widget Jarak1() => SizedBox(
          height: 10,
        );
    Widget Jarak2() => SizedBox(
          height: 20,
        );
    Widget Jarak3() => SizedBox(
          height: 50,
        );

    Widget ImageBanner() => Ink.image(
          image: Banner,
          height: 205,
          // width: 377.7,
          fit: BoxFit.cover,
        );
    Widget CirclePoin() => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "${(Poin)} point",
                textAlign: TextAlign.center,
                style: circleFont,
              ),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0.0, 5.0),
                  ),
                ],
              ),
            ),
          ],
        );

    Widget BannerCircle() => Stack(
          clipBehavior: Clip.none,
          children: [
            ImageBanner(),
            Padding(
              padding: EdgeInsets.only(top: 175, left: 325),
              child: CirclePoin(),
            ),
          ],
        );

    Widget Periode() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16).copyWith(bottom: 0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Periode: ',
                      style: isi1,
                      children: <TextSpan>[
                        TextSpan(
                            text: '28 Nov 2021 - 01 Dec 2021', style: isi1Red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

    Widget LogoWarung() => Container(
          padding: EdgeInsets.only(left: 16),
          child: Container(
            child: Image.asset('assets/images/logo_onboarding_2.png'),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(236, 184, 63, 1),
                style: BorderStyle.solid,
              ),
              color: Colors.white,
            ),
          ),
        );

    Widget LogoNamaWarung() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoWarung(),
            SizedBox(
              width: 10,
            ),
            Text("Kampoeng Timbel"),
          ],
        );

    Widget Garis1() => Container(
        height: 2, decoration: BoxDecoration(color: Colors.grey[200]));

    Widget _HargaVoucher() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Voucher Rp ${(HargaVoucher)}', style: header1),
            ),
          ],
        );
    Widget TextDeskripsi() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Text("Description", style: header2),
            ),
          ],
        );

    Widget Garis3() => Container(
        height: 5,
        decoration: BoxDecoration(color: Color.fromRGBO(230, 122, 11, 1)));

    Widget Deskripsi() => SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nibh fusce arcu, nunc dictum nisi, eu. Vulputate et fermentum pulvinar platea adipiscing id. Enim feugiat eget a aliquet orci adipiscing eu. Blandit pellentesque adipiscing imassa condimentum. Enim sed consectetur odio imperdiet platea turpis diam, eu, in.",
                style: isi2),
          ),
        );

    Widget _Button() => Container(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: 500,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(80, 36, 35, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(
                    color: // color:
                        Color.fromRGBO(80, 36, 35, 1),
                  )))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return pembayaran(
                        Banner: Banner, HargaVoucher: HargaVoucher, Poin: Poin);
                  },
                ));
              },
              child: Text('Ambil Voucher',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
        );

    return Scaffold(
      appBar: app_bar(title: "Voucher Rp ${(HargaVoucher)}"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerCircle(),
            Jarak2(),
            LogoNamaWarung(),
            Jarak2(),
            Garis1(),
            Jarak1(),
            _HargaVoucher(),
            Periode(),
            Jarak2(),
            TextDeskripsi(),
            Jarak1(),
            Garis3(),
            Jarak2(),
            Deskripsi(),
            Jarak2(),
            _Button(),
          ],
        ),
      ),
    );
  }
}
