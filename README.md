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

1. Add the name of your style to the enum
2. Add the new enum case to the switch in the style property
3. Define the properties of you style, You can leave out any unused properties and it will just be ignored.

A few tips:

* Make sure to set the `isStylable`, `isTextStylable` and `isPlaceholderStylable` to the right value. This should speedup the styling if there are a lot of components to style.
* Add a `// MARK:` for each style so you can find it fast when you want to change it.
* Define Colors and Fonts as class variables. You can find an example in `Extensions/UIColors+UIFonts.swift` file.
* Add your own tips by letting me know or opening a pull request.


```
enum Styles: String {
    // (1)
	case ExampleStyle
	case ExampleStyle2
	case ExampleStyle3
    
    // Define you styles here
    var style: Style {
        // (2)
        switch self {
        // MARK: Example Style
        case .ExampleStyle:
            // (3)
            let newStyle = Style(name: self.rawValue,
                                 isStylable: false,
                                 isTextStylable: true,
                                 isPlaceholderStylable: false)
            
            // Background Styling
            newStyle.backgroundColor = .green
            newStyle.borderColor = .red
            newStyle.borderWidth = 5
            newStyle.cornerRadius = .roundedSideHorizontal
            newStyle.shadowColor = nil
            newStyle.shadowOffset = nil
            newStyle.shadowOpacity = nil
            newStyle.clipsToBounds = true
            
            // Text Stylable
            newStyle.font = .systemLarge
            newStyle.textColor = .marine
            newStyle.allignment = .center
            newStyle.isUppercased = false
            
            // PlaceholderStylable
            newStyle.placeholderFont = .systemLarge
            newStyle.placeeholderTextColor = .lightGray
            newStyle.allignment = .center
            newStyle.isUppercased = false
            
            return newStyle
        }
    }
}
```
(I'm not 100% happy with this way of defining a style, let me know if you have a better idea)

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
