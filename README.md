**ASSIGNMENT 7**

1. Explain what are stateless widgets and stateful widgets, and explain the difference between them.

Stateless Widgets : A StatelessWidget is a widget that does not change once it’s built. This type of widget is immutable, meaning its properties and appearance are fixed throughout its lifetime.

Statefull Widgets : A StatefulWidget is a widget that can rebuild itself based on changes in its state. These widgets are mutable, and they can update their appearance in response to user interaction or other events.

Here are some difference between them
![](image/assignment7_1.png)


2. Mention the widgets that you have used for this project and its uses.
- MaterialApp: The root widget for the app that provides theme settings and navigation structure. It applies the ThemeData for consistent design across the app.

- Scaffold: This widget provides the primary structure for each screen, including the app bar, body, and any floating buttons. In this case, it's used to build the structure of MyHomePage.

- AppBar: A toolbar typically displayed at the top of the screen. Here, it displays the app title, "Mental Health Tracker," with specific styling.

- Padding: Adds padding around its child widget. In this project, it’s used to add spacing around the main body of the Scaffold to improve layout aesthetics.

- Column: A layout widget that arranges its children vertically. It’s used in various places to vertically align widgets, such as the rows of InfoCard widgets and the "Welcome to Dam-Shop!" message with the item grid.

- Row: A layout widget that arranges its children horizontally. It’s used to display three InfoCard widgets side by side.

- SizedBox: Used to add vertical space between widgets (16.0 units in this case) for a cleaner layout.

- Center: Centers its child widget within itself, ensuring items are aligned centrally on the screen.

- GridView.count: Creates a grid layout with a specific number of columns. It’s used to display the ItemCard widgets in a three-column grid, making it ideal for presenting a list of options or items in a compact, organized way.

- Card: Displays information within a container that has elevation and rounded corners, providing a card-like appearance. InfoCard uses it to show details like "View," "Add," and "Logout."

- Container: A versatile widget that allows adding padding, margins, color, width, height, etc., to its child. It’s used within InfoCard to set padding and width and in ItemCard to add padding and customize the layout.

- Text: Displays a string of text. It’s used throughout the app for titles, messages, and button labels, with specific styling applied for font size, weight, and color.

- Icon: Displays an icon from the Flutter Icons library. Each ItemCard displays a unique icon for each item (e.g., Icons.visibility for viewing products).

- Material: Provides a visual styling background for widgets. In ItemCard, it’s used to set a background color with rounded corners and theme-based styling.

- InkWell: A touchable widget that provides a ripple effect when tapped. ItemCard uses this to create a tap response that shows a SnackBar message.

- SnackBar: Displays a temporary message at the bottom of the screen. In this project, it’s shown when an ItemCard is tapped, providing feedback with a message indicating which button was pressed.

- MediaQuery: Provides information about the device screen dimensions and density. In InfoCard, it’s used to calculate the card’s width relative to the screen size.

3. What is the use-case for setState()? Explain the variable that can be affected by setState().

Use-case for setState()
- Updating UI in Response to User Interaction: When a button is pressed, or a form field changes, setState() allows the UI to reflect these changes. For example, updating a counter when a user presses an increment button.
- Dynamic Data Display: When data changes dynamically, such as fetching data from an API or changing a display based on user input, setState() triggers a rebuild to reflect the updated data.
- Animation or Progress Changes: You can use setState() to update the progress of an animation, or show/hide elements based on animation state or user interaction.

Variable that can be affected by setState().
- Counter Variables: A variable that tracks the number of times a button has been pressed. For example:
```dart
int counter = 0;
void incrementCounter() {
  setState(() {
    counter++;
  });
}
```
- Boolean Flags: Flags that control visibility or enable/disable certain elements. For example:
```dart
bool isLoading = false;
void toggleLoading() {
  setState(() {
    isLoading = !isLoading;
  });
}
```
- List or Collection Variables: Lists that store data for display, such as a list of items in a shopping cart. For example:
```dart
List<String> items = [];
void addItem(String item) {
  setState(() {
    items.add(item);
  });
}
```
- Text or String Variables: Text that changes dynamically, like a welcome message or an error message. For example:
```dart
String message = "Welcome!";
void updateMessage(String newMessage) {
  setState(() {
    message = newMessage;
  });
}
```

4. Explain the difference between const and final keyword.
The const keyword is used for compile-time constants with deeply immutable values known ahead of time, while final is for variables that are assigned once but may be initialized at runtime. const ensures the entire object and its contents are fixed, making it ideal for widgets that don’t change. In contrast, final allows setting values that may depend on runtime information but prevents reassignment after the first initialization.

Key Differences:
![](image/assignment7_2.png)


5. Explain how you implemented the checklist above step-by-step.    

- Run the command flutter create dam-shop to create a new Flutter app
- In main.dart, set up the MaterialApp widget with a theme that has an e-commerce style, typically with bright and inviting colors (such as blue or orange) and define the color scheme within ThemeData to apply it across the application.
- In main.dart, set the home property of MaterialApp to point to MyHomePage, Create a MyHomePage widget that will display the three buttons (View Product List, Add Product, and Logout). Define a list of button items with icons and titles in MyHomePage to dynamically create buttons.
- Create a custom widget for each button, such as ItemCard, to display both an icon and text. Use a GridView.count widget to display the buttons in a grid layout, so they appear in rows and columns. For each button, set an InkWell to capture the button press event and display a SnackBar message.
- In ItemCard, use Theme.of(context).colorScheme.secondary to style the background color. To apply a unique color to each button, add a color property to the ItemHomepage class or modify each ItemCard to switch colors based on the button type.
- Use an InkWell or GestureDetector in each ItemCard to detect button taps.Within the onTap callback, use ScaffoldMessenger.of(context).showSnackBar() to display a specific SnackBar message based on the button pressed.
