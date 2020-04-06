//
//  ProfilView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilView: View {
    
    @EnvironmentObject var giftVM: GiftViewModel
    
    @EnvironmentObject var FavoriteVM: FavoriteViewModel
    
    @ObservedObject var profilVM = ProfilViewModel()
    
    @Binding var showMenu: Bool
    
    @State var giftIsSelected : Bool = true
    
    @State var navigagtionAppear : Bool = true
    
    @State var heighGiftView : CGFloat = 0
    
    var body: some View {
        ZStack {
            NavigationView {
                
                VStack(spacing:0) {
                    VStack {
                        WebImage(url: URL(string: "http://192.168.1.51:8080/\(getUser()?.photo ?? "")"))
                            .resizable()
                            .placeholder  {
                                Rectangle().foregroundColor(Color.gray)
                        }
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        
                        Text("profil")
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color("colorGrey10"))
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    
                    HStack{
                        Button(action: {
                            
                            
                        }) {
                            Text("Amis")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity)
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                        Divider().frame(maxWidth: 1, maxHeight: 50)
                            .background(Color("colorGrey10"))
                        
                        Button(action: {
                            
                            
                        }) {
                            Text("Enfant")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity)
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                    }.frame(maxWidth:.infinity, alignment: .center)
                        .background(Color.white)
                    
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    HStack {
                        Button(action: {
                            /*let swiftUI = LoginView()
                             UIApplication.shared.keyWindow!.rootViewController = UIHostingController(rootView: swiftUI)*/
                            self.giftIsSelected = true
                        }) {
                            (self.giftIsSelected) ? Image("GiftSelected")
                                .foregroundColor(Color("colorPink"))
                                .frame(maxWidth: .infinity) :  Image("GiftUnselected")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity)
                        }.buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            self.giftIsSelected = false
                        }) {
                            
                            (self.giftIsSelected) ? Image("FavoriteNotSelected")
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity) :  Image("FavoriteSelected")
                                    .foregroundColor(Color("colorPink"))
                                    .frame(maxWidth: .infinity)
                        }.buttonStyle(PlainButtonStyle())
                        
                    }.padding(14)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)
                    
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    
                    
                    GiftView().opacity((self.giftIsSelected) ? 1:0).frame(minHeight: 0, maxHeight: (self.giftIsSelected) ? .infinity : 0)
                    
                    FavoriteView().opacity((self.giftIsSelected) ? 0:1)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarItems(trailing: Button(action:{
                        self.showMenu = true
                    }){
                        HStack {
                            Image("settings")
                                .foregroundColor(Color.white)
                        }
                    })
            }
        }.onAppear {
            self.profilVM.getUserInformations(userId: getUser()?.id)
        }
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(showMenu: .constant(false))
    }
    
}

