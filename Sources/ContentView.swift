import SwiftUI

struct ContentView: View {
    @State private var scale = 1.0
    @State private var opacity = 1.0
    @State private var offset: CGFloat = 0
    @State private var rotation: Double = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // 1. 缩放动画
                VStack {
                    Text("1. 缩放动画")
                        .font(.headline)

                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 0.5), value: scale)

                    HStack {
                        Button("缩小") { scale = 0.5 }
                        Button("恢复") { scale = 1.0 }
                        Button("放大") { scale = 1.5 }
                    }
                }

                Divider()

                // 2. 透明度动画
                VStack {
                    Text("2. 透明度动画")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                        .frame(width: 100, height: 60)
                        .opacity(opacity)
                        .animation(.easeIn(duration: 0.3), value: opacity)

                    Button("淡入/淡出") {
                        opacity = opacity == 1.0 ? 0.3 : 1.0
                    }
                }

                Divider()

                // 3. 移动动画
                VStack {
                    Text("3. 移动动画")
                        .font(.headline)

                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.orange)
                            .frame(width: 60, height: 60)
                            .offset(x: offset)
                            .animation(.easeOut(duration: 0.4), value: offset)

                        Spacer()

                        Button("左移") { offset -= 50 }
                        Button("右移") { offset += 50 }
                    }
                    .padding(.horizontal)
                }

                Divider()

                // 4. 旋转动画
                VStack {
                    Text("4. 旋转动画")
                        .font(.headline)

                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.purple)
                        .rotationEffect(.degrees(rotation))
                        .animation(.linear(duration: 0.5), value: rotation)

                    HStack {
                        Button("旋转 90°") { rotation += 90 }
                        Button("重置") { rotation = 0 }
                    }
                }

                Divider()

                // 5. 组合动画
                VStack {
                    Text("5. 组合动画")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                        .frame(width: 80, height: 80)
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .animation(.easeInOut(duration: 0.5), value: scale)
                        .animation(.easeInOut(duration: 0.5), value: rotation)

                    HStack {
                        Button("放大+旋转") {
                            scale = 1.3
                            rotation += 45
                        }
                        Button("恢复") {
                            scale = 1.0
                            rotation = 0
                        }
                    }
                }
            }
            .padding(30)
        }
    }
}
