#!/bin/bash
echo enter operator
read op
echo  enter operands
read op1
read op2
if [ \( $op == '-' \) -o \( $op == '+' \) -o \( $op == '%' \) -o \( $op == '/' \) ];
 then
  value=`expr $op1 $op $op2`
 fi
echo values is $value
