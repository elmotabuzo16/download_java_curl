#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

### Shell script to download Oracle JDK / JRE / Java binaries from Oracle website using terminal / command / shell prompt using wget / curl.
### You can download all the binaries one-shot by just providing one BASE_URL.
### Script might be useful if you need Oracle JDK on Amazon EC2 env.
### Script is updated for every JDK release.

### Features:-
# 1. Resumes a broken / interrupted [previous] download, if any.
# 2. Renames the file to a proper name with including platform info.
# 3. Downloads the following from Oracle Website with one shell invocation.
#    a. Windows 64 and 32 bit;
#    b. Linux 64 and 32 bit;
#    c. API Docs;
#    d. You can add more to the list of downloads are per your requirement.

#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

## Latest JDK8 version is JDK8u161 released on 16th Jan, 2018.
BASE_URL_8=http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161

JDK_VERSION=`echo $BASE_URL_8 | rev | cut -d "/" -f1 | rev`

declare -a PLATFORMS=("-linux-x64.tar.gz")
# declare -a PLATFORMS=("-linux-x64.tar.gz" "-windows-x64.exe" "-docs-all.zip")

for platform in "${PLATFORMS[@]}"
do
    #wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL_8}${platform}"
    curl -C - -L -O -# -H "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL_8}${platform}"
done
