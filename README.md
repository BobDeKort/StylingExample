# Styling Extensions

## 📖 Project description
This project shows how to use the Styling extensions.
The styling extensions provide an easier way to style UIViews and its subclasses.

##  🔧 Installation
1. Copy `Styling` folder from this project
2. Paste `Styling` folder into your new project directory
2. Use `Add file to "[ProjectName]"` to add the files to your new project

## Usage

### What is possible

These extensions allow you to style:

* **UIView**: Background color, border color, borderwidth, corner radius, shadow color, shoadow offset, shadow opacity and clips to bounds.
*  **UILabel**: Font, text color, text allignment and can set the current text to uppercase.
*  **UIButton**: Font, text color, text allignment and can set the current title to uppercase
*  **UITextField**: Font, text color, alligment and set current text to uppercase, Placeholder font, text color, allignment and set current placeholder to uppercase.

(NOTE) You can set both shadow and corner radius and a UIView but not on its sub classes, on its sub classes like UILabel these will override each other.
ofcourse you can use one of them on the sub classes.

(NOTE 2) You can use the UIView styling on all subclasses so you can style UILabel, UIButton and UITextField with the same background properies as you can UIView.

### Defining your style

In the file `Styling/Models.swift` you will see the following Styles enum.

To add a new style:

1. Define your Style class as a subclass of `Style` in the `Styles.swift` file.
2. Add the name of your style to the `StyleType` enum
3. Return your newly create style subclass in the style variable of the `StyleType` enum
4. Define the properties of your style in the init, You can leave out any unused properties and it will just be ignored.

A few tips:

* Make sure to set the `isStylable`, `isTextStylable` and `isPlaceholderStylable` to the right value. This should speedup the styling if there are a lot of components to style.
* Add a `// MARK:` for each style so you can find it fast when you want to change it.
* Define Colors and Fonts as class variables. You can find an example in `Extensions/UIColors+UIFonts.swift` file.
* Step 4 can ofcourse be done during step 1 as well.
* Add your own tips by letting me know or opening a pull request.

`Styles.swift`
```
// (1)
// MARK: ExampleStyle
class ExampleStyle: Style {
    override init() {
        super.init(isStylable: true, isTextStylable: true, isPlaceholderStylable: true)
   	// (4)
        backgroundColor = .green
        borderColor = .red
        borderWidth = 5
        cornerRadius = .roundedSideHorizontal
        shadowColor = nil
        shadowOffset = nil
        shadowOpacity = nil
        clipsToBounds = true
        
        // Text Stylable
        // Sets font, text color, allignment and can uppercase the current text of the component
        font = .systemLarge
        textColor = .marine
        allignment = .center
        isUppercased = false
        
        // PlaceholderStylable
        // Sets font, text color, allignment and can uppercase the current
        // placeholder text of the component
        
        placeholderFont = .systemLarge
        placeeholderTextColor = .lightGray
        allignment = .center
        isUppercased = false
    }
}
```


`StyleType.swift`
```
enum Styles: String {
    // (2)
	case exampleStyle
	case exampleStyle2
	case exampleStyle3
    
    // Return your style class here
    var style: Style {
        switch self {
	// (3)
        case .exampleStyle: return ExampleStyle()
        }
    }
}
```

### Using your style


There are 2 ways to use your defined style.

#### 1) Storyboard
On the storyboard you will see a `Style Name` attribute in the attributes inspector.
Just type in the name of the style and all definded properties will be set on the component.

#### 2) Code

In code, wherever you want to put it, just call `.style(with: Styles)` on the component.

Example:

```
// Styling single component
headerLabel.style(with: .ExampleStyle)

// Suggestion on styling multiple components with the same style
[emailLabel, firstNameLabel, familyNameLabel, addressLabel, postcodeLabel, cityLabel].forEach { (label) in
    label?.style(with: .DefaultTextFieldHeader)
}
```

#### Styling without a style

You can of course still use traditional ways of styling, but if you don't want to define a style for a single component you can use the other `.styleBackground()`, `.styleText()`, `.stylePlaceholder` methods.

```
// Style Background
continueButton.styleBackground(backgroundColor: .projectOrange,
                               cornerRadius: .roundedSideHorizontal)

// Style text
headerLabel.styleText(font: .systemLarge,
                      textColor: .marine,
                      allignment: .center,
                      isUppercased: false)

// Style placeholder
nameTextField.stylePlaceholderText(font: .systemMedium,
								   textColor: .lightGray,
								   allignment: .left,
								   isUppercased: false)

```
