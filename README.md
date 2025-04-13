✈️ Project Overview: Airport Catalogue in SwiftUI.

This SwiftUI project is an interactive catalogue of airports around the world. It loads airport data from a text file, parses it into structured objects, and allows users to view airport details including name, code, location, and coordinates. It also includes reverse geolocation to display human-readable addresses and allows opening airport locations in Apple Maps.

📁 Main Components and Files
1. Aeroport.swift – Airport Model
   
This file defines the Aeroport class which stores all relevant data about an airport:

identification – OpenFlights ID.

nom – Name of the airport.

code – IATA or ICAO code.

ville – City.

pays – Country.

latitude & longitude – GPS coordinates.

location – Computed property returning a CLLocation.

It includes an initializer that takes a line from a CSV-style data file (airports.txt) and extracts the relevant fields.

2. Catalogue.swift – Airport Catalogue Manager
   
This class loads the airport data from the airports.txt file. It:

Parses each line and creates Aeroport objects.

Removes entries with no code.

Sorts airports alphabetically by code.

Provides subscript access (catalogue[i]) and a count property (catalogue.compte).

Has a method supprimerAéroport to remove an airport by its ID.

3. CatalogueView.swift – Main View
This is the main SwiftUI view. It:

Displays a list of airports using List and NavigationLink.

Uses a NavigationStack to allow transitioning to individual airport details via AeroportView.

4. CelluleView.swift – Airport Cell View
This small view component is used inside the list to format each row:

Shows the airport code and name using a monospaced font.

Properly aligns the text.

5. AeroportView.swift – Airport Detail View
This view displays detailed information about a specific airport, organized into Form sections:

Identification: Name and IATA code.

Location: City and country.

Coordinates: Latitude and longitude.

Address: Uses CLGeocoder to reverse-geocode the location into a human-readable address (street, city, country, etc.).

Includes a button to open the airport location in Apple Maps using satellite view.

There’s also a CLPlacemark extension to nicely format the address string.

🗃️ Data File
The project expects a file named airports.txt containing comma-separated values like:

text
Copiar
Editar
1,"Goroka","Goroka","Papua New Guinea","GKA","AYGA",-6.081689,...
Each line includes:

ID, Name, City, Country, IATA code, ICAO code, Latitude, Longitude, etc.

🌐 Features
Dynamic list of airports.

Navigation between screens.

Reverse geolocation to display readable addresses.

Integration with Apple Maps (satellite mode).

Filtering out invalid airport entries.

