if [ ! -f "vmlinuz-5.10.0-26-arm64" ]; then
    echo "AAA"
    wget https://github.com/wtdcode/DebianOnQEMU/releases/download/v2024.01.05/vmlinuz-5.10.0-26-arm64
    wget https://github.com/wtdcode/DebianOnQEMU/releases/download/v2024.01.05/initrd.img-5.10.0-26-arm64
    wget https://github.com/wtdcode/DebianOnQEMU/releases/download/v2024.01.05/debian-bullseye-arm64.qcow2
fi

qemu-system-aarch64 -m 512 -M virt -cpu cortex-a57 -kernel ./vmlinuz-5.10.0-26-arm64 \
                    -initrd ./initrd.img-5.10.0-26-arm64 \
                    -append "console=ttyAMA0 debug root=/dev/vda net.ifnames=0" \
                    -hda ./debian-bullseye-arm64.qcow2 -nographic \
                    -nic user,model=virtio-net-pci,hostfwd=tcp::5555-:22
