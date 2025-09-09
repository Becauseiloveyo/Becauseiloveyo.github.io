# Web 速查表（XSS / SQLi / 上传 / SSTI / SSRF）

## Recon
- 指纹：Wappalyzer
- 目录爆破：
```bash
feroxbuster -u http://target -x php,asp,aspx,js -w /usr/share/seclists/Discovery/Web-Content/common.txt
ffuf -u http://target/FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt -fs 0
```

## XSS
- 快测：`"&gt;`
- 常见点：参数、搜索框、留言、HTTP 响应中的反射点
- 提示：闭合引号/标签、事件处理器、HTML/JS 上下文区分

## SQLi
- 测试：`' OR '1'='1 -- -`
- 时间盲注：`AND SLEEP(3)` / `pg_sleep(3)`
- UNION 基本形态：ORDER BY 猜列 → UNION SELECT NULL,… → 爆库表列
- 自动化：
```bash
sqlmap -u "http://host/item.php?id=1" --batch --level 2 --risk 1
```

## 文件上传
- 绕过点：Content-Type 修改、双扩展/大小写/点、黑白名单、.htaccess
- 常试扩展：.php .phtml .php5；或图片马+解析漏洞思路

## SSTI
- 探测：`{{7*7}}`、`${7*7}`
- 观察：渲染结果是否变为 49；识别模板引擎（Jinja2/Twig/Velocity/FreeMarker 等）

## SSRF
- 探测：访问 127.0.0.1 / 169.254.169.254；配合 dnslog 平台
- 绕过：协议（http/file/gopher）、IP 表示法（十进制/八进制）、URL 解析边界

## 小技巧
- 看响应差异：长度、状态码、关键字
- 编码绕过：URL 编码、双重编码、大小写变化、分隔符注入