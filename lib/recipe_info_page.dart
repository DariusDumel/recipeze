import 'package:flutter/material.dart';
import 'package:recipeze/recipe.dart';

class MealDetailScreen extends StatelessWidget {
  final Recipe recipe;
  MealDetailScreen(@required this.recipe) : assert(recipe != null);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainerPrep(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 500,
      child: child,
    );
  }

  Widget buildContainerSteps(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 400,
      width: 500,
      child: child,
    );
  }

  Widget imageContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          leading:
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => {}),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.mode_edit), onPressed: () => {}),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
                )),
            buildSectionTitle(context, 'Preparation'),
            buildContainerPrep(
              ListView.builder(
                //itemCount: selectedMeal.ingredients.length
                itemCount: (recipe.prepSteps).length,
                itemBuilder: (ctx, index) {
                  final prepSteps = recipe.prepSteps;

                  return Card(
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: Text(prepSteps[index],
                            style: TextStyle(color: Colors.black),
                            textDirection: TextDirection.ltr)),
                  );
                },
              ),
      appBar: AppBar(
        title: Text('Chiken Boi Recipe'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => { }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.mode_edit), onPressed: () => { }),
          IconButton(icon: Icon(Icons.info), onPressed: () {
            Navigator.of(context).push(_createRoute());
          },),
        ],
      ),

      body: SingleChildScrollView(
       child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              'https://gbc-cdn-public-media.azureedge.net/img83669.768x512.jpg',
            )
          ),


          buildSectionTitle(context, 'Preparation'),
          buildContainerPrep(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                  child: Text("Maybe you add something here",
                      style: TextStyle(color: Colors.black),
                      textDirection: TextDirection.ltr)),
              ),

              //itemCount: selectedMeal.length
              itemCount: 10,
            ),
            buildSectionTitle(context, 'Recipe Steps'),
            buildContainerSteps(
              ListView.builder(
                itemCount: recipe.cookSteps.length,
                itemBuilder: (ctx, index) {
                  final cookSteps = recipe.cookSteps;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(cookSteps[index]),
                        //meal.step[index]
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        )));
  }
}



Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
