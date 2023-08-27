// Reference - https://youtu.be/s3Wr5_tsODs?si=6hD_1Wk7c9W8Gj_7

//Real world example ad application
// ..
// * Architects create design and interfaces for the team.
// * You can check the calendar and number format in java.
// * Frameworks and in library
//    -- For UI Framework
//    -- Creation of different types of buttons or UI widgets.

// ! Pros
// * Guarantees abstraction
// * Code is flexible and adaptable
// * Very useful for frameworks and libraries

// ! Cons
// * Complex code.
// * Takes time to set the base.
// * It's not easy to convert our existing code into factory design pattern. You might have to write from scratch.

// ! Summary
// * Useful for creation of objects that falls under the same category but still have different properties.
// * In this example car, Motorcycle comes under vehicle categorization.
// * Helps in hiding complexity
// * Need to think ahead to implement this pattern in our codebase. ie, before writing the code.

// Abstract class representing a Vehicle
abstract class Vehicle {
  String brand;
  int year;

  Vehicle(this.brand, this.year);

  void drive();
  void honk();

  void printDetails() {
    print("Brand: $brand, Year: $year");
  }
}

// Concrete implementation of Car
class Car implements Vehicle {
  @override
  String brand;
  @override
  int year;

  Car(this.brand, this.year);

  @override
  void drive() {
    print("Driving a car");
  }

  @override
  void honk() {
    print("Car honking");
  }

  @override
  void printDetails() {
    print("Car - Brand: $brand, Year: $year");
  }
}

// Concrete implementation of Motorcycle
class Motorcycle implements Vehicle {
  @override
  String brand;

  @override
  int year;

  Motorcycle(this.brand, this.year);

  @override
  void drive() {
    print("Riding a motorcycle");
  }

  @override
  void honk() {
    print("Motorcycle honking");
  }

  @override
  void printDetails() {
    print("Motorcycle - Brand: $brand, Year: $year");
  }
}

// Factory class to create vehicles
class VehicleFactory {
  Vehicle createVehicle(String type, String brand, int year) {
    if (type == "car") {
      return Car(brand, year);
    } else if (type == "motorcycle") {
      return Motorcycle(brand, year);
    } else {
      throw Exception("Invalid vehicle type");
    }
  }
}

void main() {
  VehicleFactory factory = VehicleFactory();

  // Create a car using the factory
  Vehicle car = factory.createVehicle("car", "Toyota", 2022);
  car.drive(); // Output: Driving a car
  car.honk(); // Output: Car honking
  car.printDetails(); // Output:Car - Brand: Toyota, Year: 2022

  // Create a motorcycle using the factory
  Vehicle motorcycle = factory.createVehicle("motorcycle", "Harley", 2023);
  motorcycle.drive(); // Output: Riding a motorcycle
  motorcycle.honk(); // Output: Motorcycle honking
  motorcycle.printDetails(); // Output: Motorcycle - Brand: Harley, Year: 2023
}
