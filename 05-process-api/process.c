#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
  printf("hello world (pid:%d)\n", (int)getpid());
  int rc = fork();
  if (rc < 0)
  {
    // fork failed
    fprintf(stderr, "fork failed\n");
    exit(1);
  }
  else if (rc == 0)
  {
    // child process
    printf("hello, I am child (pid: %d)\n", (int)getpid());
    char *myargs[3];
    myargs[0] = strdup("wc");
    myargs[1] = strdup("process.c");
    myargs[2] = NULL;
    execvp(myargs[0], myargs);
  }
  else
  {
    // parent process
    // wait for the forked child process to complete
    int rc_wait = wait(NULL);
    printf("hello, I am parent of %d (pid:%d)\n", rc, (int)getpid());
  }
  return 0;
}