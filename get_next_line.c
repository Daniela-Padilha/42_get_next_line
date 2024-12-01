/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ddo-carm <ddo-carm@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/08 23:51:34 by ddo-carm          #+#    #+#             */
/*   Updated: 2024/11/08 23:51:34 by ddo-carm         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

//info    --> Returns a line read from the fd
//fd      --> File descriptor
//return  --> Success (line read)
//return  --> Faillure (NULL)

char	*ft_join_free(char *text, char *buffer)
{
	char	*new_text;

	new_text = ft_strjoin(text, buffer);
	free(text);
	return (new_text);
}

char	*ft_read_file(int fd, char	*text)
{
	char	*buffer;
	int		bytes_read;

	if (!text)
		text = ft_calloc(1, 1);
	buffer = ft_calloc(BUFFER_SIZE + 1, sizeof(char));
	bytes_read = 1;
	while (bytes_read > 0)
	{
		bytes_read = read(fd, buffer, BUFFER_SIZE * sizeof(char));
		if (bytes_read == -1)
		{
			free(buffer);
			return (NULL);
		}
		buffer[bytes_read] = '\0';
		text = ft_join_free(text, buffer);
		if (ft_strchr(buffer, '\n'))
			break;
	}
	free(buffer);
	return (text);
}

char	*ft_extract_line(char *buffer)
{
	char	*line;
	int		len;
	int		i;

	i = 0;
	if (!buffer[i])
		return (NULL);
	len = ft_strlen(buffer, '\n');
	line = ft_calloc(len + 2, sizeof(char));
	while (i < len)
	{
		line[i] = buffer [i];
		i++;
	}
	if (buffer[i] && buffer[i] == '\n')
		line[i++] = '\n';
	return (line);
}
char *ft_next_line(char *buffer)
{
	char	*line;
	int		i;
	int		j;

	i = ft_strlen(buffer, '\n');
	if (!buffer[i])
	{
		free(buffer);
		return (NULL);
	}
	line = ft_calloc((ft_strlen(buffer, '\0') - i + 1), sizeof(char));
	i += 1;
	j = 0;
	while (buffer[i])
	{
		line[j] = buffer[i];
		j++;
		i++;
	}
	free(buffer);
	return (line);
}

char	*get_next_line(int fd)
{
	static char	*buffer;
	char		*line;

	if (fd < 0 || BUFFER_SIZE <= 0 || read(fd, 0, 0) < 0)
		return (NULL);
	buffer = ft_read_file(fd, buffer);
	if (!buffer)
		return (NULL);
	line = ft_extract_line(buffer);
	buffer = ft_next_line(buffer);
	return (line);
}

#include <stdio.h>
int	main(void)
{
	int		fd;
	char	*a;

	fd = open("test.txt", O_RDONLY);
	a = get_next_line(fd);
	while (a != NULL)
	{
		printf("%s", a);
		free(a);
		a = get_next_line(fd);
	}
	// printf("%s\n", get_next_line(fd));
	close(fd);
	return (0);
}
