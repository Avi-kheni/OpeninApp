//
//  HomeView.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    @State var isTopLinkSelected : Bool = true
    var body: some View {
        
        VStack(spacing: 0) {
            //MARK:  Top Nav view
            topNavView()
            
            VStack {
                GeometryReader { proxy in
                    ScrollView {
                        VStack(alignment: .leading) {
                            //MARK: Greeting View
                            greetingView()
                            
                            //MARK: Chart View
                            if self.homeVM.chartJsonString != "" {
                                ChartView(jsonData: self.homeVM.chartJsonString)
                                
                                
                            }
                            //MARK: Button Tab View
                            tabBtnView()
                            
                            //MARK: List View
                            topRecentLinkView()
                        }
                    }
                    .padding()
                    
                }
                .scrollIndicators(.hidden)
                
            }
            .background(.gray.opacity(0.1))
            .background(.white)
            
            
            .clipShape(
                .rect(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 20
                )
            )
            .ignoresSafeArea(.all, edges: .bottom)
            
            .onAppear(perform: {
                self.homeVM.homeAPICall { isSuccess, message in
                    if isSuccess {
                        
                    }
                }
            })
            
            
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView  {
    
    //MARK: Tab Button View
    func tabBtnView() -> some View {
        HStack {
            TabBtnSelectedView(titleName: TitleText.topLinks.rawValue, isSelected: isTopLinkSelected) {
                isTopLinkSelected = true
            }
            TabBtnSelectedView(titleName: TitleText.recentLinks.rawValue, isSelected: !isTopLinkSelected) {
                isTopLinkSelected = false
            }
        }
    }
    //MARK: TopLink ANd RecentLink
    func topRecentLinkView() -> some View {
        
        VStack{
            if isTopLinkSelected {
                ForEach((self.homeVM.homeModel?.data?.topLinks ?? [])) { value in
                    LinksCellView(ImgURlStr: value.originalImage ?? "", titleName: value.app ?? "", dateTitle: value.createdAt?.toDateFormatted() ?? "", totlClick: value.totalClicks ?? 0, urlLink: value.webLink ?? "")
                }
            } else {
                ForEach((self.homeVM.homeModel?.data?.recentLinks ?? [])) { value in
                    LinksCellView(ImgURlStr: value.originalImage ?? "", titleName: value.app ?? "", dateTitle: value.createdAt?.toDateFormatted() ?? "", totlClick: value.totalClicks ?? 0, urlLink: value.webLink ?? "")
                }
            }
        }
    }
    
    //MARK:  Blue Navigation View
    func topNavView() -> some View {
        ZStack(alignment: .leading) {
            Color.blue
            
                .ignoresSafeArea(.all, edges: .top)
                .offset(x:0, y: 20)
                .ignoresSafeArea(.all ,edges: .top)
                .frame(height: 50)
            Text(TitleText.dashBoard.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.leading)
        }
        
    }
    
    //MARK: Greeting View
    
    func greetingView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(ConstantValue.getGreetingForTimeOfDay())
                    .foregroundStyle(.gray)
                Text(TitleText.hey.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        
        
    }
}
