# Session Notes: Pro Engineering

## Friday, April 3, 2015

## Testing Models

1. One `describe` block for every class and instance method
2. Test all relevant behaviors
   - How will other properties of the model change?
   - What are the expected return values?
   - If it accepts arguments, what makes for valid or invalid arguments?


## Impressions of Rails

1. There's a lot — a lot more than Sinatra
2. How deep does it go?
3. Maybe too opinionated

## MVC

User sees the view
User interacts with the view

Model is where the "domain logic" lives

Controller's job is to translate user interactions into model interactions
Controller's job is to translate user input into changes in state (models)

- Stands for "Model View Controller"
- Separation of concerns
- Layers
- DRY (don't repeat yourself)
- Lots of files with 3 lines (wat)
- Thin controller, fat model
