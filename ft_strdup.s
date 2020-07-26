# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/14 16:44:12 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/14 16:44:53 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_strdup
			extern malloc
			section .text
ft_strdup:	xor rcx, rcx
.len:		cmp byte [rdi + rcx], 0
			jz  .alloc
			inc  rcx
			jmp  .len
.alloc:		push rdi
			inc  rcx
			mov  rdi, rcx
			call malloc
			pop  rsi
			cmp  rax, 0
			jz	 .error
			mov  rdi, rax
			xor  rax, rax
.lp:		cmp byte [rsi + rax], 0
			jz  .exit
			mov  dl, [rsi + rax]
			mov  [rdi + rax], dl
			inc rax
			jmp .lp
.exit:		mov  byte [rdi + rax], 0
			mov  rax, rdi
			ret
.error:		ret
