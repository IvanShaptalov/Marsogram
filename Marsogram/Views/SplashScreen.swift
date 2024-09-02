//
//  SplashScreen.swift
//  Marsogram
//
//  Created by PowerMac on 30.08.2024.
//
import SwiftUI
import Lottie

struct SplashScreen: View {
    @State var showBGGlow = true
    @State var isFinished = false
    
    var body: some View {
        HStack{
            if !isFinished {
                ZStack {
                    Color("backgroundOne")
                        .ignoresSafeArea()
                    
                    
                    GeometryReader { geometry in
                        // Rounded square with width and height of 123 pixels, and corner radius of 30 pixels
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.accentOne) // Fill color
                            .frame(width: 123, height: 123)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.layerOne, lineWidth: 1)
                            )
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Spacer()
                        LottieView(animation: .named("lottieDots"))
                            .playing()
                            .scaledToFill()
                            .frame(width: 300, height: 200)
                    }
                }
                .opacity(showBGGlow ? 1 : 0)
                .onAppear(){
                    // Play main animation 1.3 s
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
                        // Toogling back after 0.5s...
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            withAnimation(.linear(duration: 0.4)){
                                showBGGlow.toggle()
                            }
                            // After 0.1s finising splash animation..
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                withAnimation{
                                    isFinished.toggle()
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
}


#Preview {
    ContentView(coordinator: MockMainAppCoordinator())
}
