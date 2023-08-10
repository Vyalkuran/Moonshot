//
//  ContentView.swift
//  Moonshot
//
//  Created by sebastian.popa on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @AppStorage("isGrid") private var isGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if isGrid{
                    GridLayout(columns: columns, missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .toolbar {
                Button(){
                    isGrid.toggle()
                } label: {
                    Label(isGrid ? "Show as grid" : "Show as table", systemImage: isGrid ? "circle.grid.3x3" : "list.bullet")
                }
                .foregroundColor(.white)
                .font(.title2)
            }
        }
        .animation(.linear(duration: 0.5), value: isGrid)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
