# SwiftUI macOS 基础动画

## 简介

演示 SwiftUI 中 `.animation()` 的基础用法，实现各种视图动画效果。

## 快速开始

```bash
cd swiftui-macos-animation-demo
xcodegen generate
open SwiftUIAnimationDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### animation 修饰符

```swift
Text("Hello")
    .animation(.easeInOut(duration: 0.5), value: someState)
```

当 `someState` 变化时，视图会以动画形式过渡到新状态。

### 常用动画曲线

```swift
.animation(.easeInOut(duration: 0.5))     // 慢入慢出
.animation(.easeIn(duration: 0.5))         // 慢入
.animation(.easeOut(duration: 0.5))       // 慢出
.animation(.linear(duration: 0.5))         // 匀速
.animation(.spring())                      // 弹簧
```

### 可动画化的属性

- `.scaleEffect()` - 缩放
- `.opacity()` - 透明度
- `.offset()` - 位置
- `.rotationEffect()` - 旋转
- `.foregroundColor()` - 颜色
- `.frame()` - 尺寸

## 完整示例

```swift
struct ContentView: View {
    @State private var isExpanded = false

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .frame(width: isExpanded ? 200 : 100, height: 100)
            .animation(.easeInOut(duration: 0.3), value: isExpanded)
            .onTapGesture {
                isExpanded.toggle()
            }
    }
}
```

## 完整讲解（中文）

### animation 的工作原理

SwiftUI 的动画基于数据驱动。当状态变化时，如果添加了 `.animation()` 修饰符，SwiftUI 会自动插值计算中间帧，形成动画效果。

### animation 参数

- 第一个参数：动画曲线和时长
- `value`：触发动画的状态值

### 性能注意

- 避免在动画中执行复杂计算
- 使用 `.animation(nil)` 禁用特定动画
