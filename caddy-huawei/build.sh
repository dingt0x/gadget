#!/usr/bin/env bash
set -euo pipefail

# 颜色定义
colorReset='\033[0m'
colorBright='\033[1m'
colorCyan='\033[36m'
colorYellow='\033[33m'
colorMagenta='\033[35m'
colorRed='\033[31m'
colorBlue='\033[34m'
colorWhite='\033[37m'
colorGreen='\033[32m'

# 显示成功信息
show_success() {
    local message=$1
    printf "${colorBright}${colorGreen}✅ ${message}${colorReset}\n"
}

# 显示警告信息
show_warning() {
    local message=$1
    printf "${colorBright}${colorYellow}⚠️  ${message}${colorReset}\n"
}

# 显示错误信息
show_error() {
    local message=$1
    printf "${colorBright}${colorRed}❌ ${message}${colorReset}\n"
}

# 显示进度信息
show_progress() {
    local message=$1
    printf "${colorBright}${colorBlue}🔄 ${message}${colorReset}\n"
}


APP_VERSION="2.9.1"

repo=${1:-""}
if [ -z "$repo" ]; then
    show_error "请输入仓库地址"
    exit
fi


docker build --build-arg APP_VERSION=${APP_VERSION} -t "${repo}/caddy:${APP_VERSION}-dnswithhuawei" ./

show_success "打包成功，接下来可以执行:\\n  docker push "${repo}/caddy:${APP_VERSION}-dnswithhuawei""
