// FBP is a style of coding which forces the developer to create the object in sequence by
// calling each setter method one after another until all required attributes are set.

// Product class representing a House
class House {
  final int bedrooms;
  final int bathrooms;
  final bool hasGarage;
  final bool hasGarden;

  House(this.bedrooms, this.bathrooms, this.hasGarage, this.hasGarden);

  void display() {
    print("Bedrooms: $bedrooms");
    print("Bathrooms: $bathrooms");
    print("Has Garage: $hasGarage");
    print("Has Garden: $hasGarden");
  }
}

// Fluent builder class
class HouseBuilder {
  int _bedrooms = 0;
  int _bathrooms = 0;
  bool _hasGarage = false;
  bool _hasGarden = false;

  HouseBuilder withBedrooms(int bedrooms) {
    _bedrooms = bedrooms;
    return this;
  }

  HouseBuilder withBathrooms(int bathrooms) {
    _bathrooms = bathrooms;
    return this;
  }

  HouseBuilder withGarage() {
    _hasGarage = true;
    return this;
  }

  HouseBuilder withGarden() {
    _hasGarden = true;
    return this;
  }

  House build() {
    return House(_bedrooms, _bathrooms, _hasGarage, _hasGarden);
  }
}

void main() {
  final house = HouseBuilder()
      .withBedrooms(3)
      .withBathrooms(2)
      .withGarage()
      .withGarden()
      .build();
  house.display();
}


