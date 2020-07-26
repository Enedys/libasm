# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/13 19:51:39 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/13 20:35:52 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_strcpy
			section .text
ft_strcpy:	xor rax, rax
.lp:		cmp byte [rsi + rax], 0
			jz  .exit
			mov  dl, [rsi + rax]
			mov  [rdi + rax], dl
			inc rax
			jmp .lp
.exit:		mov  byte [rdi + rax], 0
			mov  rax, rdi
			ret
