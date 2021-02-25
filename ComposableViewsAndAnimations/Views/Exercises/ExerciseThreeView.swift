//
//  ExerciseThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseThreeView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    //vertical offset
    @State private var yOffset: CGFloat = 0

    // Whether to apply the animation
    @State private var useAnimation = false
    
    //color
    @State private var hue: Color = .blue

    // MARK: Computed properties

    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()

    var body: some View {
        
        NavigationView {
            
            HStack {
                
                Circle()
                    .foregroundColor(hue)
                    .frame(width: 30, height: 30)
                    .offset(y: yOffset)
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.5)) {
                            yOffset -= 150
                                }
                        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                            withAnimation(.easeIn(duration: 0.5)) {
                                yOffset += 150
                                    }
                        }
                            hue = Color(hue: Double.random(in: 150...320) / 360.0,
                                        saturation: 0.8,
                                        brightness: 0.8)
                    }
                
            }
            .navigationTitle("Exercise 3")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
                
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseThreeView(showThisView: .constant(true))
    }
}
