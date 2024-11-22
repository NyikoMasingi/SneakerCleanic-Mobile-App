

class SneakerService{
  String title;
  double price;
  String type;
  String picture;

  SneakerService(this.title, this.price, this.type, this.picture);
}

List<SneakerService> listOfServices = [
  // Waxing
  SneakerService('Jeans', 400,'Waxing', 'assets/services/waxing/jeans.jpg'),
  SneakerService('Canvas Sneaker', 300, 'Waxing','assets/services/waxing/sneaker.jpg'),
  SneakerService('Hats & Caps', 200, 'Waxing','assets/services/waxing/hats.jpg'),

  // Repairs
  SneakerService('Glue & Stitch', 50,'Repairs', 'assets/services/repairs/stitch.jpg'),
  SneakerService('Glue', 30, 'Repairs','assets/services/repairs/glue.jpg'),
  SneakerService('Zip & Runners', 100, 'Repairs','assets/services/repairs/zip.jpg'),
  SneakerService('Material Replacement', 400,'Repairs', 'assets/services/repairs/material.jpg'),
  SneakerService('Ladies Shoes', 300, 'Repairs','assets/services/repairs/womens.jpg'),
  SneakerService("Mens Shoes", 200, 'Repairs','assets/services/repairs/mens.jpg'),

  // Laundromat
  SneakerService('Bag Wash', 50,'Laundromat', 'assets/placeholder.png'),
  SneakerService('Hats & Caps', 60, 'Laundromat','assets/services/laudromat/caps.jpg'),
  SneakerService('Kiddies Shoes', 60, 'Laundromat','assets/services/laudromat/kiddies.jpg'),
  SneakerService('Premium Sneaker Wash', 100,'Laundromat', 'assets/services/laudromat/premium.jpg'),
  SneakerService('Suede,Nubuck & Leather', 100, 'Laundromat','assets/services/laudromat/nubuck.jpg'),
  SneakerService("White Sneaker Wash", 70, 'Laundromat','assets/services/laudromat/white.jpg'),
  SneakerService("Express Sneaker Wash", 60, 'Laundromat','assets/services/laudromat/express.jpg'),

  // Restoration
  SneakerService('Vans Re-Dice', 250,'Restore', 'assets/placeholder.png'),
  SneakerService('Sole Repainting', 100, 'Restore','assets/services/restoration/repaint.jpg'),
  SneakerService('Colour Restoration', 180, 'Restore','assets/services/restoration/colour.jpg'),
  SneakerService('Full Leather Restoration', 60, 'Restore','assets/services/restoration/leather.jpg'),


  // Products
  SneakerService('Silicone Hell Inserts', 60,'Other', 'assets/services/products/heel.jpeg'),
  SneakerService('Crease Protectors', 90 , 'Other','assets/services/products/crease.jpg'),
  SneakerService('Shoe Cream - Brown', 45, 'Other','assets/services/products/brown.jpg'),
  SneakerService('Shoe Cream - Neutral', 45,'Other', 'assets/services/products/neutral.jpg'),
  SneakerService('Shoe Cream - Black', 45, 'Other','assets/services/products/black.jpg'),
  SneakerService('Dark Mark Remover', 70, 'Other','assets/services/products/remover.jpg'),
  SneakerService('Minor Dirt Cleaner', 70,'Other', 'assets/services/products/cleaner.jpg'),
  SneakerService('Sneaker Solution', 100, 'Other','assets/services/products/solution.jpg'),
];

