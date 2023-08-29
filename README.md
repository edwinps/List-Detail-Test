_Before executing the app, you must run the underlying server providing the static JSON data._

```zsh
npm install -g json-server
json-server movies.json --port 8000
```

## Architecture

The app follows the Clean Architecture pattern, which separates the project into distinct layers: Data, Domain, and Presentation. This separation promotes modularity, testability, and maintainability.

## Layers:

1. **Data Layer:** Responsible for fetching data from the remote server and converting it into usable models.

2. **Domain Layer:** Contains the core business logic and use cases.

3. **Presentation Layer:** Handles the UI components, user interactions, and displays the List and Detail.

## Data Flow:

The data flows through the app as follows:

1. The **Data Layer** fetches the the list data from a remote JSON file using the URLSession framework.

2. The fetched data is then decoded into models using the Swift 'Codable' protocol.

3. The **Domain Layer** uses these models to tran.

4. The items are then passed to the **Presentation Layer** for display.

5. The Coordinator Layer manages the navigation between different views, ensuring a clear separation of navigation responsibilities from view controllers.


## Dependency Layer

The app uses the 'UseCase' to fetch the list data. This use case is implemented using the **Data Layer**, which abstracts the network fetching details.

Additionally, the **Coordinator Layer** has been introduced to handle the navigation flow, enhancing the modularity and maintainability of the app's navigation logic.

By incorporating the Coordinator pattern, the app further enhances its architecture by keeping navigation concerns separate from the presentation logic. This makes it easier to manage complex navigation flows and maintain clean and organized code.
Contributions


