# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/13 22:25:40 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/13 22:25:43 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_strcmp
			section .text

ft_strcmp:	xor rax, rax
			xor rdx, rdx
			xor rbx, rbx
.lp:		cmp byte [rdi + rax], 0
			jz  .exit
			cmp  byte [rsi + rax], 0
			jz  .exit
			mov dl, [rdi + rax]
			cmp dl, [rsi + rax]
			jne .exit
			inc rax
			jmp .lp

.exit:		mov dl, [rsi + rax]
			mov bl, [rdi + rax]
			sub rbx, rdx
			mov rax, rbx
			ret 
