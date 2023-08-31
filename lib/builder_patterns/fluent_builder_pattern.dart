// The Fluent Builder Pattern is a coding style that simplifies the process of creating objects
// step by step. It's like building with Lego bricks, where you assemble the final object
// by connecting smaller pieces together in a clear sequence.

// Let's say we're creating a blueprint for a House. In traditional coding, we'd need to create
// a constructor and set each attribute separately. However, the Fluent Builder Pattern helps us
// create a house by smoothly chaining method calls, resembling a conversation with the code.

// First, we define our House class with its properties like bedrooms, bathrooms, garage, and garden.
class House {
  final int bedrooms;
  final int bathrooms;
  final bool hasGarage;
  final bool hasGarden;

  // We create a constructor that takes in all the required attributes to create a House.
  House(this.bedrooms, this.bathrooms, this.hasGarage, this.hasGarden);

  // A display method to show the attributes of the house.
  void display() {
    print("Bedrooms: $bedrooms");
    print("Bathrooms: $bathrooms");
    print("Has Garage: $hasGarage");
    print("Has Garden: $hasGarden");
  }
}

// Now, we create a HouseBuilder class. This is like our toolbox that helps us build a House.
class HouseBuilder {
  // We start with default values for the attributes.
  int _bedrooms = 0;
  int _bathrooms = 0;
  bool _hasGarage = false;
  bool _hasGarden = false;

  // Each method in the builder corresponds to an attribute of the House.
  // These methods allow us to set attributes and return the builder itself.

  // Method to set the number of bedrooms.
  HouseBuilder withBedrooms(int bedrooms) {
    _bedrooms = bedrooms;
    return this; // We return the builder object to keep the chain going.
  }

  // Method to set the number of bathrooms.
  HouseBuilder withBathrooms(int bathrooms) {
    _bathrooms = bathrooms;
    return this;
  }

  // Method to add a garage to the house.
  HouseBuilder withGarage() {
    _hasGarage = true;
    return this;
  }

  // Method to add a garden to the house.
  HouseBuilder withGarden() {
    _hasGarden = true;
    return this;
  }

  // Once all attributes are set, this method constructs and returns the final House.
  House build() {
    return House(_bedrooms, _bathrooms, _hasGarage, _hasGarden);
  }
}

// In the main function, we create a house using the Fluent Builder Pattern.
void main() {
  // We start by calling the builder and chain the methods to set attributes.
  // This reads like a sentence: "Create a HouseBuilder, with 3 bedrooms, 2 bathrooms,
  // a garage, and a garden. Then, build the house."
  final house = HouseBuilder()
      .withBedrooms(3)
      .withBathrooms(2)
      .withGarage()
      .withGarden()
      .build(); // The build method constructs the house.

  // Finally, we display the attributes of the constructed house.
  house.display();
}

// This pattern helps make our code more readable, like telling a story, even for a 15-year-old
// who's been programming for 10 years. It's like following a recipe to create a delicious dish
// with all the right ingredients in the right order.
