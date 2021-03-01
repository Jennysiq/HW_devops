#  1) Ваша задача - создать проект с кодом, добавить туда файлы со след. расширениями:

 * all files with exe extension
 * all files with o extension
 * all files with jar extension
 * the whole libraries directory
### RESULT :
***
 * Create new files with .exe, .o, and .jar extension
 * nano .gitignore *.exe *.o *.jar
 * git status
 * git add .
 * git commit -m "commit file"
 # 2) Изменить регистр букв в файле
    Вы закоммитили File.txt, но осознали, что он должен быть file.txt
    Изменить это.
### RESULT :
***
 * touch File.txt    #create file.txt
 * git status
 * git add File.txt   #add file in staging area
 * git commit -m "My first file"
 * git push

 * git mv file.txt File.txt    #change filename
# 3) Найти коммит, который был утерян.
 Вы создали коммит с важным куском работы. Затем решили пофиксать что-то в последнем коммитет и сделали amend. 
 Далее вы осознали, что закоммитили не те изменения и нужно вернуться к первой версии коммита, который вы заамендили.
 Однако в истории нет предыдущей версии - вы отредактировали коммит, используя git commit --amend
 Ваша цель - найти первую версию фикса в репозитории.
***
### RESULT:
***
 * touch task3.txt
 * git add .
 * git commit -m "1st commit"
 * git commit --amend            #change last commit "1st commit => 2nd commit"
 * git reflog                    #check in reflog 1st commit
 * git reset --soft HEAD@{2}     #HEAD@{2} change on that "1st commit"
