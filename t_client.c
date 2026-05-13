#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#define SOCK "/data/data/com.termux/files/home/t-lang/tbc_server.sock"
int main(int argc,char**argv){
    if(argc<2) return 1;
    int s=socket(AF_UNIX,SOCK_STREAM,0);
    struct sockaddr_un a={0};
    a.sun_family=AF_UNIX;
    strcpy(a.sun_path,SOCK);
    connect(s,(struct sockaddr*)&a,sizeof(a));
    write(s,argv[1],strlen(argv[1]));
    char buf[4096]; int n;
    while((n=read(s,buf,sizeof(buf)))>0) write(1,buf,n);
    close(s);
    return 0;
}
