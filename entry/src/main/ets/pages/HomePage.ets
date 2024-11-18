

class A {
  text: string = ''
  num: number = 0
}
interface ItemCardProps {
  title: string,
  date: string,
  key: string,
}

const data: ItemCardProps[] = [
  {
    title: "Harmony Todo",
    date: "2024.11.17~2024.12.10",
    key: "001",
  },
  {
    title: "Harmony Todo",
    date: "2024.11.17~2024.12.10",
    key: "002",
  },
  {
    title: "Harmony Todo",
    date: "2024.11.17~2024.12.10",
    key: "003",
  }
]

@Entry
@Component
struct HomePage {
  @State TooTmp: ToolbarItem = {'value': "func", 'icon': "./image/ic_public_highlights.svg", 'action': ()=> {}}

  // @State colorMode =

  @Builder MenuForHeader() {
    Row({ space: 12 }) {
      Image($r("app.media.menuIcon")).width(24)
      TextInput({placeholder: "search"}).layoutWeight(1).fontSize(2)
      Image($r("app.media.libraryIcon")).width(20)
      Image($r("app.media.avatar")).width(24).borderRadius(12)
    }
    .padding({top: 8, bottom: 8, left: 16, right: 16})
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    // .borderWidth(1)
    // .borderColor(Color.Gray)
  }

  @Builder ListItemCard(props: ItemCardProps) {
    RelativeContainer() {
      Column() {
        Text(props.title).fontWeight(FontWeight.Bold)
        Text(props.date).fontSize(12)
      }
      .alignItems(HorizontalAlign.Start)
      .padding({top: 16, left: 8})
      .backgroundColor(Color.White)
      Text("Left 20days")
        .fontSize(12)
        .alignRules({
        right: { anchor: "__container__", align: HorizontalAlign.End },
          left: { anchor: "__container__", align: HorizontalAlign.Start},
          top: { anchor: "__container__", align: VerticalAlign.Top },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        bias: { horizontal: 0.94, vertical: 0.86 },
      })
        .width(72)
        .height(16)
      Row() {
        Column().width("30%").backgroundColor(Color.Orange).height(8).opacity(0.5)
        Column().width("70%").backgroundColor(Color.Gray).height(8).opacity(0.5)
      }.alignRules({
        "left": { anchor: "__container__", align: HorizontalAlign.Start },
        "bottom": { anchor: "__container__", align: VerticalAlign.Bottom },
      })
    }
  }

 build() {
   Navigation() {
     Row({space: 40}) {
       Column() {
         Text("45")
         Text("In Progress")
       }.alignItems(HorizontalAlign.Start)
       Column() {
         Text("24")
         Text("Upcoming")
       }.alignItems(HorizontalAlign.Start)
       Column() {
         Text("69")
         Text("Done")
       }.alignItems(HorizontalAlign.Start)
     }
     .alignItems(VerticalAlign.Center)
     .justifyContent(FlexAlign.Center)
     .margin({top: 12, bottom: 12})
       List() {
       ForEach(data, (item: ItemCardProps, index) => {
         ListItem() {
           this.ListItemCard(item)
         }.clip(true)
         .height(72)
         .width("100%")
         .border({
           radius: 16,
         })
       }, (item: ItemCardProps) => item.key)
       }
       .width("100%")
       .height("80%")
       .listDirection(Axis.Vertical)
       .padding({ left: 16, right: 16 })

   }
   .mode(NavigationMode.Auto)
   .titleMode(NavigationTitleMode.Mini)
   .bindMenu()
   .hideBackButton(true)
   .menus(this.MenuForHeader())
   .toolbarConfiguration([
     {
       value: "Home"
     },
     {
       value: "App"
     },
     {
       value: "Setting"
     }
   ]).backgroundColor($r("app.color.background_primary"))
 }
}