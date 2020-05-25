
comment !
	5/20/2020
	Create and manipulate an array

	Write a complete program that:
    1. Prompt the user to enter 10 numbers.
    2. save those numbers in a 32-bit integer array.
    3. Print the array with the same order it was entered.
    3. Calculate the sum of the numbers and display it.
    4. Calculate the mean of the array and display it.
    5. Rotate the members in the array forward one position for
       9 times. so the last rotation will display the array in reversed order.
    6. Print the array after each rotation.
       check the sample run.
!

INCLUDE Irvine32.inc

.data
intArr dword 10 dup (?)
instruction byte "Please enter 10 integers", 0
prompt byte "enter a number: ", 0
labelOriginal byte "This is the original array: ", 0
space byte " ", 0
sumString byte "The sum is: ", 0
meanString byte "The Mean is: ", 0
index dword ?
index2 dword ?
rotationStr byte "This is a rotation: ", 0


.code
main PROC

	;;; OUTPUT INSTRUCTIONS ;;;
	mov edx, offset instruction
	call writeString
	call crlf

	;;; READ 10 NUMBERS FROM USER ;;;
	sub ebx, ebx
	mov edx, offset prompt
	call crlf
	mov ecx, lengthof intArr
	L1:
		call writeString
		call readDec
		call crlf
		mov esi, offset intArr
		mov [esi + ebx], eax
		add ebx, 4
	loop L1

	;;; OUTPUT ORIGINAL STRING AND CALCULATE SUM ;;;
	sub ebx, ebx
	mov ecx, lengthof intArr
	mov edx, offset labelOriginal
	call writeString
	sub edx, edx
	L2:
		;;; output string ;;;
		mov eax, [esi + ebx]
		call writeDec

		;;; calculating sum into edx ;;; 
		add edx, eax					
		add ebx, type intArr
		mov eax, ' '
		call writeChar
	loop L2
	call crlf
	
	;;; OUTPUT SUM ;;;
 	mov eax, edx
	mov edx, offset sumString
	call writeString
	call writeDec
	call crlf

	;;; CALCULATE AND OUTPUT MEAN ;;;
	mov ebx, lengthof intArr
	sub edx, edx
	div ebx							; calculating average into eax
	mov ebx, edx
	mov edx, offset meanString
	call writeString
	call writeDec
	mov eax, ' '
	call writeChar
	mov eax, ebx
	call writeDec
	mov eax, '/'
	call writeChar
	mov eax, lengthof intArr
	call writeDec
	call crlf

	;;; ROTATE THE ARRAY EACH LOOP L3 ;;;
	mov ecx, lengthof intArr
	dec ecx
	mov index, lengthof intArr			; index for counter of L4
	dec index
	L3:
		add esi, sizeOf intArr
		sub esi, type intArr
		mov index2, ecx				; L3 loop in index2 var
		mov ecx, index

		;;; ONE ROTATION L4 ;;;
		L4:
			mov eax, [esi]
			mov ebx, [esi - type intArr]
			xchg eax, ebx
			mov [esi], eax
			mov [esi - type intArr], ebx
			sub esi, type intArr
		loop L4
		dec index
		mov esi, offset intArr
		sub ebx, ebx
		mov ecx, lengthof intArr

		;;; OUTPUT ROTATION L5 ;;;
		mov edx, offset rotationStr
		call writeString
		L5:
			mov eax, [esi + ebx]
			call writeDec
			mov eax, ' '
			call writeChar
			add ebx, type intArr
		loop L5
		call crlf
		mov ecx, index2
	loop L3
	call crlf

exit
main ENDP
END main


comment !

Please enter 10 integers

enter a number: 2

enter a number: 3

enter a number: 4

enter a number: 5

enter a number: 6

enter a number: 7

enter a number: 8

enter a number: 9

enter a number: 0

enter a number: 10

This is the original array: 2 3 4 5 6 7 8 9 0 10
The sum is: 54
The Mean is: 5 4/10
This is a rotation: 10 2 3 4 5 6 7 8 9 0
This is a rotation: 10 0 2 3 4 5 6 7 8 9
This is a rotation: 10 0 9 2 3 4 5 6 7 8
This is a rotation: 10 0 9 8 2 3 4 5 6 7
This is a rotation: 10 0 9 8 7 2 3 4 5 6
This is a rotation: 10 0 9 8 7 6 2 3 4 5
This is a rotation: 10 0 9 8 7 6 5 2 3 4
This is a rotation: 10 0 9 8 7 6 5 4 2 3
This is a rotation: 10 0 9 8 7 6 5 4 3 2


C:\Users\yusuf\Desktop\Project32_VS2019\Debug\Project.exe (process 19136) exited with code 0.
Press any key to close this window . . .

!

