# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/13 17:59:48 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/15 13:42:52 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a
FLAGS		=	-Wall -Werror -Wextra
MAIN		=	main.c
COMP		=	nasm -felf64 -o
LINK		=	gcc


SRCS			:=	ft_strlen.s		ft_strcpy.s		ft_strcmp.s		ft_write.s		ft_read.s		ft_strdup.s
OBJS			:= $(SRCS:.s=.o)

.PHONY: all, re, clean, fclean

all: $(NAME)

$(NAME): $(OBJS)
	@echo $?
	@ar rc  $@ $?
	@ranlib $@
	@echo "Done!"

%.o: %.s
	@$(COMP) $@ $<

clean:
	@/bin/rm -f $(OBJS)

fclean: clean
	@/bin/rm -f $(NAME)

re: fclean all

main: $(NAME) $(MAIN)
	@echo "ready"
	@$(LINK) $(MAIN) $(NAME) -no-pie