import SwiftUI

extension View {
  
  func onNavigation(_ action: @escaping () -> Void) -> some View {
    let isActive = Binding(
      get: { false },
      set: { newValue in
        if newValue {
          action()
        }
      }
    )
    //Wraps the view with navigation link, that when clicked activates the action callback
    return NavigationLink(
      destination: Text("Uderwata heh"),//EmptyView(),
      isActive: isActive
    ) {
      self
    }
      .buttonStyle(PlainButtonStyle()) //I added this so that it does not color blue all over the view's text, pictures and so on

  }
  
  
  //when a binding chnages, makes navigation to the destination. It overlays the NavigationLink over the current view, that is then used for the navigation.
  func navigation<Item, Destination: View>(
    item: Binding<Item?>,
    @ViewBuilder destination: (Item) -> Destination
  ) -> some View {
    let isActive = Binding(
      get: {  item.wrappedValue != nil
        
      },
      set: { value in
        if !value {
          item.wrappedValue = nil
        }
      }
    )
    return navigation(isActive: isActive) {
      item.wrappedValue.map(destination)
    }
  }
  
  func navigation<Destination: View>(
    isActive: Binding<Bool>,
    @ViewBuilder destination: () -> Destination
  ) -> some View {
    overlay(
      NavigationLink(
        destination: isActive.wrappedValue ? destination() : nil,
        isActive: isActive,
        label: { EmptyView() }
      )
    )
  }
  
}

