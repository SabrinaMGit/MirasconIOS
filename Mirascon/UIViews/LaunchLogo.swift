//
//  LaunchLogo.swift
//  Mirascon
//
//  Created by Dev-Notebook on 30.01.20.
//  Copyright © 2020 MIRASCON. All rights reserved.
//

import SwiftUI

var enable = true

struct LaunchLogo: View {
    
    @State var showSplash = true
    let firstLaunch = FirstLaunch(userDefaults: .standard, key: "com.any-suggestion.FirstLaunch.WasLaunchedBefore")
    
    @ObservedObject var viewRouter: ViewRouter
    init(_ viewRouter: ViewRouter){
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        ZStack{
            if firstLaunch.isFirstLaunch {
                ContentView(viewRouter: viewRouter)
                LaunchRow()
                    .opacity(showSplash ? 1 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            LaunchRow.shouldAnimate = false
                            withAnimation() {
                                self.showSplash = false
                                self.viewRouter.currentPage = "pagerView"
                            }
                        }
                }
                //FirstLaunch.WasLaunchedBefore = false
            }else{
                ContentView(viewRouter: viewRouter)
                LaunchRow()
                    .opacity(showSplash ? 1 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            LaunchRow.shouldAnimate = false
                            withAnimation() {
                                self.showSplash = false
                                self.viewRouter.currentPage = "mainView"
                            }
                        }
                }
            }}
    }
}

struct LaunchLogo_Previews: PreviewProvider {
    static var previews: some View {
        LaunchLogo(ViewRouter())
    }
}


struct LaunchRow: View {
    let colorClass = ColorUI()
    static var shouldAnimate = true
    @State var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [colorClass.startColor, colorClass.endColor]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(.all)
            Image("MirasconLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200.0,height:200)
                .foregroundColor(Color.white)
                .scaleEffect(scale)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1)
                    
                    return withAnimation(baseAnimation) {
                        self.scale = 1.5
                    }
            }
            
        }
    }
}
extension LaunchRow{
    var uAnimationDuration: Double { return 1.0 }
    var finalAnimationDuration: Double { return 0.4 }
    func handleAnimations() {
        runAnimation()
        if LaunchRow.shouldAnimate {
            runAnimation()
        }
    }
    func runAnimation() {
        withAnimation(Animation.easeIn(duration: uAnimationDuration).delay(0.5)) {
            self.scale = 1.3
        }
    }
    
}

#if DEBUG
struct LaunchRow_Previews : PreviewProvider {
    static var previews: some View {
        LaunchRow()
    }
}
#endif
