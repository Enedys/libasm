# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Kwillum <daniilxod@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/13 18:16:38 by Kwillum           #+#    #+#              #
#    Updated: 2020/07/13 18:25:37 by Kwillum          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global ft_strlen
			section .text
ft_strlen: xor rax, rax
.lp:		cmp byte [rdi + rax], 0
			jz  .exit
			inc rax
			jmp .lp
.exit:		ret
