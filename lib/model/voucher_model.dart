// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';

List<VoucherModel> voucherModelFromJson(String str) => List<VoucherModel>.from(json.decode(str).map((x) => VoucherModel.fromJson(x)));

String voucherModelToJson(List<VoucherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
    VoucherModel({
        this.idVoucher,
        this.kodeVoucher,
        this.verifikasiVoucher,
        this.jenisVoucher,
        this.tanpaKodeVoucher,
        this.jenisPromoOngkir,
        this.ongkirFlatRp,
        this.nilaiRp,
        this.nilaiPersen,
        this.nilaiMaxRp,
        this.minimumRp,
        this.tanggalAwal,
        this.tanggalAkhir,
        this.maksimumDigunakan,
        this.custId,
        this.custOpsi,
        this.keterangan,
    });

    String? idVoucher;
    String? kodeVoucher;
    String? verifikasiVoucher;
    String? jenisVoucher;
    String? tanpaKodeVoucher;
    String? jenisPromoOngkir;
    String? ongkirFlatRp;
    String? nilaiRp;
    String? nilaiPersen;
    String? nilaiMaxRp;
    String? minimumRp;
    DateTime? tanggalAwal;
    DateTime? tanggalAkhir;
    String? maksimumDigunakan;
    String? custId;
    String? custOpsi;
    String? keterangan;

    factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        idVoucher: json["id_voucher"],
        kodeVoucher: json["kode_voucher"],
        verifikasiVoucher: json["verifikasi_voucher"],
        jenisVoucher: json["jenis_voucher"],
        tanpaKodeVoucher: json["tanpa_kode_voucher"],
        jenisPromoOngkir: json["jenis_promo_ongkir"],
        ongkirFlatRp: json["ongkir_flat_rp"],
        nilaiRp: json["nilai_rp"],
        nilaiPersen: json["nilai_persen"],
        nilaiMaxRp: json["nilai_max_rp"],
        minimumRp: json["minimum_rp"],
        tanggalAwal: DateTime.parse(json["tanggal_awal"]),
        tanggalAkhir: DateTime.parse(json["tanggal_akhir"]),
        maksimumDigunakan: json["maksimum_digunakan"],
        custId: json["cust_id"],
        custOpsi: json["cust_opsi"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "id_voucher": idVoucher,
        "kode_voucher": kodeVoucher,
        "verifikasi_voucher": verifikasiVoucher,
        "jenis_voucher": jenisVoucher,
        "tanpa_kode_voucher": tanpaKodeVoucher,
        "jenis_promo_ongkir": jenisPromoOngkir,
        "ongkir_flat_rp": ongkirFlatRp,
        "nilai_rp": nilaiRp,
        "nilai_persen": nilaiPersen,
        "nilai_max_rp": nilaiMaxRp,
        "minimum_rp": minimumRp,
        "tanggal_awal": "${tanggalAwal!.year.toString().padLeft(4, '0')}-${tanggalAwal!.month.toString().padLeft(2, '0')}-${tanggalAwal!.day.toString().padLeft(2, '0')}",
        "tanggal_akhir": "${tanggalAkhir!.year.toString().padLeft(4, '0')}-${tanggalAkhir!.month.toString().padLeft(2, '0')}-${tanggalAkhir!.day.toString().padLeft(2, '0')}",
        "maksimum_digunakan": maksimumDigunakan,
        "cust_id": custId,
        "cust_opsi": custOpsi,
        "keterangan": keterangan,
    };
}
