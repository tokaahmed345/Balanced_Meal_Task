<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Balanced Meal App - README</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 20px;
      max-width: 800px;
      color: #2c3e50;
      background-color: #fafafa;
    }
    h1, h2, h3 {
      color: #2c3e50;
    }
    img {
      width: 200px;
      margin: 10px 0;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      display: block;
    }
    pre {
      background: #f4f4f4;
      padding: 10px;
      border-radius: 5px;
      overflow-x: auto;
    }
    a {
      color: #2980b9;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    hr {
      margin: 40px 0;
      border: none;
      border-top: 1px solid #ccc;
    }
    ul, ol {
      margin-left: 20px;
    }
  </style>
</head>
<body>

  <h1>Balanced Meal App</h1>

  <img src="./assets/screenshot1.png" alt="Balanced Meal Screenshot 1" />
  <img src="./assets/screenshot2.png" alt="Balanced Meal Screenshot 2" />

  <hr />

  <h2>Overview</h2>
  <p>
    Balanced Meal is a mobile application developed as part of an assessment task for 
    <strong>Red Software Development</strong>.<br />
    The app was initially built using <strong>FlutterFlow</strong>, then fully converted to native <strong>Flutter</strong> for better customization and control.  
    It implements a clean architecture based on <strong>MVVM (Model-View-ViewModel)</strong>.
  </p>

  <h2>Features</h2>
  <ul>
    <li>Collects user data such as weight, height, gender, and daily activity level.</li>
    <li>Accurately calculates daily calorie requirements.</li>
    <li>Displays balanced meal options suitable for the user’s calorie needs.</li>
    <li>Tracks calorie consumption progress with a circular indicator.</li>
    <li>Allows confirming meal orders and sending data to an external API.</li>
  </ul>

  <h2>Architecture</h2>
  <p>The app is structured using the <strong>MVVM</strong> pattern for better code organization:</p>
  <ul>
    <li><strong>Model:</strong> Defines data models such as user data and meals.</li>
    <li><strong>View:</strong> UI screens and widgets that display data and interact with the user.</li>
    <li><strong>ViewModel:</strong> Business logic layer that connects the View and Model, handles data fetching and state management.</li>
  </ul>

  <h2>Technologies Used</h2>
  <ul>
    <li>Flutter (Dart)</li>
    <li>Firebase Firestore (for meal data management)</li>
    <li>Bloc (Cubit) for state management</li>
    <li>REST API (for order confirmation)</li>
    <li>MVVM Architecture</li>
  </ul>

  <h2>Project Structure (Summary)</h2>
  <pre>
lib/
├── models/            # Data model definitions
├── view/              # UI screens and widgets
├── view_model/        # Cubit and business logic
├── services/          # API and Firebase services
└── utils/             # Helper utilities
  </pre>

  <h2>Screenshots</h2>
  <img src="./assets/screenshot1.png" alt="Home Screen" />
  <img src="./assets/screenshot2.png" alt="Meal Details" />

  <h2>How to Run</h2>
  <ol>
    <li>Ensure Flutter SDK is installed on your machine.</li>
    <li>Clone the repository:<br />
      <code>git clone https://github.com/username/balanced_meal_app.git</code></li>
    <li>Navigate to the project folder:<br />
      <code>cd balanced_meal_app</code></li>
    <li>Install dependencies:<br />
      <code>flutter pub get</code></li>
    <li>Run the app:<br />
      <code>flutter run</code></li>
  </ol>

  <h2>Contact</h2>
  <p>
    For any inquiries, feel free to reach out:<br />
    Email: <a href="mailto:tokaahmed34567@gmail.com">tokaahmed34567@gmail.com</a><br />
    GitHub: <a href="https://github.com/tokaahmed345" target="_blank">github.com/tokaahmed345</a>
  </p>

</body>
</html>
