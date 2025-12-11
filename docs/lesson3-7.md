# درسنامه ۳-۷: حلقه‌ها در Bash (for و while)

در این درس با حلقه‌ها در Bash آشنا می‌شویم. حلقه‌ها به شما کمک می‌کنند یک یا چند دستور را چندین بار تکرار کنید؛ مثلا نمایش چند پیام پشت سر هم، پردازش لیستی از فایل‌ها یا شمارش.

در Bash دو حلقهٔ پایه را یاد می‌گیریم:
- حلقهٔ `for`
- حلقهٔ `while`

## حلقه for روی یک لیست ساده
ساختار کلی:

```bash
for ITEM in لیست_مقادیر
do
  دستورات
done
```

مثال ساده:

```bash
#!/bin/bash

for NAME in Ali Sara John
do
  echo "Hello $NAME!"
done
```

خروجی:

```bash
Hello Ali!
Hello Sara!
Hello John!
```

## حلقه for روی اعداد
می‌توانیم از گسترش آکلاد استفاده کنیم:

```bash
#!/bin/bash

for NUM in {1..5}
do
  echo "Number: $NUM"
done
```

خروجی:

```bash
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

## حلقه for روی فایل‌ها
حلقه‌های `for` برای کار با مجموعه‌ای از فایل‌ها بسیار مفیدند:

```bash
#!/bin/bash

for FILE in *.txt
do
  echo "Processing file: $FILE"
done
```

در این مثال، اسکریپت همهٔ فایل‌های `*.txt` در دایرکتوری فعلی را لیست می‌کند و برای هرکدام یک پیام نمایش می‌دهد.

## حلقه while — تا وقتی شرط برقرار است
حلقهٔ `while` یک بلوک کد را تا زمانی که شرط درست است تکرار می‌کند.

ساختار کلی:

```bash
while [ شرط ]
do
  دستورات
done
```

مثال شمارش:

```bash
#!/bin/bash

COUNT=1

while [ "$COUNT" -le 3 ]
do
  echo "Loop iteration: $COUNT"
  COUNT=$((COUNT + 1))
done
```

خروجی:

```bash
Loop iteration: 1
Loop iteration: 2
Loop iteration: 3
```

## حلقه while برای گرفتن ورودی تا شرط خاص
یک الگوی رایج: از کاربر ورودی بگیریم تا زمانی که یک مقدار خاص (مثلا `exit`) وارد کند.

```bash
#!/bin/bash

while true
do
  read -p "Type a word (or 'exit' to quit): " WORD

  if [ "$WORD" = "exit" ]; then
    echo "Goodbye!"
    break
  fi

  echo "You typed: $WORD"
done
```

در این مثال:
- `while true` یعنی حلقه همیشه ادامه دارد، مگر این‌که با `break` از آن خارج شویم.
- اگر کاربر `exit` بنویسد، پیام خداحافظی چاپ می‌شود و حلقه با `break` تمام می‌شود.

## تمرین کوتاه
- اسکریپتی بنویسید که با استفاده از حلقهٔ `for` اعداد ۱ تا ۱۰ را چاپ کند.
- اسکریپتی بنویسید که با `while` از کاربر نام بگیرد و هر بار پیام `"Hello NAME!"` را چاپ کند تا وقتی که کاربر فقط Enter خالی بزند؛ در آن لحظه اسکریپت باید پایان یابد.

در درس بعد، یاد می‌گیریم چگونه با استفاده از `case` و حلقه‌ها، منوی متنی ساده بسازیم.

