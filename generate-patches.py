# move this file to rom directory

import time
import os

#Don't touch
baseDir = os.getcwd()

def prepare():
    if os.path.isdir("patchesauto") == False:
        print "No 'patchesauto' folder detected, creating one... (don't delete)"
        os.mkdir("patchesauto")

def patch():
    file = open(".repo/project.list", "r")
    for repo in file.xreadlines():
        os.system('clear')
        print("Creating Patches")
        print(repo)
        os.chdir(baseDir + '/' + repo[0:len(repo)-1])
        repo = repo.replace('/', '-')
        repo = baseDir + "/patchesauto/" + repo
        os.system("git add -A ; git diff --cached > %s.patch ; git reset" % repo[0:len(repo)-1])
        os.chdir(baseDir)
    file.close()

def clean():
    file = os.listdir("%s/patchesauto/" % baseDir)
    os.chdir(baseDir + "/patchesauto/")
    for patch in file:
        os.system('clear')
        print("Cleaning useless Patches")
        print(patch)
        patchfile = open(patch, 'r')
        if patchfile.read() == '':
            os.remove(patch)
        patchfile.close()

if __name__ == "__main__":
    prepare()
    patch()
    clean()
    os.system('clear')
    print("Done!")
