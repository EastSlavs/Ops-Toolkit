#!/bin/bash
{
echo "===== nvidia-smi ====="
nvidia-smi

echo
echo "===== topo ====="
nvidia-smi topo -m

echo
echo "===== driver ====="
nvcc -V

echo
echo "===== os ====="
cat /etc/os-release

echo
echo "===== kernel ====="
uname -r

echo
echo "===== nvidia module ====="
lsmod | grep nvidia

echo
echo "===== pci ====="
lspci | grep -i nvidia

echo
echo "===== pci detail ====="
lspci -vv | grep -A20 -i nvidia

echo
echo "===== NVRM ====="
dmesg | grep -i NVRM

echo
echo "===== Xid ====="
dmesg | grep -i Xid

echo
echo "===== PCIe ====="
dmesg | grep -i pcie

echo
echo "===== NCCL env ====="
env | grep NCCL

echo
echo "===== PyTorch ====="
python3 - <<'EOF'
import torch

print("torch:", torch.__version__)
print("cuda :", torch.version.cuda)
print("count:", torch.cuda.device_count())

for i in range(torch.cuda.device_count()):
    print(f"gpu{i}: {torch.cuda.get_device_name(i)}")
EOF

} > gpu_info.txt 2>&1
