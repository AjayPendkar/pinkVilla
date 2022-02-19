class Insta {
  String title;
  String nid;
  String type;
  String shortVideoId;
  String imageUrl;
  String orignalImageUrl;
  String sectionImage;
  String videoImageurlLandscape;
  String postDateUnix;
  String path;
  String description;
  int viewCount;
  String viewCountFormat;
  String postDateStr;
  String commentCount;
  String fieldUaeMicrositeCategories;
  String fieldUaeMicrositeFeaturedArt;
  List<Vimeo> vimeo;

  Insta(
      {this.title,
      this.nid,
      this.type,
      this.shortVideoId,
      this.imageUrl,
      this.orignalImageUrl,
      this.sectionImage,
      this.videoImageurlLandscape,
      this.postDateUnix,
      this.path,
      this.description,
      this.viewCount,
      this.viewCountFormat,
      this.postDateStr,
      this.commentCount,
      this.fieldUaeMicrositeCategories,
      this.fieldUaeMicrositeFeaturedArt,
      this.vimeo});

  Insta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    nid = json['nid'];
    type = json['type'];
    shortVideoId = json['short_video_id'];
    imageUrl = json['imageUrl'];
    orignalImageUrl = json['orignal_imageUrl'];
    sectionImage = json['section_image'];
    videoImageurlLandscape = json['video_imageurl_landscape'];
    postDateUnix = json['postDateUnix'];
    path = json['path'];
    description = json['description'];
    viewCount = json['viewCount'];
    viewCountFormat = json['viewCountFormat'];
    postDateStr = json['postDateStr'];
    commentCount = json['commentCount'];
    fieldUaeMicrositeCategories = json['field_uae_microsite_categories'];
    fieldUaeMicrositeFeaturedArt = json['field_uae_microsite_featured_art'];
    if (json['vimeo'] != null) {
      vimeo = <Vimeo>[];
      json['vimeo'].forEach((v) {
        vimeo.add(new Vimeo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['nid'] = this.nid;
    data['type'] = this.type;
    data['short_video_id'] = this.shortVideoId;
    data['imageUrl'] = this.imageUrl;
    data['orignal_imageUrl'] = this.orignalImageUrl;
    data['section_image'] = this.sectionImage;
    data['video_imageurl_landscape'] = this.videoImageurlLandscape;
    data['postDateUnix'] = this.postDateUnix;
    data['path'] = this.path;
    data['description'] = this.description;
    data['viewCount'] = this.viewCount;
    data['viewCountFormat'] = this.viewCountFormat;
    data['postDateStr'] = this.postDateStr;
    data['commentCount'] = this.commentCount;
    data['field_uae_microsite_categories'] = this.fieldUaeMicrositeCategories;
    data['field_uae_microsite_featured_art'] =
        this.fieldUaeMicrositeFeaturedArt;
    if (this.vimeo != null) {
      data['vimeo'] = this.vimeo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vimeo {
  String quality;
  String type;
  int width;
  int height;
  String link;
  String createdTime;
  int fps;
  int size;
  String md5;
  String publicName;
  String sizeShort;
  String linkSecure;
  String url;
  String profile;

  Vimeo(
      {this.quality,
      this.type,
      this.width,
      this.height,
      this.link,
      this.createdTime,
      this.fps,
      this.size,
      this.md5,
      this.publicName,
      this.sizeShort,
      this.linkSecure,
      this.url,
      this.profile});

  Vimeo.fromJson(Map<String, dynamic> json) {
    quality = json['quality'];
    type = json['type'];
    width = json['width'];
    height = json['height'];
    link = json['link'];
    createdTime = json['created_time'];
    fps = json['fps'];
    size = json['size'];
    md5 = json['md5'];
    publicName = json['public_name'];
    sizeShort = json['size_short'];
    linkSecure = json['link_secure'];
    url = json['url'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality'] = this.quality;
    data['type'] = this.type;
    data['width'] = this.width;
    data['height'] = this.height;
    data['link'] = this.link;
    data['created_time'] = this.createdTime;
    data['fps'] = this.fps;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['public_name'] = this.publicName;
    data['size_short'] = this.sizeShort;
    data['link_secure'] = this.linkSecure;
    data['url'] = this.url;
    data['profile'] = this.profile;
    return data;
  }
}