#!/bin/bash

# 把 org-mode 导出成 markdown 时 输出的转成 markdown 通用字符
# 1. {{< highlight 7ang "hl_lines=8" >}} 转成 ```
# 2. {{< /highlight >}} 转成 ```
# 3. {{< figure src=" 转成 ![figure](
# 4. 把含有 >}} 的行中的 .png 及后的内容 替换成 .png)
# 5. 把含有 >}} 的行中的 .jpg 及后的内容 替换成 .jpg)
# 6. 把 ```text 替换成 ```
# 7. 把 ```dockerfile 替换成 ```docker


grep '{{< highlight 7ang "hl_lines=8" >}}' -rn ./
grep '{{< \/highlight >}}' -rn ./
grep '{{< highlight 7ang "hl_lines=8" >}}' -rl ./ | xargs sed -i 's/{{< highlight 7ang "hl_lines=8" >}}/```/g'
grep '{{< \/highlight >}}' -rl ./ | xargs sed -i 's/{{< \/highlight >}}/```/g'
grep '{{< highlight 7ang "hl_lines=8" >}}' -rn ./
grep '{{< \/highlight >}}' -rn ./


# {{< figure src="http://cdn.sinacloud.net/vnpydoc/ubuntuinstall/21212setting.png" caption="Figure 3: 设置" >}}
# {{< figure src="https://res.cloudinary.com/dmtixvmgt/image/upload/v1547888197/swift-upload-file-only-storage-three-hardware%5Fktkven.png" >}}

grep '{{< figure src="' -rn ./
grep '>}}' -rn ./
grep '{{< figure src="' -rl ./ | xargs sed -i 's/{{< figure src="/\![figure](/g'
grep '>}}' -rl ./ | xargs sed -i 's/.png.*/.png)/g'
grep '>}}' -rl ./ | xargs sed -i 's/.jpg.*/.jpg)/g'
grep '{{< figure src="' -rn ./
grep '>}}' -rn ./


grep '```text' -rl ./ | xargs sed -i 's/```text/```/g'
grep '```text' -rn ./
grep '```dockerfile' -rl ./ | xargs sed -i 's/```dockerfile/```docker/g'
grep '```dockerfile' -rn ./
grep '```mysql' -rl ./ | xargs sed -i 's/```mysql/```/g'
grep '```mysql' -rn ./
grep '```golang' -rl ./ | xargs sed -i 's/```golang/```/g'
grep '```golang' -rn ./
grep '```emacs-lisp' -rl ./ | xargs sed -i 's/```emacs-lisp/```/g'
grep '```emacs-lisp' -rn ./
grep '```Emacs-lisp' -rl ./ | xargs sed -i 's/```Emacs-lisp/```/g'
grep '```Emacs-lisp' -rn ./
grep '```bash' -rl ./ | xargs sed -i 's/```bash/```/g'
grep '```bash' -rn ./
grep '```BASH' -rl ./ | xargs sed -i 's/```BASH/```/g'
grep '```BASH' -rn ./
grep '```Bash' -rl ./ | xargs sed -i 's/```Bash/```/g'
grep '```Bash' -rn ./
grep '```elisp' -rl ./ | xargs sed -i 's/```elisp/```/g'
grep '```elisp' -rn ./
