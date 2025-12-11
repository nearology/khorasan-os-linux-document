# پاسخ تمرین‌ها

در این صفحه، پاسخ‌های پیشنهادی و مختصر برای تمرین‌ها آورده شده‌اند. این صفحه در منوی اصلی قرار نگرفته است.

## تمرین ۱: دیدن سخت — پاسخ نهایی
فقط سه خط `ls` مطابق صورت سؤال:

```
ls -lth
ls -lth ../alireza
ls -lth ../../arshia/sub
```

## تمرین ۲: بازی بازی — فرمان‌ها

```
# حذف کامل پوشه arshia
rm -r -- bazi-bazi/arshia

# ساخت ali/reza و زنجیره s/a/l/i/b
mkdir -p bazi-bazi/ali/reza
mkdir -p bazi-bazi/s/a/l/i/b
```

## تمرین ۳: دفترچه تیمی — فرمان‌ها

```
# ساخت ساختار و فایل‌های روزانه
mkdir -p ~/notebook/daily ~/notebook/ideas
cd ~/notebook

touch daily/day-01.txt daily/day-02.txt daily/day-03.txt

# ایجاد و نوشتن سه ایده در brainstorm.txt
printf "Idea 1\nIdea 2\nIdea 3\n" > ideas/brainstorm.txt

# تجمیع ایده‌ها در یک فایل
cat ideas/brainstorm.txt >> ideas/all-ideas.txt

# تأیید: تعداد خطوط و سپس نمایش محتوا
wc -l ideas/all-ideas.txt && cat ideas/all-ideas.txt
```

## تمرین ۴: بایگانی پروژه — فرمان‌ها

```
# 1) نسخه پشتیبان src در backup/src-copy
mkdir -p ~/mini-project/backup
cp -r ~/mini-project/src ~/mini-project/backup/src-copy

# 2) تغییر نام و جابه‌جایی draft.txt به notes.txt در ریشه پروژه
mv ~/mini-project/tmp/draft.txt ~/mini-project/notes.txt

# 3) حذف old.log
rm ~/mini-project/tmp/old.log

# 4) حذف tmp در صورت خالی بودن
rmdir ~/mini-project/tmp
```

## تمرین ۵: شکار گزینهٔ درست — یک‌خطی نهایی

```
find ~/Downloads -type f -size +5M -exec ls -lh {} +
```
- `-type f`: فقط فایل‌ها
- `-size +5M`: بزرگ‌تر از ۵ مگابایت
- `-exec ls -lh {} +`: نمایش خروجی با اندازهٔ خوانا

## تمرین ۶: تقویم تیم پشتیبان — فرمان‌ها

```
# 1) تاریخ/زمان فعلی در قالب خواسته‌شده
date +"%Y-%m-%d %H:%M" > support-schedule.txt

# 2) ماه جاری و دو ماه بعد، با یک خط خالی بین هر ماه
for i in 0 1 2; do
  cal $(date -d "+$i month" +"%m %Y") >> support-schedule.txt
  echo >> support-schedule.txt
done

# 3) استخراج شمارهٔ هفته‌های ماه جاری و افزودن به انتهای فایل
ncal -w | awk 'NR>1 {print $NF}' | paste -sd ' ' - | \
  sed 's/^/Current month weeks: /' >> support-schedule.txt
```

## تمرین ۷: پایپ‌لاین خطاگیر — یک‌خطی پایدار

```
# فقط فایل‌های متنی .log پردازش می‌شوند؛ خطاها در pipeline-errors.log ذخیره می‌شود
grep -h "ERROR" ~/logs/service-*.log 2>> ~/logs/pipeline-errors.log \
  | tee -a ~/logs/errors-full.log \
  | tee /dev/tty \
  | wc -l > ~/logs/error-count.txt
```
- `grep -h "ERROR"`: فیلتر خطوط خطا از فایل‌های `service-*.log`
- `2>> pipeline-errors.log`: ثبت خطاهای احتمالی اجرای دستور
- `tee -a errors-full.log`: ذخیرهٔ کامل خطوط فیلترشده (ضمیمه)
- `tee /dev/tty`: نمایش همزمان در صفحه
- `wc -l > error-count.txt`: شمارش کل خطاها و نوشتن در فایل

