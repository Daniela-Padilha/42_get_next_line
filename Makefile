# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ddo-carm <ddo-carm@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/17 21:51:56 by ddo-carm          #+#    #+#              #
#    Updated: 2024/12/17 23:48:58 by ddo-carm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#		   ________________________________________________        
#  _______|                                               |_______
# \       |                 NAMES & PATHS                 |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

NAME = libftgnl.a
BONUS_NAME = libftgnlbonus.a
TEST_NAME = gnl_test.a
BONUS_TEST = gnl_bonus_test.a
SRCS_D = GNL
BONUS_SRCS_D = Bonus
HEADER = $(SRCS_D)/get_next_line.h
BONUS_HEADER = $(BONUS_SRCS_D)/get_next_line_bonus.h

#source files
SRC = $(SRCS_D)/get_next_line.c $(SRCS_D)/get_next_line_utils.c 

BONUS_SRC = $(BONUS_SRCS_D)/get_next_line_bonus.c $(BONUS_SRCS_D)/get_next_line_utils_bonus.c

MAIN = $(SRCS_D)/main.c
BONUS_MAIN = $(BONUS_SRCS_D)/main_bonus.c

#object files
OBJ = $(SRC:.c=.o)
BONUS_OBJ = $(BONUS_SRC:.c=.o)

#		   ________________________________________________
#  _______|                                               |_______
# \       |                FLAGS & COMMANDS               |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

CC = cc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
AR = ar rcs

#          ________________________________________________
# ________|                                               |_______
# \       |                    LIB RULES                  |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

all: $(NAME)

$(NAME): $(OBJ)
	@$(AR) $(NAME) $(OBJ)
	@echo "$(BGRN)✨Compilation completed✨"

$(SRCS_D)%.o: $(SRCS_D)%.c $(HEADER)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(BMAG)Compiling..."

#          ________________________________________________
# ________|                                               |_______
# \       |                  BONUS RULES                  |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

bonus: $(BONUS_NAME)

$(BONUS_NAME): $(BONUS_OBJ)
	@$(AR) $(BONUS_NAME) $(BONUS_OBJ)
	@echo "$(BGRN)✨Compilation completed✨"

$(BONUS_SRCS_D)%.o: $(BONUS_SRCS_D)%.c $(BONUS_HEADER)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(BMAG)Compiling..."


#          ________________________________________________
# ________|                                               |_______
# \       |                   TEST RULES                  |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

#TESTING
test: all
	@$(CC) $(CFLAGS) $(MAIN) $(SRC) -o $(TEST_NAME)
	@echo "$(BGRN)$(TEST_NAME) created successfully"
	@./$(TEST_NAME)
	@echo "$(BGRN)✨Test completed✨"

bonustest: bonus
	@$(CC) $(CFLAGS) $(BONUS_MAIN) $(BONUS_SRC) -o $(BONUS_TEST)
	@echo "$(BGRN)$(BONUS_TEST) created successfully"
	@./$(BONUS_TEST)
	@echo "$(BGRN)✨Test completed✨"

cleantest:
	@$(RM) $(TEST_NAME) $(BONUS_TEST)
	@echo "$(BMAG)✨All tests were removed✨"

retest: cleantest test bonustest
	@echo "$(BMAG)✨Retest was $(BGRN)successfull✨"

#          ________________________________________________
# ________|                                               |_______
# \       |                  CLEAN RULES                  |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

#remove .o
clean:
	@$(RM) $(OBJ) $(BONUS_OBJ)
	@echo "$(BMAG)✨Objects removed $(BGRN)successfully✨"

#clean and remove
fclean: clean cleantest
	@$(RM) $(NAME) $(BONUS_NAME)
	@echo "$(BMAG)✨Program removed $(BGRN)successfully✨"

#remake
re: fclean all bonus
	@echo "$(BMAG)✨Re-compile was $(BGRN)successfull✨"

#          ________________________________________________
# ________|                                               |_______
# \       |                  HELP RULES                   |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

#help
help:
	@echo "✳$(BMAG) make  $(BWHI)    -> $(BMAG)compiles the lib"
	@echo "✳$(BMAG) bonus  $(BWHI)   -> $(BMAG)compiles the lib with bonus"

	@echo "$(BWHI)✳$(BMAG) test      $(BWHI)-> $(BMAG)tests mandatory files"
	@echo "$(BWHI)✳$(BMAG) bonustest $(BWHI)-> $(BMAG)tests bonus files"

	@echo "$(BWHI)✳$(BMAG) clean    $(BWHI) -> $(BMAG)removes all objects"
	@echo "$(BWHI)✳$(BMAG) fclean    $(BWHI)-> $(BMAG)removes all objects plus the program"
	@echo "$(BWHI)✳$(BMAG) re        $(BWHI)-> $(BMAG)removes all objects plus the program and recompiles the lib"
	@echo "$(BWHI)✳$(BMAG) cleantest $(BWHI)-> $(BMAG)removes all test files"
	@echo "$(BWHI)✳$(BMAG) retest    $(BWHI)-> $(BMAG)removes test files and recompiles"

#Phony targets to avoid clashes
.PHONY: all bonus clean fclean re help test cleantest retest bonustest

#          ________________________________________________
# ________|                                               |_______
# \       |                    COLORS                     |      /
#  \      |                                               |     /
#  /      |_______________________________________________|     \ 
# /__________)                                        (__________\ 

#color list for foreground
#bash -c 'for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done'

BLA		:= $(echo "u001b[30m")
RED		:= $(echo "\u001b[31m")
GRN		:= $(echo "\u001b[32m")
YEL		:= $(echo "\u001b[33m")
BLU		:= $(echo "\u001b[34m")
MAG		:= $(echo "\u001b[35m")
CYA		:= $(echo "\u001b[36m")
WHI		:= $(echo "\u001b[37m")
GRE		:= $(echo "\u001b[0m")
BBLA	:= $(echo "\u001b[30;1m")
BRED 	:= $(echo "\u001b[31;1m")
BGRN	:= $(echo "\u001b[32;1m")
BYEL	:= $(echo "\u001b[33;1m")
BBLU	:= $(echo "\u001b[34;1m")
BMAG	:= $(echo "\u001b[35;1m")
BCYA	:= $(echo "\u001b[36;1m")
BWHI	:= $(echo "\u001b[37;1m")
Reset	:= $(echo "\u001b[0m")
