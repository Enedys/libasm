#include <stdio.h>
#include "libasm.h"
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <bsd/string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <stdlib.h>

void	strlen_test(const char *s)
{
	int	real;
	int	my;
	
	my = ft_strlen(s);
	real = strlen(s);
	printf("s: %s\nlibc: %d, my_res: %d, %s\n", s, real, my, (real == my) ? "\033[32mOk\e[30m" : "\033[31mError\e[30m");
	printf("__________________________________________________________________________________________________________________________________\n");
}

void	strcmp_test(const char *s1, const char *s2)
{
	int	real;
	int	my;
	
	my = ft_strcmp(s1, s2);
	real = strcmp(s1, s2);
	printf("s1: %s\ns2: %s\nlibc: %d, my_res: %d, %s\n", s1, s2, real, my, (real == my) ? "\033[32mOk\e[30m" : "\033[31mError\e[30m");
	printf("__________________________________________________________________________________________________________________________________\n");
}

void	strcpy_test(const char *src)
{
	char	*dest;

	dest = (char *)malloc(strlen(src) + 1);
	dest = ft_strcpy(dest, src);
	printf("dest: %s\nsrc: %s\nresult: %s\n", dest, src, (strcmp(dest, src) == 0) ? "\033[32mOk\e[30m" : "\033[31mError\e[30m");
	free(dest);
	printf("__________________________________________________________________________________________________________________________________\n");
}

void	strdup_test(const char *src)
{
	char *dest;

	dest = ft_strdup(src);
	printf("dest: %s adress: %p\nsrc: %s adress: %p\nresult: %s\n", dest, dest, src, src, (strcmp(dest, src) == 0) ? "\033[32mOk\e[30m" : "\033[31mError\e[30m");
	free(dest);
	printf("__________________________________________________________________________________________________________________________________\n");
}

void	write_test(int fd, const char *src, size_t size)
{
	int	res;
	int	res1;

	errno = 0;
	res = ft_write(fd, src, size);
	perror("\nlibasm errno: ");
	write(fd, "\n", 1);
	errno = 0;
	res1 = write(fd, src, size);
	perror("\nstd errno: ");
	printf("libasm res: %d, std res: %d\n", res, res1);
	write(fd, "\n", 2);
	printf("__________________________________________________________________________________________________________________________________\n");
}

void	read_test(int fd)
{
	int	res;
	int	res1;
	char	buf[100];

	memset(buf, 0, 100);
	errno = 0;
	res = read(fd, buf, 99);
	printf("res: %d, libasm: %s\n", res, buf);
	perror("libasm error: ");

	memset(buf, 0, 100);
	errno = 0;
	res1 = read(fd, buf, 99);
	printf("res: %d, std: %s\n", res1, buf);
	perror("std error: ");
	printf("__________________________________________________________________________________________________________________________________\n");
}

int		main(void)
{
	int	fd;

	printf("\e[30m=======_ STRLEN TEST: _=======\n");
	strlen_test("");
	strlen_test("Hello_!");
	strlen_test("long long long long long long long long long long long long long long long long long long long long");
	strlen_test("long\0long");

	printf("=======_ STRCMP TEST: _=======\n");
	strcmp_test("hEllo", "hElLo");
	strcmp_test("hEllo", "hEll");
	strcmp_test("hEllo", "dEllo");
	strcmp_test("hEllo", "");
	strcmp_test("", "hEllo");
	strcmp_test("hEllo", "hEllo");
	strcmp_test("", "");

	printf("=======_ STRCPY TEST: _=======\n");
	strcpy_test("Hello");
	strcpy_test("\0void str");
	strcpy_test("s");
	strcpy_test("");
	strcpy_test("long long long long long long long long long long long long long long long long long long long long");
	
	printf("=======_ STRDUP TEST: _=======\n");
	strdup_test("");
	strdup_test("HellO PeEr");
	strdup_test("12345A54321");
	strdup_test("\t/s__:)\t");
	strdup_test("(**,)");
	strdup_test("long long long long long long long long long long long long long long long long long long long long");
	
	printf("=======_ WRITE TEST: _=======\n");
	fd = open("write_test.txt", O_RDWR | O_CREAT | O_APPEND, S_IREAD | S_IWRITE);
	write_test(1, "Hello\n", 4);
	write_test(1, "Hello\n", 6);
	write_test(1, "Hello\n", 0);
	write_test(1, "Hello\n", -1);
	write_test(1, "Hello\n", 10);
	write_test(-1, "Hello_amigos!", 4);
	write_test(fd, "Hello_amigos!", 4);
	write_test(fd, "Hello_amigos!", 11);
	write_test(fd, "Hello_amigos!", 13);
	write_test(fd, "Hello_amigos!", 20);
	write_test(fd, "Hello_amigos!", 0);
	write_test(fd, "Hello_amigos!", -1);
	close(fd);

	printf("=======_ READ TEST: _=======\n");
	read_test(-1);
	fd = open("read_test.txt", O_RDONLY);
	read_test(fd);
	read_test(1);
	read_test(1);
	return (0);
}