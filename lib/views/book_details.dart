import 'package:bookshelf_app/resource/colors.dart';
import 'package:bookshelf_app/resource/widgets.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset("assets/mermaid_large.png",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("The Little memaid", style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 21
                      ),),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          StarRating(rating: 5,),
                          SizedBox(height: 6,),
                          Text("Fairy Tales", style: TextStyle(
                              color: darkGreen,
                              fontSize: 14
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("“The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published in 1837 as part of a collection of fairy tales for children.", style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    letterSpacing: 0.6,
                    wordSpacing: 0.6,
                  ),),
                  SizedBox(height: 80,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text("Read Book", style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: greyColor,width: 2
                              ),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text("More info", style: TextStyle(
                              color: greyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
