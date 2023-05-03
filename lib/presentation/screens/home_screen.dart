import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/graphql_services.dart';
import '../../domain/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> _characters = [];
  // List<Character> _characters = [
  //   Character(
  //       id: 218,
  //       name: "Mechanical Rick",
  //       imageUrl: "https://rickandmortyapi.com/api/character/avatar/218.jpeg")
  // ];
  final GraphQlServices _graphQlServices = GraphQlServices();
  _load() async {
    _characters = [];
    _characters = await _graphQlServices.getCharacters();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GraphQL Demo")),
      ),
      body: _characters == []
          ? const Center(child: Text("No Character exist"))
          : _characters.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  itemCount: _characters.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10.0,
                    mainAxisExtent: 225.0,
                    mainAxisSpacing: 10.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      // Text(_characters[0].name),
                      CartOfCharacter(character: _characters[index]),
                ),
    );
  }
}

class CartOfCharacter extends StatelessWidget {
  const CartOfCharacter({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffED9728),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Image.network(
              character.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // CachedNetworkImage(imageUrl: character.imageUrl),
          const SizedBox(height: 10.0),
          Text(character.name),
        ],
      ),
    );
  }
}
