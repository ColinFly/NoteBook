## 个人常用

- 写入快捷方式

`alias startStuido="sh /opt/android-studio/bin/studio.sh"`

`alias startStuido="sh /opt/android-studio/bin/studio.sh" >> ~/.bashrc`
- 找到并替换

`find -name build.gradle | xargs sed -i s/21.1.2/24.3.4/g`

- 网络访问

`nautilus smb://200.200.200.240`


- 当前文件夹下所有文件中字符串的查找与替换

`grep -rl 'UdpCore_v1.0' ./ |xargs sed -i 's/UdpCore_v1.0/UdpCore_v1.2/g'`
