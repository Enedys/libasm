# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/14 15:19:52 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/14 16:13:38 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_read
			extern __errno_location
			section .text
ft_read:	xor rax, rax
			syscall
			cmp rax, 0
			jl  .error
			ret
.error:		push rax
			call __errno_location
			mov rdi, rax
			pop rax
			neg rax
			mov [rdi], rax
			mov rax, -1
			ret
