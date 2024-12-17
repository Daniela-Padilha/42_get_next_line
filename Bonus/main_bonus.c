#include <stdio.h>
#include "get_next_line_bonus.h"

int	main(void)
{
	int		fd1 = 1;
	int		fd2 = 1;
	int		fd3 = 1;
	char	*line1;
	char	*line2;
	char	*line3;

	fd1 = open("zeros.txt", O_RDONLY);
	if (fd1 < 0)
	{
		printf("Error: opening fd1 failed");
		return (1);
	}
	fd2 = open("letters.txt", O_RDONLY);
	if (fd2 < 0)
	{
		printf("Error: opening fd2 failed");
		close(fd1);
		return (1);
	}
	fd3 = open("numbers.txt", O_RDONLY);
	if (fd3 < 0)
	{
		printf("Error: opening fd3 failed");
		close(fd1);
		close(fd2);
		return (1);
	}
	while (fd1 > 0 || fd2 > 0 || fd3 > 0)
	{
		line1 = get_next_line(fd1);
		line2 = get_next_line(fd2);
		line3 = get_next_line(fd3);
		if (line1)
		{
			printf("File 1: %s", line1);
			free(line1);
		}
		if (line2)
		{
			printf("File 2: %s", line2);
			free(line2);
		}
		if (line3)
		{
			printf("File 3: %s", line3);
			free(line3);
		}
		if (!line1 && !line2 && !line3)
			break ;
	}
	close(fd1);
	close(fd2);
	close(fd3);
	return (0);
}
