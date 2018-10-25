#!/bin/bash

# 腳本日誌文件
LOGFILE="/tmp/Email.log"
:>"$LOGFILE"
exec 1>"$LOGFILE"
exec 2>&1

# 郵件設定
SMTP_server='smtp.gmail.com:587'       # SMTP服務器，請自行修改
username='service@gmail.com'           # 用戶名，請自行修改
password='123qwe'                      # 密碼，請自行修改
from_email_address='service@gmail.com' # 寄件者Email，請自行修改
to_email_address="$1"                  # 收件者Email，傳入的第一個參數
message_subject="$2"              # 郵件標題，傳入的第一個參數
message_body="$3"                 # 郵件內容，傳入的第一個參數
FILE="/data/file.txt"

# 發送郵件
sendEmail='/usr/bin/sendemail'
set -x
$sendEmail -s "$SMTP_server" -xu "$username" -xp "$password" -f "$from_email_address" -t "$to_email_address" -u "$message_subject" -m "$message_body" -o message-content-type=text -a $FILE -o tls=yes
