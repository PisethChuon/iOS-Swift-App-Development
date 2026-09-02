//
//  ContentView.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI
import MapKit

struct Adventure: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let category: String
    let effortLevel: String
    let locationName: String
    let latitude: Double
    let longitude: Double
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    // Filter data
    let categories = ["Nature", "Urban", "Water", "Mountain", "Historical"]
    let effortLevels = ["Easy", "Moderate", "Hard"]
    @State private var selectedCategories: Set<String> = []
    @State private var selectedEfforts: Set<String> = []
    @State private var showFilter = false
    
    // Adventures
    /// The list of available adventures to display in the app.
    /// Each `Adventure` contains details such as title, description, category, effort level, location, and completion status.
    /// Used to populate the map marker, floating info card, and navigation for the main experience.
    /// This array is also updated when marking adventures as completed.
    @State var adventures: [Adventure] = [
        Adventure(
            id: UUID(),
            title: "Morning Mountain Hike",
            description: "Start your day with a brisk hike up the local mountain trail. Enjoy stunning sunrise views and spot local wildlife along the way.",
            category: "Mountain",
            effortLevel: "Moderate",
            locationName: "Mount Tamalpais",
            latitude: 37.9235,
            longitude: -122.5965,
            isCompleted: false
        ),
        Adventure(
            id: UUID(),
            title: "River Kayaking",
            description: "Paddle down the scenic Russian River, tackling challenging rapids and enjoying peaceful waterside scenery.",
            category: "Water",
            effortLevel: "Hard",
            locationName: "Russian River",
            latitude: 38.6136,
            longitude: -122.8695,
            isCompleted: true
        ),
        Adventure(
            id: UUID(),
            title: "City Street Art Walk",
            description: "Explore vibrant murals and street art in the Mission District, discovering the creative heart of San Francisco.",
            category: "Urban",
            effortLevel: "Easy",
            locationName: "Mission District",
            latitude: 37.7599,
            longitude: -122.4148,
            isCompleted: false
        ),
        Adventure(
            id: UUID(),
            title: "Forest Nature Trail",
            description: "Wander through ancient redwoods and peaceful forest trails in the beautiful Muir Woods.",
            category: "Nature",
            effortLevel: "Moderate",
            locationName: "Muir Woods",
            latitude: 37.8956,
            longitude: -122.5788,
            isCompleted: false
        )
    ]
    @State var currentAdventureIndex: Int = 0
    
    var markerCoordinate: CLLocationCoordinate2D {
        let adventure = adventures[currentAdventureIndex]
        return CLLocationCoordinate2D(latitude: adventure.latitude, longitude: adventure.longitude)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Map(position: $position) {
                    let adventure = adventures[currentAdventureIndex]
                    Marker(adventure.title, coordinate: markerCoordinate)
                }
                .ignoresSafeArea()
                .onChange(of: currentAdventureIndex) { newValue in
                    let adventure = adventures[newValue]
                    withAnimation {
                        position = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: adventure.latitude, longitude: adventure.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                    }
                }
                
                // Floating Info Card
                VStack(alignment: .leading, spacing: 12) {
                    let adventure = adventures[currentAdventureIndex]
                    
                    HStack(spacing: 8) {
                        Text(adventure.category)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.blue))
                        
                        Text(adventure.effortLevel)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.green))
                    }
                    Text(adventure.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(adventure.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            adventures[currentAdventureIndex].isCompleted.toggle()
                        }) {
                            Text(adventures[currentAdventureIndex].isCompleted ? "Completed" : "Mark Complete")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Capsule().fill(adventures[currentAdventureIndex].isCompleted ? Color.gray : Color.accentColor))
                        }
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 24).fill(Color(.systemBackground).opacity(0.95)))
                .shadow(radius: 10)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                VStack {
                    Spacer()
                    Button(action: {
                        currentAdventureIndex = (currentAdventureIndex + 1) % adventures.count
                    }) {
                        Text("Next Adventure")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Capsule().fill(Color.accentColor))
                            .foregroundColor(.white)
                            .shadow(radius: 8)
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Micro Adventures")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showFilter = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    .accessibilityLabel("Filter")
                }
            }
            .sheet(isPresented: $showFilter) {
                NavigationStack {
                    Form {
                        Section(header: Text("Categories")) {
                            Button("Select All") {
                                selectedCategories = Set(categories)
                            }
                            ForEach(categories, id: \.self) { category in
                                Toggle(isOn: Binding(
                                    get: { selectedCategories.contains(category) },
                                    set: { isOn in
                                        if isOn { selectedCategories.insert(category) } else { selectedCategories.remove(category) }
                                    })
                                ) {
                                    Text(category)
                                }
                            }
                        }
                        Section(header: Text("Effort Levels")) {
                            Button("Select All") {
                                selectedEfforts = Set(effortLevels)
                            }
                            ForEach(effortLevels, id: \.self) { effort in
                                Toggle(isOn: Binding(
                                    get: { selectedEfforts.contains(effort) },
                                    set: { isOn in
                                        if isOn { selectedEfforts.insert(effort) } else { selectedEfforts.remove(effort) }
                                    })
                                ) {
                                    Text(effort)
                                }
                            }
                        }
                    }
                    .navigationTitle("Filters")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { showFilter = false }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
