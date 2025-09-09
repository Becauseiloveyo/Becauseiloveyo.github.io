# Misc 30 分钟排查清单

## 基础识别
```bash
file target
strings -n 6 target | less
xxd -g 1 -l 64 target
```

## 压缩/拼接/隐藏
```bash
binwalk -e target
foremost -i target
7z x target
```

## 元数据/隐写
```bash
exiftool target
steghide extract -sf target  # 先试空密码，再试 rockyou 字典
pngcheck -v target.png
zsteg -a target.png
zbarimg target.png  # 二维码/条码
```

## 媒体/音频
```bash
ffmpeg -i target.wav
# 可视化建议：Sonic Visualiser / Audacity（看频谱，识别摩斯/DTMF）
```

## 流量/取证
```bash
tshark -r target.pcap -Y "http.request" -T fields -e http.host -e http.request.uri | sort -u
# Wireshark：Follow TCP Stream / 导出对象
```