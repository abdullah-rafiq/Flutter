import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:x/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;
  // Generating 20 tweets for "For You"
  final List<Map<String, String>> tweets = List.generate(
    20,
    (index) => {
      'username': 'user$index',
      'content': 'This is tweet #$index',
      'time': '${index}m ago',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/$index.jpg',
      'imageUrl': 'https://via.placeholder.com/150'
    },
  );

  // Generating 15 tweets for "Following"
  final List<Map<String, String>> followingTweets = List.generate(
    15,
    (index) => {
      'username': 'followed_user$index',
      'content': 'Following tweet #$index',
      'time': '${index + 10}m ago',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/${index + 5}.jpg',
      'imageUrl': 'https://via.placeholder.com/150'
    },
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    backgroundColor: Colors.white,
    drawer: const CustomDrawer(),
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150.0,
          floating: false,
          pinned: true,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/logo/logo.png'),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/timeline_setting_sc');
              },
            ),
          ],
          title: Image.asset('assets/logo/logo.png', width: 30, height: 30),
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'For You'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: [
              // For You Tab
              ListView.builder(
                itemCount: tweets.length,
                itemBuilder: (context, index) {
                  return TweetCard(tweet: tweets[index]);
                },
              ),
              // Following Tab
              ListView.builder(
                itemCount: followingTweets.length,
                itemBuilder: (context, index) {
                  return TweetCard(tweet: followingTweets[index]);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}

class TweetCard extends StatelessWidget {
  final Map<String, String> tweet;

  const TweetCard({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with avatar and username
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: CachedNetworkImageProvider(tweet['avatarUrl']!),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tweet['username']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tweet['time']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Tweet content
            Text(
              tweet['content']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            // Media content (if any)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  tweet['imageUrl']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.comment),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.retweet),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.bookmark),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.share),
                  onPressed: () {},
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
