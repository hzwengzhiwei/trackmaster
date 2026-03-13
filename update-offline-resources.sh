#!/bin/bash

# TrackMaster 离线资源更新脚本
# 用于下载并更新项目所需的离线资源文件

echo "TrackMaster 离线资源更新脚本"
echo "================================"

# 创建资源目录
echo "创建资源目录..."
mkdir -p assets/{js,css,fonts,webfonts}

echo "开始下载资源文件..."

# 1. 下载 Fabric.js
echo "正在下载 Fabric.js..."
curl -L -o "assets/js/fabric.min.js" "https://cdnjs.cloudflare.com/ajax/libs/fabric.js/5.3.1/fabric.min.js"
if [ $? -eq 0 ]; then
    echo "✓ Fabric.js 下载完成"
else
    echo "✗ Fabric.js 下载失败"
fi

# 2. 下载 Tailwind CSS (使用 CDN 构建版本)
echo "正在下载 Tailwind CSS..."
curl -L -o "assets/js/tailwind.min.js" "https://cdn.tailwindcss.com"
if [ $? -eq 0 ]; then
    echo "✓ Tailwind CSS 下载完成"
else
    echo "✗ Tailwind CSS 下载失败"
fi

# 3. 下载 Font Awesome
echo "正在下载 Font Awesome..."
curl -L -o "assets/css/font-awesome.min.css" "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
if [ $? -eq 0 ]; then
    echo "✓ Font Awesome CSS 下载完成"
else
    echo "✗ Font Awesome CSS 下载失败"
fi

# 下载 Font Awesome 字体文件
echo "正在下载 Font Awesome 字体文件..."
mkdir -p assets/webfonts

echo "  - 下载 fa-solid-900.woff2..."
curl -L -o "assets/webfonts/fa-solid-900.woff2" "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/webfonts/fa-solid-900.woff2"
if [ $? -eq 0 ]; then
    echo "    ✓ fa-solid-900.woff2 下载完成"
else
    echo "    ✗ fa-solid-900.woff2 下载失败"
fi

echo "  - 下载 fa-regular-400.woff2..."
curl -L -o "assets/webfonts/fa-regular-400.woff2" "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/webfonts/fa-regular-400.woff2"
if [ $? -eq 0 ]; then
    echo "    ✓ fa-regular-400.woff2 下载完成"
else
    echo "    ✗ fa-regular-400.woff2 下载失败"
fi

echo "  - 下载 fa-brands-400.woff2..."
curl -L -o "assets/webfonts/fa-brands-400.woff2" "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/webfonts/fa-brands-400.woff2"
if [ $? -eq 0 ]; then
    echo "    ✓ fa-brands-400.woff2 下载完成"
else
    echo "    ✗ fa-brands-400.woff2 下载失败"
fi

# 4. 下载 heic2any
echo "正在下载 heic2any..."
curl -L -o "assets/js/heic2any.min.js" "https://cdn.jsdelivr.net/npm/heic2any@0.0.4/dist/heic2any.min.js"
if [ $? -eq 0 ]; then
    echo "✓ heic2any 下载完成"
else
    echo "✗ heic2any 下载失败"
fi

# 5. 创建字体 CSS 文件（包含钉钉进步体和思源黑体）
echo "正在创建字体 CSS 文件..."
cat > "assets/fonts/noto-sans-sc.css" << 'EOF'
/* 钉钉进步体 - 默认字体 */
@font-face {
  font-family: 'DingTalk JinBuTi';
  font-style: normal;
  font-weight: 400;
  src: url('../webfonts/DingTalkJinBuTi-Regular.ttf') format('truetype');
  font-display: swap;
}

/* 为钉钉进步体定义粗体权重 */
@font-face {
  font-family: 'DingTalk JinBuTi';
  font-style: normal;
  font-weight: 700;
  src: url('../webfonts/DingTalkJinBuTi-Regular.ttf') format('truetype');
  font-display: swap;
}

@font-face {
  font-family: 'DingTalk JinBuTi';
  font-style: normal;
  font-weight: 900;
  src: url('../webfonts/DingTalkJinBuTi-Regular.ttf') format('truetype');
  font-display: swap;
}

/* 思源黑体作为备用字体 - 保持向后兼容 */
@font-face {
  font-family: 'Noto Sans SC';
  font-style: normal;
  font-weight: 400;
  src: local('Noto Sans CJK SC'), local('NotoSansCJKSC-Regular'), local('Source Han Sans SC'), local('SourceHanSansSC-Regular'), local('PingFang SC'), local('Microsoft YaHei'), local('微软雅黑'), local('SimSun'), local('宋体'), sans-serif;
}

@font-face {
  font-family: 'Noto Sans SC';
  font-style: normal;
  font-weight: 700;
  src: local('Noto Sans CJK SC Bold'), local('NotoSansCJKSC-Bold'), local('Source Han Sans SC Bold'), local('SourceHanSansSC-Bold'), local('PingFang SC Semibold'), local('Microsoft YaHei Bold'), local('微软雅黑 Bold'), local('SimHei'), local('黑体'), sans-serif;
}

@font-face {
  font-family: 'Noto Sans SC';
  font-style: normal;
  font-weight: 900;
  src: local('Noto Sans CJK SC Black'), local('NotoSansCJKSC-Black'), local('Source Han Sans SC Heavy'), local('SourceHanSansSC-Heavy'), local('PingFang SC Semibold'), local('Microsoft YaHei Bold'), local('微软雅黑 Bold'), local('SimHei'), local('黑体'), sans-serif;
}
EOF

if [ $? -eq 0 ]; then
    echo "✓ 字体 CSS 文件创建完成"
else
    echo "✗ 字体 CSS 文件创建失败"
fi

# 6. 检查钉钉进步体字体文件
echo "正在检查钉钉进步体字体文件..."
if [ -f "assets/webfonts/DingTalkJinBuTi-Regular.ttf" ]; then
    echo "✓ 钉钉进步体字体文件已存在"
else
    echo "⚠️  钉钉进步体字体文件未找到"
    echo "   请确保 DingTalkJinBuTi-Regular.ttf 文件位于 assets/webfonts/ 目录中"
fi

# 7. 创建资源版本信息文件
echo "正在创建版本信息文件..."
cat > "assets/version.txt" << EOF
TrackMaster 离线资源版本信息
更新时间: $(date)
================================
Fabric.js: 5.3.1
Tailwind CSS: latest (CDN版本)
Font Awesome: 6.4.0
heic2any: 0.0.4
DingTalk JinBuTi: 需要手动添加
Noto Sans SC: 系统字体回退版本
================================
EOF

# 检查文件完整性
echo ""
echo "检查下载文件完整性..."
files=(
    "assets/js/fabric.min.js"
    "assets/js/tailwind.min.js"
    "assets/css/font-awesome.min.css"
    "assets/js/heic2any.min.js"
    "assets/fonts/noto-sans-sc.css"
)

all_success=true
for file in "${files[@]}"; do
    if [ -f "$file" ] && [ -s "$file" ]; then
        echo "✓ $file 存在且不为空"
    else
        echo "✗ $file 缺失或为空"
        all_success=false
    fi
done

echo ""
if [ "$all_success" = true ]; then
    echo "🎉 所有资源文件下载完成！"
    echo "项目现在可以在离线环境下运行。"
    echo ""
    echo "文件结构:"
    echo "assets/"
    echo "├── css/"
    echo "│   └── font-awesome.min.css"
    echo "├── js/"
    echo "│   ├── fabric.min.js"
    echo "│   ├── tailwind.min.js"
    echo "│   └── heic2any.min.js"
    echo "├── fonts/"
    echo "│   └── noto-sans-sc.css"
    echo "├── webfonts/"
    echo "│   ├── fa-solid-900.woff2"
    echo "│   ├── fa-regular-400.woff2"
    echo "│   ├── fa-brands-400.woff2"
    echo "│   └── DingTalkJinBuTi-Regular.ttf (需要手动添加)"
    echo "└── version.txt"
    echo ""
    echo "⚠️  注意：请手动下载钉钉进步体字体文件到 assets/webfonts/ 目录"
else
    echo "❌ 部分资源下载失败，请检查网络连接后重试。"
    exit 1
fi