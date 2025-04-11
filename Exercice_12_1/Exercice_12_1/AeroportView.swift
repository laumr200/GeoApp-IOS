//
//  AeroportView.swift
//  Exercice_12_1
//
//  Created by user230518 on 3/22/23.
//

import SwiftUI
import CoreLocation
import MapKit

extension CLPlacemark {
    var adresse: String {
        get {
            let arr = [subThoroughfare, thoroughfare, locality, administrativeArea, country, postalCode]
            return arr.compactMap{$0}.joined(separator: ", ")
        }
    }
}

struct AeroportView: View {
    var aéroport: Aeroport
    
    let titreLargeur: CGFloat = 80
    
    @State var adresse: String?
    
    var body: some View {
        Form {
            Section("Identification") {
                HStack {
                    VStack(alignment: .trailing) {
                        Text("Nom")
                        Text("Code IATA")
                    }
                    .foregroundColor(.accentColor)
                    .frame(width: titreLargeur, alignment: .trailing)
                    
                    VStack(alignment: .leading) {
                        Text(aéroport.nom)
                            .lineLimit(1)
                        Text(aéroport.code)
                    }
                }
            }
            
            Section("Localisation") {
                HStack {
                    VStack(alignment: .trailing) {
                        Text("Ville")
                        Text("Pays")
                    }
                    .foregroundColor(.accentColor)
                    .frame(width: titreLargeur, alignment: .trailing)
                    
                    VStack(alignment: .leading) {
                        Text(aéroport.ville)
                        Text(aéroport.pays)
                    }
                }
            }
            
            Section("Coordonnées") {
                HStack {
                    VStack(alignment: .trailing) {
                        Text("Latitude")
                        Text("Longitude")
                    }
                    .foregroundColor(.accentColor)
                    .frame(width: titreLargeur, alignment: .trailing)
                    
                    VStack(alignment: .leading) {
                        Text(String(aéroport.latitude))
                        Text(String(aéroport.longitude))
                    }
                }
            }
            
            
            Section("Geolocalization"){
                if let adresse = adresse{
                    Text(adresse)
                } else {
                    Text("Changement de l'adresse..")
                }
                Button("Afficher dans Plan"){
                    let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: aéroport.latitude , longitude: aéroport.longitude))
                    let mapIten = MKMapItem(placemark: placemark)
                    mapIten.name = aéroport.nom
                    mapIten.openInMaps(launchOptions: [ MKLaunchOptionsMapTypeKey : MKMapType.satellite.rawValue])
                }
                
            }
        }
        .navigationTitle("Aéroport \(aéroport.code)")
        .onAppear{
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(aéroport.location) {(placemarks,error) in
                if let placemark = placemarks?.first{
                    adresse = placemark.adresse
                }else {
                    adresse = "Adresse Introuvable"
                }
            }
        }
    }
}

struct AeroportView_Previews: PreviewProvider {
    static var previews: some View {
        AeroportView(aéroport: Catalogue()[0])
    }
}
