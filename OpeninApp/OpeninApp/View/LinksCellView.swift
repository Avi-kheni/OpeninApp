//
//  LinksCellView.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import SwiftUI

struct LinksCellView: View {
    var ImgURlStr : String
    var titleName : String
    var dateTitle  : String
    var totlClick : Int
    var urlLink : String
    
    var body: some View {
        VStack(alignment: .leading,spacing:0){
            topDetailView()
                
            bottomLinkView()
        }
        .padding()
      
    }
}

#Preview {
    LinksCellView(ImgURlStr: "https://assets.nobroker.in/nb-new/public/List-Page/ogImage.pg", titleName: "nobroker", dateTitle: "", totlClick: 6, urlLink: "https://boyceavenue.inopenapp.com/boyce-avenue")
        .frame(maxHeight: .infinity)
        .background(.gray.opacity(0.1))
}
extension LinksCellView {
    
    
    func topDetailView() -> some View {
        HStack {
     
                AsyncImage(url: URL(string: ImgURlStr)!){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                    
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray,lineWidth: 1)
                }
            VStack(alignment: .leading,spacing: 8) {
                Text(titleName)
                Text(dateTitle)
                    .foregroundStyle(.gray)
            
            }
            Spacer()
            VStack(alignment: .center,spacing: 8) {
                Text(String(totlClick))
                    .fontWeight(.semibold)
                Text(TitleText.clicks.rawValue)
                    .foregroundStyle(.gray)
            
            }

        }
        .padding(.all)
        .background(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 8,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 8
            )
            )
        
        
        
    }
    func bottomLinkView() -> some View {
        HStack {
            
           Text(urlLink)
            Spacer()
            Button {
                UIPasteboard.general.string = urlLink
            } label: {
                
                Image(systemName: "doc.on.doc")
            }

        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            Rectangle()
                .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 8,
                    bottomTrailingRadius: 8,
                    topTrailingRadius: 0
                )
                )
                .foregroundColor(.blue.opacity(0.1))
            
        }
        .background {
            Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundStyle(.blue)
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 8,
                    bottomTrailingRadius: 8,
                    topTrailingRadius: 0
                )
            )
        }
       
    }
}
