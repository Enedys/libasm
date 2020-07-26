# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/14 14:42:06 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/15 13:43:08 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_write
			extern __errno_location
			section .text
ft_write:	mov rax, 1
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
