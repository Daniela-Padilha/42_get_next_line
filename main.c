#include <stdio.h>
#include "get_next_line.h"

int	main(void)
{
	int		fd;
	char	*a;

	fd = open("test.txt", O_RDONLY);
	if (fd < 0)
	{
		printf("Error: opening file failed");
		return (1);
	}
	a = get_next_line(fd);
	while (a != NULL)
	{
		printf("%s", a);
		free(a);
		a = get_next_line(fd);
	}
	close(fd);
	return (0);
}