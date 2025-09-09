# 第一周计划（每天 2 小时，Web + Misc，新手友好）

固定流程（每次训练）
- 10 分钟：翻一遍速查表（XSS/SQLi/Misc SOP）
- 80 分钟：做题（先手工，再用工具：Burp/ffuf/sqlmap/file/strings/binwalk等）
- 10 分钟：复盘写要点（触发条件 / 关键 payload / 踩坑与绕过）

推荐平台
- Web：PortSwigger Web Security Academy（按专题刷）
  - 索引页：  
    - [XSS](https://portswigger.net/web-security/cross-site-scripting)  
    - [SQL Injection](https://portswigger.net/web-security/sql-injection)  
    - [Information disclosure](https://portswigger.net/web-security/information-disclosure)  
    - [Access control](https://portswigger.net/web-security/access-control)  
    - [File upload](https://portswigger.net/web-security/file-upload)  
    - [SSTI](https://portswigger.net/web-security/server-side-template-injection)  
    - [SSRF](https://portswigger.net/web-security/ssrf)
- Misc：新手题从图片隐写/压缩套娃/pcap 基础开始
  - 取证流量样本：[Malware-Traffic-Analysis – Training Exercises](https://www.malware-traffic-analysis.net/training-exercises.html)

Day 1（XSS 入门 + PNG 隐写）
- Web（约 60–70 分钟）
  - PortSwigger：Reflected XSS 基础类 2–3 题（从"Reflected XSS"分类中挑最前面的）
  - 目标：学会用 Burp 抓改包、在 HTML 上下文插入 payload：`"><svg onload=alert(1)>`
- Misc（约 20–30 分钟）
  - 一道 PNG 隐写：用 `file / strings -n 6 / exiftool / zsteg -a / pngcheck -v` 全流程排查
- 复盘要点：在哪个参数/上下文触发；是否需要闭合引号/标签；过滤/绕过点

Day 2（SQLi UNION 基础 + 压缩套娃）
- Web
  - PortSwigger：SQLi UNION 基础 2 题（"Determining number of columns" → "Finding a column containing text" 这类）
  - 步骤：`ORDER BY` 猜列 → `UNION SELECT NULL,...` → 找到 text 列 → 尝试读版本/库名
- Misc
  - 压缩套娃 1 题：`binwalk -e`、`foremost -i`、`7z x` 逐层拆
- 复盘要点：列数判断方法、可显示列定位、过滤与 WAF 现象

Day 3（信息泄露/访问控制 + 条码/EXIF）
- Web
  - PortSwigger：Information disclosure 1 题 + Access control 1 题（各挑最前面的 Easy）
  - 工作流：目录爆破（`feroxbuster`/`ffuf`）→ 找到敏感路径/备份文件/未授权接口
- Misc
  - 条码/二维码或 EXIF 元数据 1 题：`zbarimg img.png`、`exiftool *.jpg`
- 复盘要点：可直接访问的敏感端点，是否可通过修改 Header/路径越权

Day 4（文件上传入门 + PNG 深挖）
- Web
  - PortSwigger：File upload 1–2 题（从最简单的黑名单绕过开始）
  - 技巧：改 `Content-Type`、双扩展/大小写/点、尝试图片马与解析漏洞思路
- Misc
  - 再做 1 个 PNG：重点练 `zsteg -a` 和分块检查（`pngcheck -v`）
- 复盘要点：过滤规则识别、具体绕过策略与服务器解析行为

Day 5（时间盲注入门 + pcap 基础）
- Web
  - PortSwigger：SQLi 盲注（基于时间）1 题（MySQL `SLEEP()` 或 PostgreSQL `pg_sleep()`）
  - 思路：用延时观察差异；Burp Intruder/Repeater 批量测试字符
- Misc
  - pcap 1 题：用 Wireshark / `tshark -r file.pcap -Y "http.request"`；导出 HTTP 对象，找到 flag/凭据
- 复盘要点：判定"真/假"响应依据（状态码/长度/时间），如何自动化枚举

Day 6（SSTI/SSRF 初识 + PDF 取证）
- Web
  - PortSwigger：SSTI 1 题（探测 `{{7*7}}` / `${7*7}`）+ SSRF 1 题（127.0.0.1/metadata + dnslog 思路）
- Misc
  - PDF 1 题：`qpdf --qdf` 或 `pdfid`（若有）观察对象/隐藏信息
- 复盘要点：SSTI 模板识别与执行链；SSRF 绕过（协议/IP 表示法/URL 解析）

Day 7（小测+复盘）
- 小测：从 PortSwigger 本周专题里任选 2 题 + Misc 任意 1 题（自由发挥，限时 90 分钟）
- 复盘：至少写 2 篇高质量 writeup（含"一键复现命令/脚本"）
- 整理：把本周常用 payload 与命令加入你的清单（XSS/SQLi/上传/Misc SOP）
- 准备：在 [CTFtime](https://ctftime.org/) 关注 1 场 beginner/friendly 的赛事