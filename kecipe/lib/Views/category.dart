import 'package:flutter/material.dart';
import 'package:kecipe/Views/meal_type_card.dart';
import 'package:kecipe/Views/recipe_list.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/services/global_bloc.dart';

class Category extends StatelessWidget {
  const Category({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<String> types = ['Chicken', 'Healthy', 'Keto', 'Salad', 'Eggs', 'Beef', 'Breakfast',
    'Brownie', 'Cookies', 'Desserts', 'Ice Cream', 'Juice', 'Kid', 'Pie', 'Pork', 'Smoothie', 'Steak', 'Vegetarian'];
  List<String> images = ['chicken.jpeg', 'healthy.jpeg', 'keto.jpeg', 'salad.jpeg', 'eggs.jpeg', 'beef.jpeg', 'breakfast.jpeg',
    'brownie.jpg', 'cookies.jpeg', 'desserts.jpeg', 'icecream.jpeg', 'juice.jpeg', 'kid.jpg', 'pie.jpeg', 'pork.jpeg', 'smoothie.jpeg', 'steak.jpeg', 'vegetarian.jpg'];
    return Container(
      child: Scaffold(
      appBar: AppBar(
        title: Text('Category'
        , style: TextStyle(
            color: Constants.darkBG
          ),),
        backgroundColor: Constants.lightPrimary,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Choose your meal \ncategory',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueGrey[300],
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Input category here",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey[300],
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
//                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  return new MealTypeCard(
                    type: types[index],
                    imageName: images[index],
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {return RecipeList(type: types[index]);
                            }
                          )
                      );
                    },
                  );
                }
            )
          )
        ],
      ),
    );,
    );
  }
}

// class Category extends StatefulWidget {
//   @override
//   _CategoryState createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
  
//   @override
//   Widget build(BuildContext context) {
    
//     return 
//   }
// }
