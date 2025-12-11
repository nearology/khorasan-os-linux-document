# درسنامه ۳-۹: توابع در Bash و تمیزکردن اسکریپت‌ها

در این درس با توابع (functions) در Bash آشنا می‌شویم. توابع به شما کمک می‌کنند بخش‌های تکراری اسکریپت را در یک جای مشخص بنویسید و هر جا لازم شد آن‌ها را «صدا بزنید».

## تعریف تابع در Bash
دو شکل رایج برای تعریف تابع:

```bash
my_function() {
  دستورات
}

# یا

function my_function {
  دستورات
}
```

بعد از تعریف تابع، می‌توانید آن را مثل یک دستور صدا بزنید:

```bash
my_function
```

## مثال سادهٔ تابع

```bash
#!/bin/bash

greet() {
  echo "Hello from inside the function!"
}

echo "Before calling greet"
greet
echo "After calling greet"
```

خروجی:

```bash
Before calling greet
Hello from inside the function!
After calling greet
```

## تابع با آرگومان
همان‌طور که اسکریپت می‌تواند آرگومان بگیرد (`$1`, `$2` و ...)، تابع هم می‌تواند آرگومان بگیرد:

```bash
#!/bin/bash

greet() {
  NAME="$1"
  echo "Hello $NAME!"
}

greet "Ali"
greet "Sara"
```

در این مثال:
- داخل تابع، آرگومان اول را با `$1` می‌گیریم.
- هر بار که تابع را صدا می‌زنیم، یک نام جدید می‌دهیم.

## مرتب‌کردن منو با توابع
حالا منوی درس قبلی را کمی تمیزتر می‌کنیم:

```bash
#!/bin/bash

show_date() {
  date
}

show_dir() {
  pwd
}

list_files() {
  ls
}

show_menu() {
  echo "==== Simple Menu ===="
  echo "1) Show current date"
  echo "2) Show current directory"
  echo "3) List files"
  echo "4) Exit"
}

while true
do
  show_menu
  read -p "Choose an option [1-4]: " CHOICE

  case "$CHOICE" in
    1) show_date ;;
    2) show_dir ;;
    3) list_files ;;
    4)
       echo "Exiting... Bye!"
       break
       ;;
    *)
       echo "Invalid option, please try again."
       ;;
  esac

  echo ""
done
```

در این نسخه:
- هر کار اصلی (نمایش تاریخ، دایرکتوری فعلی، لیست فایل‌ها) در یک تابع جداگانه است.
- تابع `show_menu` تنها مسئول چاپ منو است.
- حلقهٔ اصلی تمیزتر و خواناتر شده است.

## نکات و عادت‌های خوب
- برای اسکریپت‌های طولانی، توابع را معمولاً در ابتدای فایل تعریف می‌کنند و سپس «بخش اصلی برنامه» (main) را پایین می‌نویسند.
- نام توابع را واضح انتخاب کنید؛ مثلا `backup_project`, `setup_env`, `clean_logs`.
- اگر تابع نیاز به ورودی دارد، آرگومان‌ها را به‌صورت منظم (`$1`, `$2`, ...) در ابتدای تابع بخوانید و در صورت نیاز روی آن‌ها بررسی (validation) انجام دهید.

## تمرین کوتاه
- منوی درس قبل را طوری بازنویسی کنید که:
  - برای هر گزینه یک تابع مشخص داشته باشد (مثلا `show_disk_usage`, `show_log_tail`).
  - یک تابع `pause` تعریف کنید که بعد از هر عملیات، با `read -p "Press Enter to continue..."` منتظر Enter بماند.
- اسکریپتی بنویسید که:
  - تابعی به نام `greet_user` داشته باشد؛ این تابع اگر آرگومان داشت از آن به‌عنوان نام استفاده کند، و اگر نه، با `read` از کاربر نام را بپرسد.
  - سپس پیام `"Hello NAME!"` را چاپ کند.

با این درس، پایه‌های اصلی اسکریپت‌نویسی Bash را در حد مبتدی یاد گرفته‌اید: متغیر، ورودی، شرط، حلقه، منو و تابع. در فصل‌های بعدی می‌توانیم سراغ مباحث پیشرفته‌تر مثل مدیریت خطا، کار با فایل‌های تنظیمات و ابزارهای قدرتمندتر برویم.

