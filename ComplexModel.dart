import 'dart:convert';
/// platform : {"name":"Social Connect","launchedYear":2020,"features":["Posts","Comments","Likes","Messages","Notifications"]}
/// users : [{"id":1,"username":"arham123","email":"arham123@example.com","profile":{"fullName":"Arham Ali","bio":"Flutter Developer | Tech Enthusiast","profilePicture":"https://example.com/profiles/arham123.jpg","location":{"city":"Karachi","country":"Pakistan"}},"friends":[{"userId":2,"username":"ahmed456"},{"userId":3,"username":"sara789"}],"posts":[{"postId":"post101","timestamp":"2024-08-20T10:30:00Z","content":{"text":"Just started learning Flutter, loving it!","media":{"type":"image","url":"https://example.com/posts/post101.jpg"}},"likes":[{"userId":2,"username":"ahmed456"},{"userId":4,"username":"zohaib001"}],"comments":[{"commentId":"comment201","userId":3,"username":"sara789","text":"That's awesome! Keep it up.","timestamp":"2024-08-20T11:00:00Z"},{"commentId":"comment202","userId":5,"username":"faraz900","text":"I'm learning too, it's a great framework.","timestamp":"2024-08-20T11:15:00Z"}]},{"postId":"post102","timestamp":"2024-08-21T14:45:00Z","content":{"text":"Does anyone have experience with Firebase?","media":null},"likes":[],"comments":[]}]},{"id":2,"username":"ahmed456","email":"ahmed456@example.com","profile":{"fullName":"Ahmed Khan","bio":"Data Scientist | AI Enthusiast","profilePicture":"https://example.com/profiles/ahmed456.jpg","location":{"city":"Lahore","country":"Pakistan"}},"friends":[{"userId":1,"username":"arham123"},{"userId":3,"username":"sara789"}],"posts":[]}]
/// trendingTopics : [{"topic":"#Flutter","mentions":15000},{"topic":"#AI","mentions":12000},{"topic":"#TechTrends","mentions":8000}]
/// directMessages : [{"conversationId":"conv001","participants":[{"userId":1,"username":"arham123"},{"userId":2,"username":"ahmed456"}],"messages":[{"messageId":"msg101","senderId":1,"text":"Hey Ahmed, how's your AI project going?","timestamp":"2024-08-19T09:15:00Z"},{"messageId":"msg102","senderId":2,"text":"Hi Arham, it's going great! How about your Flutter learning?","timestamp":"2024-08-19T09:17:00Z"}]}]

ComplexModel complexModelFromJson(String str) => ComplexModel.fromJson(json.decode(str));
String complexModelToJson(ComplexModel data) => json.encode(data.toJson());
class ComplexModel {
  ComplexModel({
      Platform? platform, 
      List<Users>? users, 
      List<TrendingTopics>? trendingTopics, 
      List<DirectMessages>? directMessages,}){
    _platform = platform;
    _users = users;
    _trendingTopics = trendingTopics;
    _directMessages = directMessages;
}

  ComplexModel.fromJson(dynamic json) {
    _platform = json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    if (json['trendingTopics'] != null) {
      _trendingTopics = [];
      json['trendingTopics'].forEach((v) {
        _trendingTopics?.add(TrendingTopics.fromJson(v));
      });
    }
    if (json['directMessages'] != null) {
      _directMessages = [];
      json['directMessages'].forEach((v) {
        _directMessages?.add(DirectMessages.fromJson(v));
      });
    }
  }
  Platform? _platform;
  List<Users>? _users;
  List<TrendingTopics>? _trendingTopics;
  List<DirectMessages>? _directMessages;
ComplexModel copyWith({  Platform? platform,
  List<Users>? users,
  List<TrendingTopics>? trendingTopics,
  List<DirectMessages>? directMessages,
}) => ComplexModel(  platform: platform ?? _platform,
  users: users ?? _users,
  trendingTopics: trendingTopics ?? _trendingTopics,
  directMessages: directMessages ?? _directMessages,
);
  Platform? get platform => _platform;
  List<Users>? get users => _users;
  List<TrendingTopics>? get trendingTopics => _trendingTopics;
  List<DirectMessages>? get directMessages => _directMessages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_platform != null) {
      map['platform'] = _platform?.toJson();
    }
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    if (_trendingTopics != null) {
      map['trendingTopics'] = _trendingTopics?.map((v) => v.toJson()).toList();
    }
    if (_directMessages != null) {
      map['directMessages'] = _directMessages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// conversationId : "conv001"
/// participants : [{"userId":1,"username":"arham123"},{"userId":2,"username":"ahmed456"}]
/// messages : [{"messageId":"msg101","senderId":1,"text":"Hey Ahmed, how's your AI project going?","timestamp":"2024-08-19T09:15:00Z"},{"messageId":"msg102","senderId":2,"text":"Hi Arham, it's going great! How about your Flutter learning?","timestamp":"2024-08-19T09:17:00Z"}]

DirectMessages directMessagesFromJson(String str) => DirectMessages.fromJson(json.decode(str));
String directMessagesToJson(DirectMessages data) => json.encode(data.toJson());
class DirectMessages {
  DirectMessages({
      String? conversationId, 
      List<Participants>? participants, 
      List<Messages>? messages,}){
    _conversationId = conversationId;
    _participants = participants;
    _messages = messages;
}

  DirectMessages.fromJson(dynamic json) {
    _conversationId = json['conversationId'];
    if (json['participants'] != null) {
      _participants = [];
      json['participants'].forEach((v) {
        _participants?.add(Participants.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      _messages = [];
      json['messages'].forEach((v) {
        _messages?.add(Messages.fromJson(v));
      });
    }
  }
  String? _conversationId;
  List<Participants>? _participants;
  List<Messages>? _messages;
DirectMessages copyWith({  String? conversationId,
  List<Participants>? participants,
  List<Messages>? messages,
}) => DirectMessages(  conversationId: conversationId ?? _conversationId,
  participants: participants ?? _participants,
  messages: messages ?? _messages,
);
  String? get conversationId => _conversationId;
  List<Participants>? get participants => _participants;
  List<Messages>? get messages => _messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['conversationId'] = _conversationId;
    if (_participants != null) {
      map['participants'] = _participants?.map((v) => v.toJson()).toList();
    }
    if (_messages != null) {
      map['messages'] = _messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// messageId : "msg101"
/// senderId : 1
/// text : "Hey Ahmed, how's your AI project going?"
/// timestamp : "2024-08-19T09:15:00Z"

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));
String messagesToJson(Messages data) => json.encode(data.toJson());
class Messages {
  Messages({
      String? messageId, 
      num? senderId, 
      String? text, 
      String? timestamp,}){
    _messageId = messageId;
    _senderId = senderId;
    _text = text;
    _timestamp = timestamp;
}

  Messages.fromJson(dynamic json) {
    _messageId = json['messageId'];
    _senderId = json['senderId'];
    _text = json['text'];
    _timestamp = json['timestamp'];
  }
  String? _messageId;
  num? _senderId;
  String? _text;
  String? _timestamp;
Messages copyWith({  String? messageId,
  num? senderId,
  String? text,
  String? timestamp,
}) => Messages(  messageId: messageId ?? _messageId,
  senderId: senderId ?? _senderId,
  text: text ?? _text,
  timestamp: timestamp ?? _timestamp,
);
  String? get messageId => _messageId;
  num? get senderId => _senderId;
  String? get text => _text;
  String? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageId'] = _messageId;
    map['senderId'] = _senderId;
    map['text'] = _text;
    map['timestamp'] = _timestamp;
    return map;
  }

}

/// userId : 1
/// username : "arham123"

Participants participantsFromJson(String str) => Participants.fromJson(json.decode(str));
String participantsToJson(Participants data) => json.encode(data.toJson());
class Participants {
  Participants({
      num? userId, 
      String? username,}){
    _userId = userId;
    _username = username;
}

  Participants.fromJson(dynamic json) {
    _userId = json['userId'];
    _username = json['username'];
  }
  num? _userId;
  String? _username;
Participants copyWith({  num? userId,
  String? username,
}) => Participants(  userId: userId ?? _userId,
  username: username ?? _username,
);
  num? get userId => _userId;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['username'] = _username;
    return map;
  }

}

/// topic : "#Flutter"
/// mentions : 15000

TrendingTopics trendingTopicsFromJson(String str) => TrendingTopics.fromJson(json.decode(str));
String trendingTopicsToJson(TrendingTopics data) => json.encode(data.toJson());
class TrendingTopics {
  TrendingTopics({
      String? topic, 
      num? mentions,}){
    _topic = topic;
    _mentions = mentions;
}

  TrendingTopics.fromJson(dynamic json) {
    _topic = json['topic'];
    _mentions = json['mentions'];
  }
  String? _topic;
  num? _mentions;
TrendingTopics copyWith({  String? topic,
  num? mentions,
}) => TrendingTopics(  topic: topic ?? _topic,
  mentions: mentions ?? _mentions,
);
  String? get topic => _topic;
  num? get mentions => _mentions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['topic'] = _topic;
    map['mentions'] = _mentions;
    return map;
  }

}

/// id : 1
/// username : "arham123"
/// email : "arham123@example.com"
/// profile : {"fullName":"Arham Ali","bio":"Flutter Developer | Tech Enthusiast","profilePicture":"https://example.com/profiles/arham123.jpg","location":{"city":"Karachi","country":"Pakistan"}}
/// friends : [{"userId":2,"username":"ahmed456"},{"userId":3,"username":"sara789"}]
/// posts : [{"postId":"post101","timestamp":"2024-08-20T10:30:00Z","content":{"text":"Just started learning Flutter, loving it!","media":{"type":"image","url":"https://example.com/posts/post101.jpg"}},"likes":[{"userId":2,"username":"ahmed456"},{"userId":4,"username":"zohaib001"}],"comments":[{"commentId":"comment201","userId":3,"username":"sara789","text":"That's awesome! Keep it up.","timestamp":"2024-08-20T11:00:00Z"},{"commentId":"comment202","userId":5,"username":"faraz900","text":"I'm learning too, it's a great framework.","timestamp":"2024-08-20T11:15:00Z"}]},{"postId":"post102","timestamp":"2024-08-21T14:45:00Z","content":{"text":"Does anyone have experience with Firebase?","media":null},"likes":[],"comments":[]}]

Users usersFromJson(String str) => Users.fromJson(json.decode(str));
String usersToJson(Users data) => json.encode(data.toJson());
class Users {
  Users({
      num? id, 
      String? username, 
      String? email, 
      Profile? profile, 
      List<Friends>? friends, 
      List<Posts>? posts,}){
    _id = id;
    _username = username;
    _email = email;
    _profile = profile;
    _friends = friends;
    _posts = posts;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    if (json['friends'] != null) {
      _friends = [];
      json['friends'].forEach((v) {
        _friends?.add(Friends.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(Posts.fromJson(v));
      });
    }
  }
  num? _id;
  String? _username;
  String? _email;
  Profile? _profile;
  List<Friends>? _friends;
  List<Posts>? _posts;
Users copyWith({  num? id,
  String? username,
  String? email,
  Profile? profile,
  List<Friends>? friends,
  List<Posts>? posts,
}) => Users(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  profile: profile ?? _profile,
  friends: friends ?? _friends,
  posts: posts ?? _posts,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  Profile? get profile => _profile;
  List<Friends>? get friends => _friends;
  List<Posts>? get posts => _posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    if (_friends != null) {
      map['friends'] = _friends?.map((v) => v.toJson()).toList();
    }
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// postId : "post101"
/// timestamp : "2024-08-20T10:30:00Z"
/// content : {"text":"Just started learning Flutter, loving it!","media":{"type":"image","url":"https://example.com/posts/post101.jpg"}}
/// likes : [{"userId":2,"username":"ahmed456"},{"userId":4,"username":"zohaib001"}]
/// comments : [{"commentId":"comment201","userId":3,"username":"sara789","text":"That's awesome! Keep it up.","timestamp":"2024-08-20T11:00:00Z"},{"commentId":"comment202","userId":5,"username":"faraz900","text":"I'm learning too, it's a great framework.","timestamp":"2024-08-20T11:15:00Z"}]

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());
class Posts {
  Posts({
      String? postId, 
      String? timestamp, 
      Content? content, 
      List<Likes>? likes, 
      List<Comments>? comments,}){
    _postId = postId;
    _timestamp = timestamp;
    _content = content;
    _likes = likes;
    _comments = comments;
}

  Posts.fromJson(dynamic json) {
    _postId = json['postId'];
    _timestamp = json['timestamp'];
    _content = json['content'] != null ? Content.fromJson(json['content']) : null;
    if (json['likes'] != null) {
      _likes = [];
      json['likes'].forEach((v) {
        _likes?.add(Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  String? _postId;
  String? _timestamp;
  Content? _content;
  List<Likes>? _likes;
  List<Comments>? _comments;
Posts copyWith({  String? postId,
  String? timestamp,
  Content? content,
  List<Likes>? likes,
  List<Comments>? comments,
}) => Posts(  postId: postId ?? _postId,
  timestamp: timestamp ?? _timestamp,
  content: content ?? _content,
  likes: likes ?? _likes,
  comments: comments ?? _comments,
);
  String? get postId => _postId;
  String? get timestamp => _timestamp;
  Content? get content => _content;
  List<Likes>? get likes => _likes;
  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = _postId;
    map['timestamp'] = _timestamp;
    if (_content != null) {
      map['content'] = _content?.toJson();
    }
    if (_likes != null) {
      map['likes'] = _likes?.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// commentId : "comment201"
/// userId : 3
/// username : "sara789"
/// text : "That's awesome! Keep it up."
/// timestamp : "2024-08-20T11:00:00Z"

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      String? commentId, 
      num? userId, 
      String? username, 
      String? text, 
      String? timestamp,}){
    _commentId = commentId;
    _userId = userId;
    _username = username;
    _text = text;
    _timestamp = timestamp;
}

  Comments.fromJson(dynamic json) {
    _commentId = json['commentId'];
    _userId = json['userId'];
    _username = json['username'];
    _text = json['text'];
    _timestamp = json['timestamp'];
  }
  String? _commentId;
  num? _userId;
  String? _username;
  String? _text;
  String? _timestamp;
Comments copyWith({  String? commentId,
  num? userId,
  String? username,
  String? text,
  String? timestamp,
}) => Comments(  commentId: commentId ?? _commentId,
  userId: userId ?? _userId,
  username: username ?? _username,
  text: text ?? _text,
  timestamp: timestamp ?? _timestamp,
);
  String? get commentId => _commentId;
  num? get userId => _userId;
  String? get username => _username;
  String? get text => _text;
  String? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['commentId'] = _commentId;
    map['userId'] = _userId;
    map['username'] = _username;
    map['text'] = _text;
    map['timestamp'] = _timestamp;
    return map;
  }

}

/// userId : 2
/// username : "ahmed456"

Likes likesFromJson(String str) => Likes.fromJson(json.decode(str));
String likesToJson(Likes data) => json.encode(data.toJson());
class Likes {
  Likes({
      num? userId, 
      String? username,}){
    _userId = userId;
    _username = username;
}

  Likes.fromJson(dynamic json) {
    _userId = json['userId'];
    _username = json['username'];
  }
  num? _userId;
  String? _username;
Likes copyWith({  num? userId,
  String? username,
}) => Likes(  userId: userId ?? _userId,
  username: username ?? _username,
);
  num? get userId => _userId;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['username'] = _username;
    return map;
  }

}

/// text : "Just started learning Flutter, loving it!"
/// media : {"type":"image","url":"https://example.com/posts/post101.jpg"}

Content contentFromJson(String str) => Content.fromJson(json.decode(str));
String contentToJson(Content data) => json.encode(data.toJson());
class Content {
  Content({
      String? text, 
      Media? media,}){
    _text = text;
    _media = media;
}

  Content.fromJson(dynamic json) {
    _text = json['text'];
    _media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }
  String? _text;
  Media? _media;
Content copyWith({  String? text,
  Media? media,
}) => Content(  text: text ?? _text,
  media: media ?? _media,
);
  String? get text => _text;
  Media? get media => _media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    if (_media != null) {
      map['media'] = _media?.toJson();
    }
    return map;
  }

}

/// type : "image"
/// url : "https://example.com/posts/post101.jpg"

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));
String mediaToJson(Media data) => json.encode(data.toJson());
class Media {
  Media({
      String? type, 
      String? url,}){
    _type = type;
    _url = url;
}

  Media.fromJson(dynamic json) {
    _type = json['type'];
    _url = json['url'];
  }
  String? _type;
  String? _url;
Media copyWith({  String? type,
  String? url,
}) => Media(  type: type ?? _type,
  url: url ?? _url,
);
  String? get type => _type;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }

}

/// userId : 2
/// username : "ahmed456"

Friends friendsFromJson(String str) => Friends.fromJson(json.decode(str));
String friendsToJson(Friends data) => json.encode(data.toJson());
class Friends {
  Friends({
      num? userId, 
      String? username,}){
    _userId = userId;
    _username = username;
}

  Friends.fromJson(dynamic json) {
    _userId = json['userId'];
    _username = json['username'];
  }
  num? _userId;
  String? _username;
Friends copyWith({  num? userId,
  String? username,
}) => Friends(  userId: userId ?? _userId,
  username: username ?? _username,
);
  num? get userId => _userId;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['username'] = _username;
    return map;
  }

}

/// fullName : "Arham Ali"
/// bio : "Flutter Developer | Tech Enthusiast"
/// profilePicture : "https://example.com/profiles/arham123.jpg"
/// location : {"city":"Karachi","country":"Pakistan"}

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());
class Profile {
  Profile({
      String? fullName, 
      String? bio, 
      String? profilePicture, 
      Location? location,}){
    _fullName = fullName;
    _bio = bio;
    _profilePicture = profilePicture;
    _location = location;
}

  Profile.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _bio = json['bio'];
    _profilePicture = json['profilePicture'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  String? _fullName;
  String? _bio;
  String? _profilePicture;
  Location? _location;
Profile copyWith({  String? fullName,
  String? bio,
  String? profilePicture,
  Location? location,
}) => Profile(  fullName: fullName ?? _fullName,
  bio: bio ?? _bio,
  profilePicture: profilePicture ?? _profilePicture,
  location: location ?? _location,
);
  String? get fullName => _fullName;
  String? get bio => _bio;
  String? get profilePicture => _profilePicture;
  Location? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['bio'] = _bio;
    map['profilePicture'] = _profilePicture;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}

/// city : "Karachi"
/// country : "Pakistan"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? city, 
      String? country,}){
    _city = city;
    _country = country;
}

  Location.fromJson(dynamic json) {
    _city = json['city'];
    _country = json['country'];
  }
  String? _city;
  String? _country;
Location copyWith({  String? city,
  String? country,
}) => Location(  city: city ?? _city,
  country: country ?? _country,
);
  String? get city => _city;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['country'] = _country;
    return map;
  }

}

/// name : "Social Connect"
/// launchedYear : 2020
/// features : ["Posts","Comments","Likes","Messages","Notifications"]

Platform platformFromJson(String str) => Platform.fromJson(json.decode(str));
String platformToJson(Platform data) => json.encode(data.toJson());
class Platform {
  Platform({
      String? name, 
      num? launchedYear, 
      List<String>? features,}){
    _name = name;
    _launchedYear = launchedYear;
    _features = features;
}

  Platform.fromJson(dynamic json) {
    _name = json['name'];
    _launchedYear = json['launchedYear'];
    _features = json['features'] != null ? json['features'].cast<String>() : [];
  }
  String? _name;
  num? _launchedYear;
  List<String>? _features;
Platform copyWith({  String? name,
  num? launchedYear,
  List<String>? features,
}) => Platform(  name: name ?? _name,
  launchedYear: launchedYear ?? _launchedYear,
  features: features ?? _features,
);
  String? get name => _name;
  num? get launchedYear => _launchedYear;
  List<String>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['launchedYear'] = _launchedYear;
    map['features'] = _features;
    return map;
  }

}