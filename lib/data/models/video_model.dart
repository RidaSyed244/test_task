class VideoModel {
  int? statusCode;
  String? message;
  UserData? data;

  VideoModel({this.statusCode, this.message, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['statusCode'] = statusCode;
    jsonData['message'] = message;
    if (this.data != null) {
      jsonData['data'] = this.data!.toJson();
    }
    return jsonData;
  }
}

class UserData {
  List<VideoData>? data;
  MetaData? metaData;

  UserData({this.data, this.metaData});

  UserData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VideoData>[];
      json['data'].forEach((v) {
        data!.add(VideoData.fromJson(v));
      });
    }
    metaData =
        json['meta_data'] != null ? MetaData.fromJson(json['meta_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    if (this.data != null) {
      jsonData['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      jsonData['meta_data'] = metaData!.toJson();
    }
    return jsonData;
  }
}

class VideoData {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  String? byteAddedOn;
  String? byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? language;
  int? bunnyEncodingStatus;
  String? deletedAt;
  int? videoHeight;
  int? videoWidth;
  User? user;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  String? videoAspectRatio;

  VideoData({
    this.id,
    this.title,
    this.url,
    this.cdnUrl,
    this.thumbCdnUrl,
    this.userId,
    this.status,
    this.slug,
    this.encodeStatus,
    this.priority,
    this.categoryId,
    this.totalViews,
    this.totalLikes,
    this.totalComments,
    this.totalShare,
    this.totalWishlist,
    this.duration,
    this.byteAddedOn,
    this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.language,
    this.bunnyEncodingStatus,
    this.deletedAt,
    this.videoHeight,
    this.videoWidth,
    this.user,
    this.isLiked,
    this.isWished,
    this.isFollow,
    this.videoAspectRatio,
  });

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    cdnUrl = json['cdn_url'];
    thumbCdnUrl = json['thumb_cdn_url'];
    userId = json['user_id'];
    status = json['status'];
    slug = json['slug'];
    encodeStatus = json['encode_status'];
    priority = json['priority'];
    categoryId = json['category_id'];
    totalViews = json['total_views'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    totalShare = json['total_share'];
    totalWishlist = json['total_wishlist'];
    duration = json['duration'];
    byteAddedOn = json['byte_added_on'];
    byteUpdatedOn = json['byte_updated_on'];
    bunnyStreamVideoId = json['bunny_stream_video_id'];
    language = json['language'];
    bunnyEncodingStatus = json['bunny_encoding_status'];
    deletedAt = json['deleted_at'];
    videoHeight = json['video_height'];
    videoWidth = json['video_width'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    isLiked = json['is_liked'];
    isWished = json['is_wished'];
    isFollow = json['is_follow'];
    videoAspectRatio = json['video_aspect_ratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['id'] = id;
    jsonData['title'] = title;
    jsonData['url'] = url;
    jsonData['cdn_url'] = cdnUrl;
    jsonData['thumb_cdn_url'] = thumbCdnUrl;
    jsonData['user_id'] = userId;
    jsonData['status'] = status;
    jsonData['slug'] = slug;
    jsonData['encode_status'] = encodeStatus;
    jsonData['priority'] = priority;
    jsonData['category_id'] = categoryId;
    jsonData['total_views'] = totalViews;
    jsonData['total_likes'] = totalLikes;
    jsonData['total_comments'] = totalComments;
    jsonData['total_share'] = totalShare;
    jsonData['total_wishlist'] = totalWishlist;
    jsonData['duration'] = duration;
    jsonData['byte_added_on'] = byteAddedOn;
    jsonData['byte_updated_on'] = byteUpdatedOn;
    jsonData['bunny_stream_video_id'] = bunnyStreamVideoId;
    jsonData['language'] = language;
    jsonData['bunny_encoding_status'] = bunnyEncodingStatus;
    jsonData['deleted_at'] = deletedAt;
    jsonData['video_height'] = videoHeight;
    jsonData['video_width'] = videoWidth;
    if (user != null) {
      jsonData['user'] = user!.toJson();
    }
    jsonData['is_liked'] = isLiked;
    jsonData['is_wished'] = isWished;
    jsonData['is_follow'] = isFollow;
    jsonData['video_aspect_ratio'] = videoAspectRatio;
    return jsonData;
  }
}

class User {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User({
    this.userId,
    this.fullname,
    this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    profilePictureCdn = json['profile_picture_cdn'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['user_id'] = userId;
    jsonData['fullname'] = fullname;
    jsonData['username'] = username;
    jsonData['profile_picture'] = profilePicture;
    jsonData['profile_picture_cdn'] = profilePictureCdn;
    jsonData['designation'] = designation;
    return jsonData;
  }
}

class MetaData {
  int? total;
  int? page;
  int? limit;

  MetaData({this.total, this.page, this.limit});

  MetaData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    jsonData['total'] = total;
    jsonData['page'] = page;
    jsonData['limit'] = limit;
    return jsonData;
  }
}
