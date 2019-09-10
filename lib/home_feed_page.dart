import 'package:flutter/material.dart';
import 'package:meme_maker/avatar_widget.dart';
import 'package:meme_maker/post_widget.dart';
import 'package:meme_maker/models.dart';
import 'package:meme_maker/ui_utils.dart';

class HomeFeedPage extends StatefulWidget {
  final ScrollController scrollController;

  HomeFeedPage({this.scrollController});

  @override
  _HomeFeedPageState createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {

  final _posts = <Post>[

    Post(

      user: akshaydhone,

      imageUrls: [
        'assets/images/mick.png',
        'assets/images/groot4.jpg',
        'assets/images/groot5.jpg',
      ],
      likes: [
        Like(user: niteshkhanna),
        Like(user: pawankumar),
        Like(user: rahuljain),
        Like(user: abhisheksingh),
      ],
      comments: [
        Comment(
          text: 'So we’re saving the galaxy again?',
          user: niteshkhanna,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: abhisheksingh)],
        ),
      ],
      location: 'Webcubic',

      postedAt: DateTime(2019, 5, 23, 12, 35, 0),

    ),
    Post(
      user: abhisheksingh,
      imageUrls: ['assets/images/react.png'],
      likes: [],
      comments: [],
      location: 'Andheri West',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: rajkumarshetty,
      imageUrls: ['assets/images/shick.png'],
      likes: [Like(user: abhisheksingh)],
      comments: [],
      location: 'Bandra Terminus',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),



    Post(
      user: abhisheksingh,
      imageUrls: ['assets/images/ar1.png'],
      likes: [Like(user: abhisheksingh)],
      comments: [],
      location: 'Dadar Station',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),




    Post(
      user: rahuljain,
      imageUrls: ['assets/images/ar2.png'],
      likes: [Like(user: abhisheksingh)],
      comments: [],
      location: 'Prabhadevi Station',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),


    Post(
      user: rajkumarshetty,
      imageUrls: ['assets/images/ar3.png'],
      likes: [Like(user: abhisheksingh)],
      comments: [],
      location: 'Churchgate Station',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return StoriesBarWidget();
        }
        return PostWidget(_posts[i - 1]);
      },
      itemCount: _posts.length + 1,
      controller: widget.scrollController,
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[

  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
    i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            user: _users[i],
            onTap: () => _onUserStoryTap(context, i),
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}
