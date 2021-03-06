//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Antonio Gormley on 24/06/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {

            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    ForEach (0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)

                            
                                    VStack (spacing:0){
                                        Image (model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                            Text (model.recipes[index].name)
                                                .padding(5)
                                    }

                                }
   
                            })
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5) ,radius: 10, x: -5, y : 5 )
                            
                        }

                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack (alignment: .leading, spacing: 20){
                Text("Preparation time: ")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)

                Text("..........")


            }.padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
