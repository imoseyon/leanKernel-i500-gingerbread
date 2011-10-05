CPU_JOB_NUM=2
TOOLCHAIN=/usr/bin/
TOOLCHAIN_PREFIX=arm-linux-gnueabi-
OPT=0

#echo "imoseyon_leanKernel_charge_voodoo_$1" > initramfs_root.voodoo/kernel_version

#rm usr/*.o usr/*.lzma

make -j$CPU_JOB_NUM ARCH=arm CROSS_COMPILE=$TOOLCHAIN/$TOOLCHAIN_PREFIX modules

#cp arch/arm/boot/zImage ../zip/kernel_update
cp .config arch/arm/configs/leani510_defconfig
#cd ../zip
#rm *.zip
#zip -r imoseyon_leanKernel_charge_voodoo_$1.zip *
#rm /tmp/*.zip
#cp *.zip /tmp
find . -name "*.ko" | xargs /usr/bin/arm-linux-gnueabi-strip --strip-unneeded
find . -name "*.ko" | xargs -i cp -f {} /tmp
