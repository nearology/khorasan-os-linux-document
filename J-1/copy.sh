SOURCE="./hard-view"

for u in stu1009061173 stu1009061300 stu1022916013 stu1023061235 stu1023061257 stu1023061304 stu1023061337 stu1023061359 stu1023061622 stu1023061906 stu1032916021 stu1032916043 stu2022916034 stu9823061117; do
  sudo cp -a "$SOURCE" "/home/$u/" && \
  sudo chown -R "$u:students" "/home/$u/$(basename "$SOURCE")" && \
  sudo chmod -R 770 "/home/$u/$(basename "$SOURCE")" && \
  sudo chmod g+s "/home/$u/$(basename "$SOURCE")"
done
