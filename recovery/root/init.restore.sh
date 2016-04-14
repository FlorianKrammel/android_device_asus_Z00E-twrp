#!/sbin/sh

o=5242388
l=1
s=/dev/block/bootdevice/by-name/aboot

get() {
  t=$(dd if=$s skip=$1 bs=1 count=$2)
  if [ -z "$t" ]; then
    r=00
  else
    r=01
  fi
}

get $o $l
if [ ! $r == "00" ]; then
  dd if=$s\bak of=$s
fi
