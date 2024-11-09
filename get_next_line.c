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

char	*get_next_line(int fd)
{
	char	*buffer;
	int		line_len;

	line_len = 0;
	while ( != '\n')
		n++;
	buffer = (char *)malloc(sizeof(char) * line_len);
	read(fd, buffer, line_len);

	return (buffer);
	free (buffer);
}