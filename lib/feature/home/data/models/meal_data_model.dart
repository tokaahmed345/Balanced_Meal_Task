class  MealDataModel{
  
final String image;
final num price;
final String itemName;
final num calories;
final String type;

  MealDataModel({ required this.type,  required this.image, required this.price, required this.itemName, required this.calories});

factory MealDataModel.fromJson(Map<String,dynamic>json){
return MealDataModel(
  type:json['type'],
  image:json['image_url'] , 
price: json['price'], 
itemName: json['food_name'], 
calories: json['calories']);
}
} 

