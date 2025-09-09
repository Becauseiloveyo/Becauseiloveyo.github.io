# Web + Misc 速查（训练前 10 分钟翻一遍）

## Web
- 目录爆破
```bash
feroxbuster -u http://target -x php,asp,aspx,js -w /usr/share/seclists/Discovery/Web-Content/common.txt
ffuf -u http://target/FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt -fs 0
```
- XSS：`"><svg onload=alert(1)>`
- SQLi：`' OR '1'='1 -- -`；时间盲注：`AND SLEEP(3)` / `pg_sleep(3)`
- 上传：改 Content-Type、双扩展/大小写/点、.htaccess
- SSTI：`{{7*7}}` / `${7*7}`
- SSRF：`http://127.0.0.1`、`169.254.169.254` + dnslog

## Misc（30 分钟 SOP）
```bash
file target
strings -n 6 target | less
xxd -g 1 -l 64 target
binwalk -e target
foremost -i target
7z x target
exiftool target
steghide extract -sf target   # 先空密码，再字典
pngcheck -v target.png
zsteg -a target.png
zbarimg target.png
tshark -r target.pcap -Y "http.request" -T fields -e http.host -e http.request.uri | sort -u
```