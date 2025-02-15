//
//  SearchMap.swift
//  Mirascon
//
//  Created by Dev-Notebook on 15.08.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI
/*
struct SearchMap: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var locationService: LocationService
    init(_ viewRouter: ViewRouter, _ locationService: LocationService){
             self.viewRouter = viewRouter
            self.locationService = locationService
             UITableView.appearance().backgroundColor = .clear
             UITableViewCell.appearance().backgroundColor = .clear
         }
   
       var body: some View {
           VStack {
               Form {
                   Section(header: Text("Location Search")) {
                       ZStack(alignment: .trailing) {
                           TextField("Search", text: $locationService.queryFragment)
                           // This is optional and simply displays an icon during an active search
                           if locationService.status == .isSearching {
                               Image(systemName: "clock")
                                   .foregroundColor(Color.gray)
                           }
                       }
                   }
                   Section(header: Text("Results")) {
                       List {
                           // With Xcode 12, this will not be necessary as it supports switch statements.
                           Group { () -> AnyView in
                               switch locationService.status {
                               case .noResults: return AnyView(Text("No Results"))
                               case .error(let description): return AnyView(Text("Error: \(description)"))
                               default: return AnyView(EmptyView())
                               }
                           }.foregroundColor(Color.gray)
                           
                           ForEach(locationService.searchResults, id: \.self) { completionResult in
                               // This simply lists the results, use a button in case you'd like to perform an action or use a NavigationLink to move to the next view upon selection.
                               Text(completionResult.title)
                           }
                       }
                   }
               }
           }
       }
}

struct SearchMap_Previews: PreviewProvider {
    static var previews: some View {
        SearchMap(ViewRouter(), LocationService())
    }
}
*/
