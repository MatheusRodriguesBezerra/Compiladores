module MIPS where

import IR
import Parser
import AST

toMips :: Instr -> [String]
toMips (MOVE x y)
    | head y == '$' = ["\tmove $" ++ x ++ ", " ++ y]
    | otherwise = ["\tmove $" ++ x ++ ", $" ++ y]
toMips (MOVEI x intY) = ["\tli $" ++ x ++ ", " ++ (show intY)]
toMips (OP Add x y z) = ["\tadd $" ++ x ++ ", $" ++ y ++ ", $" ++ z]
toMips (OP Minus x y z) = ["\tsub $" ++ x ++ ", $" ++ y ++ ", $" ++ z]
toMips (OP Mult x y z) = ["\tmul $" ++ x ++ ", $" ++ y ++ ", $" ++ z]
toMips (OP Div x y z) = ["\tdiv $" ++ y ++ " , $" ++ z, "\tmflo $" ++ x]
toMips (OP Mod x y z) = ["\tdiv $" ++ y ++ " , $" ++ z, "\tmfhi $" ++ x]
toMips (OPI Add x y intZ) = ["\taddi $" ++ x ++ ", $" ++ y ++ ", $" ++ (show intZ)]
toMips (OPI Minus x y intZ) = ["\tsub $" ++ x ++ ", $" ++ y ++ ", $" ++ (show intZ)]
toMips (OPI Mult x y intZ) = ["\tmul $" ++ x ++ ", $" ++ y ++ ", $" ++ (show intZ)]
toMips (OPI Div x y intZ) = ["\tdiv $" ++ y ++ " , $" ++ (show intZ), "\tmflo $" ++ x]
toMips (OPI Mod x y intZ) = ["\tdiv $" ++ y ++ " , $" ++ (show intZ), "\tmfhi $" ++ x]
toMips (LABEL x) = [x ++ ": "]
toMips (JUMP x) = ["\tj " ++ x]
toMips (COND x EqualsThan y lt lf) = ["\tbne $" ++ x ++ " , $" ++ y ++ " , " ++ lt, "\tj " ++ lf]
toMips (COND x DiffThan y lt lf) = ["\tbeq $" ++ x ++ " , $" ++ y ++ " , " ++ lf, "\tj " ++ lt]
toMips (COND x LowerThan y lt lf) = ["\tblt $" ++ x ++ " , $" ++ y ++ " , " ++ lt, "\tj " ++ lf]
toMips (COND x LowerEqualsThan y lt lf) = ["\tbgt $" ++ x ++ " , $" ++ y ++ " , " ++ lf, "\tj " ++ lt]
toMips (COND x GreaterThan y lt lf) = ["\tbgt $" ++ x ++ " , $" ++ y ++ " , " ++ lt, "\tj " ++ lf]
toMips (COND x GreaterEqualsThan y lt lf) = ["\tblt $" ++ x ++ " , $" ++ y ++ " , " ++ lf, "\tj " ++ lt]
toMips (CALL t1 name args) = callFun name args 0 ++ toMips (MOVE t1 "$v0")
toMips (RETURN x) = ["\tmove $v0, $" ++ x, "\tmove $sp, $fp", "\tlw $ra, -8($sp)", "\tlw $fp, -4($sp)", "\tjr $ra"]
toMips (LABELFUN x size) = [x ++ ": ", "\tsw $fp, -4($sp)", "\tsw $ra, -8($sp)", "\tmove $fp, $sp", "\taddiu $sp, $sp, " ++ show (size * (-4))]


callFun :: Label -> [Temp] -> Int -> [String]
callFun name [] offset = ["\taddiu $sp, $sp, " ++ (show offset), "\tjal " ++ name, "\taddiu $sp, $sp, " ++ show (offset * (-1))]
callFun name args oldOffset = ["\tsw " ++ "$" ++ (lastItem args) ++ ", " ++ (show (oldOffset - 4)) ++ "($sp)"] ++ callFun name (listWithOutLastItem args) (oldOffset - 4)


start :: [Instr] -> [String]
start [] = []
start (x:xs) = toMips x ++ start xs


begin :: [Instr] -> [String]
begin instr = [".text", "j main"] ++ start instr ++ printInt ++ scanInt


printInt :: [String]
printInt = ["print_int:", "\tli $v0, 1", "\tlw $a0, 0($sp)", "\tsyscall", "\tjr $ra"]


scanInt :: [String]
scanInt = ["scan_int:", "\tli $v0, 5", "\tsyscall", "\tjr $ra"]


listWithOutLastItem :: [a] -> [a]
listWithOutLastItem [_] = []
listWithOutLastItem (x:xs) = x : listWithOutLastItem xs


lastItem :: [a] -> a
lastItem [x] = x
lastItem (_:xs) = lastItem xs