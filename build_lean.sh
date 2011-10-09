CPU_JOB_NUM=2
TOOLCHAIN=/usr/bin/
TOOLCHAIN_PREFIX=arm-linux-gnueabi-
OPT=0

echo "imoseyon_leanKernel_i500_voodoo_$1" > initramfs_root/kernel_version

find . -name "*.ko" | xargs $TOOLCHAIN/${TOOLCHAIN_PREFIX}strip --strip-unneeded
cp drivers/staging/zram/zram.ko initramfs_root/lib/modules
cp lib/lzo/lzo_compress.ko initramfs_root/lib/modules
cp lib/lzo/lzo_decompress.ko initramfs_root/lib/modules

rm usr/*.o usr/*.lzma usr/*.gz usr/*.cpio

#make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX modules
make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX

cp arch/arm/boot/zImage ../zip/kernel_update
cp .config arch/arm/configs/leani500_defconfig
cd ../zip
rm *.zip
zip -r imoseyon_leanKernel_i500_voodoo_$1.zip *
rm /tmp/*.zip
cp *.zip /tmp
