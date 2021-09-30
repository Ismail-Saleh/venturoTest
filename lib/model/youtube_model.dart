class YoutubeModel {
  int? statusCode;
  List<Data>? data;

  YoutubeModel({this.statusCode, this.data});

  YoutubeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? noUrut;
  String? nama;
  int? level;
  int? parentId;
  int? pelajaranId;
  int? isDeleted;
  int? createdAt;
  int? createdBy;
  int? modifiedAt;
  int? modifiedBy;
  List<Detail>? detail;

  Data(
      {this.id,
      this.noUrut,
      this.nama,
      this.level,
      this.parentId,
      this.pelajaranId,
      this.isDeleted,
      this.createdAt,
      this.createdBy,
      this.modifiedAt,
      this.modifiedBy,
      required this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noUrut = json['no_urut'];
    nama = json['nama'];
    level = json['level'];
    parentId = json['parent_id'];
    pelajaranId = json['pelajaran_id'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    if (json['detail'] != null) {
      detail = new List<Detail>.empty(growable: true);
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_urut'] = this.noUrut;
    data['nama'] = this.nama;
    data['level'] = this.level;
    data['parent_id'] = this.parentId;
    data['pelajaran_id'] = this.pelajaranId;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  late String youtubeId;
  late String youtubeUrl;

  Detail({required this.youtubeId, required this.youtubeUrl});

  Detail.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'];
    youtubeUrl = json['youtube_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['youtube_id'] = this.youtubeId;
    data['youtube_url'] = this.youtubeUrl;
    return data;
  }
}
