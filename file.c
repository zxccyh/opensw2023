#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
    int fd;
    fd = open("nonexitfile.txt",O_RDONLY);
    if(fd == -1) {
        printf("errno = %d \n",errno);
        perror("main");
    }
    fd=open("/", O_WRONLY);
    if(fd == -1) {
        printf("errno = %d \n", errno);
        perror("main");
    }


    return 0;
}