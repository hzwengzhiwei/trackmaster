# TrackMaster - 轨迹封面大师

🎯 专为两步路APP设计的轨迹封面制作可视化工具，让您轻松创建专业美观的运动轨迹封面图。

## 🚀 快速开始

### 1. 准备素材
- 📱 底图照片（支持HEIC格式）
- 🗺️ 轨迹文件（从两步路APP导出的GPX文件）

### 2. 在线访问
https://hzwengzhiwei.github.io/trackmaster/

### 3. 基础操作
1. **上传底图**：点击左侧图片图标上传照片
2. **导入轨迹**：点击路径图标上传轨迹文件
3. **选择模板**：点击底部排版按钮选择合适的布局
4. **调整样式**：选中元素后使用浮动工具栏调整
5. **导出图片**：点击"导出图片"按钮保存

手机操作小技巧：文字编辑无反应时，点击别的元素后重新点击文字进行编辑

## ✨ 功能特色

### 📸 图片处理
- **多格式支持**：支持 JPG、PNG、GIF、WebP 等常见图片格式
- **HEIC转换**：自动识别并转换 iPhone 的 HEIC 格式照片
- **智能居中**：自动适配图片尺寸并居中显示
- **实时预览**：上传后立即预览效果

### 🗺️ 轨迹数据
- **格式兼容**：支持 GPX、KML、XML、TXT 等轨迹文件格式
- **两步路专属**：完美解析两步路APP导出的轨迹数据
- **智能简化**：自动优化轨迹点密度，提升渲染性能
- **数据统计**：自动计算里程、耗时、爬升、海拔等运动数据

### 🎨 视觉设计
- **轨迹样式**：
  - 海拔渐变色彩（低海拔绿色→高海拔红色）
  - 纯色填充模式
  - 可调节轨迹粗细（2-50像素）
  - 起终点标记（可调大小）
- **字体系统**：
  - 使用Google Fonts思源黑体（Noto Sans SC）
  - 支持系统默认字体（Inter、system-ui等）
  - 支持字重、字号、颜色调整
  - 描边、阴影效果
- **标记元素**：
  - 圆形标记点
  - 可调颜色、大小、描边
  - 阴影特效

### 🔧 编辑工具
- **选择操作**：
  - 单选、多选、框选
  - Shift键约束移动方向
  - 左选包含、右选相交
- **对齐分布**：
  - 左对齐、居中、右对齐
  - 顶对齐、垂直居中、底对齐
  - 水平/垂直均匀分布
- **成组管理**：
  - Ctrl+G 成组，Shift+G 解组
  - 批量编辑属性
- **智能辅助**：
  - 对象吸附对齐
  - 实时辅助线
  - 磁性网格

### 💾 数据管理
- **自动保存**：使用 IndexedDB 本地存储，断电不丢失
- **历史记录**：支持 Ctrl+Z 撤销、Ctrl+Y 重做
- **模板系统**：保存常用排版样式，一键应用
- **导出功能**：生成高清 PNG 图片


## 💡 设计理念

TrackMaster 专为移动端运动应用设计，致力于：
- **简约美观**：现代化的毛玻璃UI设计
- **专业品质**：精确的数据展示和排版
- **易用性**：直观的操作流程，新手友好
- **性能优化**：智能数据处理，流畅体验
- **个性化**：丰富的自定义选项

## 📁 项目结构

```
trackmaster/
├── index.html                    # 主应用文件
├── README.md                    # 项目说明文档
├── LICENSE                      # Apache 2.0 许可证
├── update-offline-resources.sh  # Linux/macOS 离线资源更新脚本
└── assets/                      # 离线资源目录
    ├── a.jpg                    # 示例图片
    ├── version.txt              # 离线资源版本信息
    ├── css/
    │   └── font-awesome.min.css # Font Awesome 样式文件
    ├── js/
    │   ├── fabric.min.js        # Fabric.js 画布库
    │   ├── tailwind.min.js      # Tailwind CSS 框架
    │   └── heic2any.min.js      # HEIC 格式转换库
    ├── fonts/
    │   └── noto-sans-sc.css     # 思源黑体字体样式（系统回退）
    └── webfonts/                # Font Awesome 字体文件
        ├── fa-solid-900.woff2   # 实心图标字体
        ├── fa-regular-400.woff2 # 线性图标字体
        └── fa-brands-400.woff2  # 品牌图标字体
```

## 🚀 部署方式

### 本地运行
```bash
# 直接打开 index.html 即可使用

# 推荐使用本地服务器以避免跨域问题
python -m http.server 8000
# 或使用 Node.js
npx serve .
```

### 🔌 离线部署（推荐）

TrackMaster 现已支持完全离线运行，无需网络连接即可使用所有功能。

#### 1. 下载离线资源

根据您的操作系统选择相应的脚本：

**Linux/macOS 用户：**
```bash
chmod +x update-offline-resources.sh
./update-offline-resources.sh
```

#### 2. 验证安装

运行脚本后，您应该看到以下文件结构：

```
trackmaster/
├── index.html                    # 主应用文件 (已修改为离线版本)
├── update-offline-resources.sh   # Linux/macOS 更新脚本
├── update-offline-resources.bat  # Windows 更新脚本
├── assets/                       # 离线资源目录
│   ├── css/
│   │   └── font-awesome.min.css  # Font Awesome 样式
│   ├── js/
│   │   ├── fabric.min.js         # Fabric.js 画布库
│   │   ├── tailwind.min.js       # Tailwind CSS 框架
│   │   └── heic2any.min.js       # HEIC 格式转换库
│   ├── fonts/
│   │   └── noto-sans-sc.css      # 思源黑体字体 (系统回退)
│   ├── webfonts/                 # Font Awesome 字体文件
│   │   ├── fa-solid-900.woff2
│   │   ├── fa-regular-400.woff2
│   │   └── fa-brands-400.woff2
│   └── version.txt               # 版本信息
```

#### 3. 版本切换

**切换到在线版本：**
编辑 `index.html` 文件，注释掉离线版本部分，取消注释在线版本部分：

```html
<!-- 在线版本 (需要网络连接) -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;700;900&display=swap" rel="stylesheet">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/5.3.1/fabric.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/heic2any@0.0.4/dist/heic2any.min.js"></script>

<!-- 离线版本 (本地资源) -->
<!-- <link href="./assets/fonts/noto-sans-sc.css" rel="stylesheet"> -->
<!-- <script src="./assets/js/tailwind.min.js"></script> -->
<!-- <script src="./assets/js/fabric.min.js"></script> -->
<!-- <link rel="stylesheet" href="./assets/css/font-awesome.min.css"> -->
<!-- <script src="./assets/js/heic2any.min.js"></script> -->
```

**切换回离线版本：** 执行相反的操作即可。

#### 4. 离线资源更新

**何时需要更新：**
- 首次设置离线环境时
- 依赖库有重要更新时
- 资源文件损坏或丢失时

**如何更新：**
```bash
# Linux/macOS
./update-offline-resources.sh
```

## 📱 兼容性

- **桌面浏览器**：Chrome 80+、Firefox 75+、Safari 13+、Edge 80+
- **移动浏览器**：iOS Safari 13+、Android Chrome 80+
- **操作系统**：Windows 10+、macOS 10.15+、Android 8+、iOS 13+

## 🔐 隐私安全

- **本地处理**：所有图片和轨迹数据仅在本地浏览器处理
- **无服务器**：不上传任何个人数据到远程服务器
- **离线可用**：支持离线使用，保护隐私安全

## 📝 更新日志

### v1.1.0 (2026-03-11)
- ✅ 基础轨迹渲染功能
- ✅ 图片上传和HEIC转换
- ✅ 统计数据自动计算
- ✅ 智能排版模板
- ✅ 自定义样式保存
- ✅ 完整的编辑工具集
- ✅ 响应式设计

## 📄 许可证

本项目采用 Apache 2.0 许可证 - 详见 [LICENSE](LICENSE) 文件

---

如果这个项目对您有帮助，请给个 ⭐ Star 支持一下！
