# Balanced Meal Planner 🍽️

Balanced Meal Planner is a lightweight Flutter application designed to help users create personalized meal orders based on their daily calorie requirements. It calculates calorie needs using gender-specific BMR formulas and allows users to select ingredients from Firebase in real-time while tracking their total intake.

## 📱 Features

* Welcome screen to start the ordering process
* User info input: gender, age, height, weight
* Automatic calorie calculation using BMR formulas
* Ingredient selection screen (meats, vegetables, carbs)
* Real-time calorie tracking with progress indicator
* Add or remove ingredients with live updates
* "Place Order" button enabled when intake is within ±10% of target
* Order Summary screen displaying selected items, calories, and quantity
* POST API call to place order
* App resets to home screen after order submission

## 🧮 Calorie Calculation

* **Male:** `666.47 + (13.75 × weight) + (5 × height) - (6.75 × age)`
* **Female:** `655.1 + (9.56 × weight) + (1.85 × height) - (4.67 × age)`

## 📤 API Order Submission

Once the user confirms their meal, the app sends a POST request to:

```
https://uz8if7.buildship.run/placeOrder
```

### Example Payload:

```json
{
  "items": [
    {
      "name": "Salmon",
      "total_price": 12,
      "quantity": 1
    },
    {
      "name": "Beef",
      "total_price": 24,
      "quantity": 2
    }
  ]
}
```

## 🛠️ Built With

* Flutter & Dart
* Firebase Firestore
* RESTful API
* Bloc (Cubit) for State Management
* MVVM Architecture
* Figma (UI Design)
* JSON, GitHub

## 🔄 Project Flow

1. Start from Welcome Screen
2. Enter personal info to calculate calories
3. Select ingredients to meet your target
4. Place your order (when within target range)
5. View summary and submit
6. Return to home to start a new order

---

This app was created as part of a Flutter assessment to demonstrate real-world data flow, UI/UX, and API integration.
