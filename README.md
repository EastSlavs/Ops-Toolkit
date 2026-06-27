# Ops-Toolkit

服务器状态一键收集脚本。

## 使用

在训练环境中执行，例如 conda 环境。

wget -qO check.sh https://raw.githubusercontent.com/EastSlavs/Ops-Toolkit/main/gpu_env_check.sh && bash check.sh

执行完成后会生成 gpu_info.txt。

将 gpu_info.txt 与多卡训练时的原始报错日志一起发送至：

slavru7@gmail.com
