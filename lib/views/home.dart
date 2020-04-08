import 'package:bookshelf_app/views/book_details.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf_app/data/data.dart';
import 'package:bookshelf_app/models/book_model.dart';
import 'package:bookshelf_app/models/single_book_model.dart';
import 'package:bookshelf_app/resource/widgets.dart';

String slectedCategorie = "All";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> categories = ["All","Recommended","Popular books","My books"];

  List<BookModel> books = new List<BookModel>();
  List<SingleBookModel> singleeBooks = new List<SingleBookModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    books = getBooks();
    singleeBooks = getSingleBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF2F5F9),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 70,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Text("Hi John,", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24
                    ),),
                    Spacer(),
                    Image.asset("assets/search.png",),
                    SizedBox(width: 14,),
                    Image.asset("assets/notification.png",width: 28,)
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Image.asset("assets/banner.png",fit: BoxFit.fitWidth,),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return CategorieTile(
                        text: categories[index],
                        isSelected: slectedCategorie == categories[index],
                      );
                    }),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return BooksTile(
                        imgAssetPath: books[index].imgAssetPath,
                        rating: books[index].rating,
                        title: books[index].title,
                        description: books[index].description,
                        categorie: books[index].categorie,
                      );
                    }),
              ),
              SizedBox(height: 16,),
              Text("You may also like", style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 12,),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: singleeBooks.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return SingleBookTile(
                        title: singleeBooks[index].title,
                        categorie: singleeBooks[index].categorie,
                        imgAssetPath: singleeBooks[index].imgAssetPath,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget {

  final String text;
  final bool isSelected;
  CategorieTile({this.text, @required this.isSelected});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 12),
              child: Text(widget.text, style: TextStyle(
                  color: widget.isSelected ? Colors.black87 : Colors.grey,
                  fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: widget.isSelected ? 23 : 18
              ),),
            ),
            SizedBox(height: 3,),
            widget.isSelected ? Container(
              height: 5,
              width: 16,
              decoration: BoxDecoration(
                  color: Color(0xff007084),
                  borderRadius: BorderRadius.circular(12)
              ),
            ) : Container()
          ],
        )
    );
  }
}

class BooksTile extends StatelessWidget {

  final String imgAssetPath,title,description, categorie;
  final int rating;
  BooksTile({@required this.rating,@required this.description,
    @required this.title,@required this.categorie, @required this.imgAssetPath});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookDetails()
        ));
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.only(right: 16),
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 140,
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title, style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 8,),
                            Text(description, style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                            ),),
                            Spacer(),
                            Row(
                              children: <Widget>[
                                StarRating(
                                  rating: rating,
                                ),
                                Spacer(),
                                Text(categorie,style: TextStyle(
                                    color: Color(0xff007084)
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Container(
              height: 180,
              margin: EdgeInsets.only(left: 12,
                top: 6,),
              child: Image.asset(imgAssetPath, height: 150,width: 100,
                fit: BoxFit.cover,),
            )
          ],
        ),
      ),
    );
  }
}

class SingleBookTile extends StatelessWidget {

  final String title,categorie, imgAssetPath;
  SingleBookTile({this.title,this.categorie,this.imgAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(imgAssetPath, height: 170,fit: BoxFit.fitHeight,) ,
          Text(title, style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),),
          Text(categorie, style: TextStyle(
              color: Color(0xff007084),
              fontSize: 13
          ),)
        ],
      ),
    );
  }
}
