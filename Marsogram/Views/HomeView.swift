//
//  HomeVIew.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: HomeCoordinator
    @State private var showDatePicker = false // Controls the display of the DatePicker modal
    @State private var showPicker = false // Controls the display of the modal for selecting a camera or rover
    @State private var selectedDate = Date() // The date selected by the user
    @State private var realtimeDate = Date() // Temporary date for selection
    @State private var selectedCamera: String = "All" // The selected camera
    @State private var realtimeCamera: String = "All" // The temporary camera for selection
    @State private var selectedRover: String = "Curiosity" // The selected rover
    @State private var realtimeRover: String = "Curiosity" // The temporary rover for selection
    @State private var pickerType: PickerType = .camera // The type of Picker (camera or rover)


    enum PickerType {
        case camera, rover
    }

    var body: some View {
        VStack(spacing: 0) {
            topPanel
            
            contentArea
            
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
        .overlay(datePickerOverlay)
        .overlay(pickerOverlay) // Select camera or rower
    }
    
    // Top interface  panel
    private var topPanel: some View {
        VStack(spacing: 10) {
            HStack {
                header
                Spacer()
                calendarButton
            }
            filterButtons
        }
        .padding()
        .background(Color.orange)
    }
    
    // Main interface content
    private var contentArea: some View {
        VStack {
            marsPhotosList
        }
        .padding()
        .background(Color.white)
    }
    
    // Date and Title
    private var header: some View {
        VStack(alignment: .leading) {
            Text("MARS.CAMERA")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Text(selectedDate.toFormattedString()) // Show date
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    
    // Calendar button
    private var calendarButton: some View {
        Button(action: {
            showDatePicker = true // Open modal window to select date
        }) {
            Image(systemName: "calendar")
                .foregroundColor(.white)
                .padding()
        }
    }
    
    private var filterButtons: some View {
        HStack(spacing: 10) {
            filterButton(iconName: "camera.macro",
                         label: selectedRover,
                         width: 140,
                         height: 38)
            filterButton(iconName: "camera", label: selectedCamera,
                         width: 140,
                         height: 38)
            filterButton(iconName: "plus", label: "",
                         width: 38,
                         height: 38)
        }
    }
    
    // List with rower photos
    private var marsPhotosList: some View {
        List(coordinator.data.marsPhotos) { photo in
            MarsPhotoCell(photo: photo).onTapGesture {
                coordinator.mainCoordinator?.showPhotoDetails(for: photo)
            }
        }
        .listStyle(PlainListStyle())
        .padding(.top)
        .safeAreaInset(edge: .bottom) {
            bottomButton
        }
    }
    
    // Floating button
    private var bottomButton: some View {
        HStack {
            Spacer()
            
            CircularButton(
                action: {
                    coordinator.mainCoordinator?.navigateTo(.history)
                },
                imageName: "camera.fill",
                buttonColor: .accentOne,
                imageColor: .white,
                size: 70
            )
            .padding(.trailing, 20)
        }
        .padding(.bottom, 10)
    }
    
    // Select date overlay
    private var datePickerOverlay: some View {
        Group {
            if showDatePicker {
                Color.black.opacity(0.4)
                    .ignoresSafeArea(.container, edges: .all)
                    .overlay(datePickerContent)
            }
        }
    }
    
    // Select date main content
    private var datePickerContent: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    showDatePicker = false // close modal window
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                        .background(Color.white.opacity(0.6))
                        .clipShape(Circle())
                        .padding(10)
                }
                
                Spacer()
                
                Text("Date")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    self.selectedDate = self.realtimeDate
                    showDatePicker = false
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding(10)
                }
            }
            
            DatePicker("", selection: $realtimeDate, displayedComponents: [.date])
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 40)
    }
    
    // Select camera of mars rower
    private var pickerOverlay: some View {
        Group {
            if showPicker {
                VStack {
                    Spacer() 
                    
                    pickerContent
                }
                .ignoresSafeArea()
                .background(Color.black.opacity(0.4).ignoresSafeArea())
            }
        }
    }
    
    // Content to select camera or mars rower
    private var pickerContent: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    showPicker = false // close modal window
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                        .background(Color.white.opacity(0.6))
                        .clipShape(Circle())
                        .padding(10)
                }
                
                Spacer()
                
                Text(pickerType == .camera ? "Camera" : "Rover")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    // confirm choise
                    switch pickerType {
                        
                    case .camera:
                        selectedCamera = realtimeCamera
                    case .rover:
                        selectedRover = realtimeRover
                    }
                    showPicker = false
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding(10)
                }
            }
            
            Picker(selection: pickerType == .camera ? $realtimeCamera : $realtimeRover, label: Text("")) {
                if pickerType == .camera {
                    Text("All").tag("All")
                    Text("Front Hazard Avoidance Camera").tag("Front Hazard Avoidance Camera")
                    Text("Real Hazard Avoidance Camera").tag("Real Hazard Avoidance Camera")
                    Text("Mast Camera").tag("Mast Camera")
                } else {
                    Text("Curiosity").tag("Curiosity")
                    Text("Opportunity").tag("Opportunity")
                    Text("Spirit").tag("Spirit")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }

    // Filter buttons
    private func filterButton(iconName: String, label: String, width: CGFloat, height: CGFloat) -> some View {
        Button(action: {
            if iconName == "camera" {
                pickerType = .camera
            } else if iconName == "camera.macro" {
                pickerType = .rover
            }
            showPicker = true // open camera or rower picker
        }) {
            HStack (alignment: .firstTextBaseline){
                Image(systemName: iconName)
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                
                
                if !label.isEmpty {
                    Text(label)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
                
                Spacer()
            }
            .frame(maxWidth: width, maxHeight: height)
            .background(Color.white)
            .cornerRadius(10)

        }
    }
}



#Preview {
    HomeView(coordinator: MockHomeCoordinator())
}
