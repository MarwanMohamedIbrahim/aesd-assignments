#include <syslog.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[])
{
    openlog(NULL,0, LOG_USER);
    if(argc != 3)
    {
        syslog(LOG_ERR, "Error: Arguments above were not specified! [First argument must include full path to a file (including filename) and second argument is the text string which will be written within this file] %d\n", argc);
        exit(1);
    }
    char* writefile = argv[1];
    char* writestr = argv[2];
    FILE *fp = fopen(writefile,"w");
    if(fp == NULL)
    {
        syslog(LOG_ERR, "%s\n", strerror(errno));
        exit(1);
    }
    syslog(LOG_DEBUG, "Writing %s to %s\n", writestr, writefile);
    fputs(writestr,fp);
    fclose(fp);

    return 0;
}