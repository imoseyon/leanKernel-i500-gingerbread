CPU_JOB_NUM=2
#TOOLCHAIN=/root/CodeSourcery/Sourcery_G++_Lite/bin/
#TOOLCHAIN_PREFIX=arm-none-linux-gnueabi-
OPT=0

echo "imoseyon_leanKernel_i500_voodoo_$1" > initramfs_root/kernel_version

#make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX
make -j$CPU_JOB_NUM ARCH=arm 

#find . -name "*.ko" | xargs $TOOLCHAIN/${TOOLCHAIN_PREFIX}strip --strip-unneeded
find . -name "*.ko" | xargs arm-linux-gnueabi-strip --strip-unneeded
cp drivers/staging/zram/zram.ko initramfs_root/lib/modules
cp lib/lzo/lzo_compress.ko initramfs_root/lib/modules
cp lib/lzo/lzo_decompress.ko initramfs_root/lib/modules

rm usr/*.o usr/*.lzma usr/*.gz usr/*.cpio
#make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX
make -j$CPU_JOB_NUM ARCH=arm

cp arch/arm/boot/zImage ../zip/kernel_update
cp .config arch/arm/configs/leani500_defconfig
cd ../zip
rm *.zip
zip -r imoseyon_leanKernel_i500_voodoo_$1.zip *
rm /tmp/*.zip
cp *.zip /tmp

