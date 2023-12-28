{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,630) ([0,0,0,49536,1,0,0,1536,7,0,0,0,0,0,0,24576,112,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,4096,0,28768,0,16384,0,0,0,0,256,0,0,512,0,0,0,0,8224,0,0,24576,2208,61465,511,0,0,0,0,0,0,0,0,0,0,0,28768,0,32768,128,0,0,33152,25634,65472,7,0,0,0,0,0,0,0,0,24576,2208,61465,511,0,1024,0,0,0,0,8,0,0,34304,0,0,0,32,0,0,0,7680,4296,63,0,0,2,2,0,0,0,0,0,24576,2080,28672,48,32768,8833,49252,2047,0,33286,0,775,0,2048,0,0,0,8192,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,8321,49154,193,0,0,8,0,0,0,32,0,0,8192,0,0,0,32768,0,0,0,1536,130,1792,3,0,16,0,0,0,0,0,0,0,0,0,0,0,8312,64587,0,0,2048,0,0,0,8288,8,12400,0,0,0,0,0,1536,2178,7936,31,6144,520,7168,12,24576,2080,28672,48,0,0,0,0,0,4096,0,0,0,36864,0,0,0,18304,50226,15,0,32768,0,0,0,1536,130,1792,3,6144,520,7168,12,24576,2080,28672,48,32768,8321,49152,193,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1536,130,1792,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,33152,32,49600,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,33248,61709,3,0,8288,8,12400,0,128,0,0,0,30720,17248,252,0,0,0,0,0,32768,12807,4036,0,0,55326,16144,0,0,8312,64583,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,12871,4036,0,0,51486,16144,0,0,0,8,0,0,2072,2,3100,0,0,0,0,0,0,0,0,0,30720,17188,252,0,0,0,0,0,32768,45575,4036,0,32768,8321,49152,193,0,35334,400,8191,0,10264,1602,32764,0,0,0,0,0,0,0,0,0,1536,130,1792,3,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33248,61709,3,0,0,0,0,0,0,0,0,0,1536,130,1792,3,57344,7297,1009,0,0,0,0,0,0,0,0,0,0,8312,64587,0,0,6168,2,31868,0,16384,0,0,0,33152,25634,65472,7,1536,134,7936,31,6144,16936,64518,127,0,0,0,0,0,51230,16144,0,0,0,0,0,0,4096,0,0,0,41056,6408,65520,1,0,0,0,0,1536,37002,65281,31,0,0,0,0,0,0,0,0,32768,8833,49252,2047,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Prog","ProgList","Function","Gdecl","Gdefn","FuncParams","ParamDecl","Stmt","Stmts","Simple","MultId","Element","lv","Tp","Exp","ExpList","Exps","BinOp","id","num","'+'","'-'","'/'","'*'","'++'","'--'","'('","')'","'{'","'}'","'['","']'","'!'","'&&'","'||'","','","';'","'if'","'else'","'%'","'while'","'for'","'='","'=='","'!='","'>'","'<'","'>='","'<='","'true'","'false'","'null'","'int'","'bool'","'return'","'break'","'continue'","'scan_int'","'print_int'","'string'","'char'","'void'","%eof"]
        bit_start = st * 66
        bit_end = (st + 1) * 66
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..65]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (56) = happyShift action_7
action_0 (57) = happyShift action_8
action_0 (63) = happyShift action_9
action_0 (64) = happyShift action_10
action_0 (65) = happyShift action_11
action_0 (4) = happyGoto action_12
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (17) = happyGoto action_6
action_0 _ = happyReduce_3

action_1 (56) = happyShift action_7
action_1 (57) = happyShift action_8
action_1 (63) = happyShift action_9
action_1 (64) = happyShift action_10
action_1 (65) = happyShift action_11
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (17) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (56) = happyShift action_7
action_3 (57) = happyShift action_8
action_3 (63) = happyShift action_9
action_3 (64) = happyShift action_10
action_3 (65) = happyShift action_11
action_3 (5) = happyGoto action_14
action_3 (6) = happyGoto action_3
action_3 (7) = happyGoto action_4
action_3 (8) = happyGoto action_5
action_3 (17) = happyGoto action_6
action_3 _ = happyReduce_3

action_4 _ = happyReduce_4

action_5 _ = happyReduce_5

action_6 (22) = happyShift action_13
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_42

action_8 _ = happyReduce_43

action_9 _ = happyReduce_44

action_10 _ = happyReduce_45

action_11 _ = happyReduce_46

action_12 (66) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (30) = happyShift action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_2

action_15 (31) = happyShift action_19
action_15 (56) = happyShift action_7
action_15 (57) = happyShift action_8
action_15 (63) = happyShift action_9
action_15 (64) = happyShift action_10
action_15 (65) = happyShift action_11
action_15 (9) = happyGoto action_16
action_15 (10) = happyGoto action_17
action_15 (17) = happyGoto action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (31) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (39) = happyShift action_23
action_17 _ = happyReduce_11

action_18 (22) = happyShift action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (32) = happyShift action_20
action_19 (40) = happyShift action_21
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (22) = happyShift action_34
action_20 (23) = happyShift action_35
action_20 (30) = happyShift action_36
action_20 (32) = happyShift action_37
action_20 (36) = happyShift action_38
action_20 (41) = happyShift action_39
action_20 (44) = happyShift action_40
action_20 (45) = happyShift action_41
action_20 (53) = happyShift action_42
action_20 (54) = happyShift action_43
action_20 (55) = happyShift action_44
action_20 (56) = happyShift action_7
action_20 (57) = happyShift action_8
action_20 (58) = happyShift action_45
action_20 (59) = happyShift action_46
action_20 (60) = happyShift action_47
action_20 (61) = happyShift action_48
action_20 (62) = happyShift action_49
action_20 (63) = happyShift action_9
action_20 (64) = happyShift action_10
action_20 (65) = happyShift action_11
action_20 (11) = happyGoto action_28
action_20 (12) = happyGoto action_29
action_20 (13) = happyGoto action_30
action_20 (16) = happyGoto action_31
action_20 (17) = happyGoto action_32
action_20 (18) = happyGoto action_33
action_20 _ = happyReduce_28

action_21 _ = happyReduce_6

action_22 _ = happyReduce_12

action_23 (56) = happyShift action_7
action_23 (57) = happyShift action_8
action_23 (63) = happyShift action_9
action_23 (64) = happyShift action_10
action_23 (65) = happyShift action_11
action_23 (9) = happyGoto action_27
action_23 (10) = happyGoto action_17
action_23 (17) = happyGoto action_18
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyShift action_25
action_24 (40) = happyShift action_26
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (22) = happyShift action_34
action_25 (23) = happyShift action_35
action_25 (30) = happyShift action_36
action_25 (32) = happyShift action_37
action_25 (36) = happyShift action_38
action_25 (41) = happyShift action_39
action_25 (44) = happyShift action_40
action_25 (45) = happyShift action_41
action_25 (53) = happyShift action_42
action_25 (54) = happyShift action_43
action_25 (55) = happyShift action_44
action_25 (56) = happyShift action_7
action_25 (57) = happyShift action_8
action_25 (58) = happyShift action_45
action_25 (59) = happyShift action_46
action_25 (60) = happyShift action_47
action_25 (61) = happyShift action_48
action_25 (62) = happyShift action_49
action_25 (63) = happyShift action_9
action_25 (64) = happyShift action_10
action_25 (65) = happyShift action_11
action_25 (11) = happyGoto action_28
action_25 (12) = happyGoto action_93
action_25 (13) = happyGoto action_30
action_25 (16) = happyGoto action_31
action_25 (17) = happyGoto action_32
action_25 (18) = happyGoto action_33
action_25 _ = happyReduce_28

action_26 _ = happyReduce_7

action_27 _ = happyReduce_10

action_28 (22) = happyShift action_34
action_28 (23) = happyShift action_35
action_28 (30) = happyShift action_36
action_28 (32) = happyShift action_37
action_28 (33) = happyReduce_28
action_28 (36) = happyShift action_38
action_28 (41) = happyShift action_39
action_28 (44) = happyShift action_40
action_28 (45) = happyShift action_41
action_28 (53) = happyShift action_42
action_28 (54) = happyShift action_43
action_28 (55) = happyShift action_44
action_28 (56) = happyShift action_7
action_28 (57) = happyShift action_8
action_28 (58) = happyShift action_45
action_28 (59) = happyShift action_46
action_28 (60) = happyShift action_47
action_28 (61) = happyShift action_48
action_28 (62) = happyShift action_49
action_28 (63) = happyShift action_9
action_28 (64) = happyShift action_10
action_28 (65) = happyShift action_11
action_28 (11) = happyGoto action_28
action_28 (12) = happyGoto action_92
action_28 (13) = happyGoto action_30
action_28 (16) = happyGoto action_31
action_28 (17) = happyGoto action_32
action_28 (18) = happyGoto action_33
action_28 _ = happyReduce_28

action_29 (33) = happyShift action_91
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (40) = happyShift action_90
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (28) = happyShift action_87
action_31 (29) = happyShift action_88
action_31 (34) = happyShift action_89
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (22) = happyShift action_86
action_32 (14) = happyGoto action_84
action_32 (15) = happyGoto action_85
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_70
action_33 (25) = happyShift action_71
action_33 (26) = happyShift action_72
action_33 (27) = happyShift action_73
action_33 (34) = happyShift action_74
action_33 (37) = happyShift action_75
action_33 (38) = happyShift action_76
action_33 (43) = happyShift action_77
action_33 (47) = happyShift action_78
action_33 (48) = happyShift action_79
action_33 (49) = happyShift action_80
action_33 (50) = happyShift action_81
action_33 (51) = happyShift action_82
action_33 (52) = happyShift action_83
action_33 (21) = happyGoto action_69
action_33 _ = happyReduce_35

action_34 (28) = happyReduce_39
action_34 (29) = happyReduce_39
action_34 (30) = happyShift action_66
action_34 (34) = happyShift action_67
action_34 (46) = happyShift action_68
action_34 _ = happyReduce_51

action_35 _ = happyReduce_47

action_36 (22) = happyShift action_65
action_36 (23) = happyShift action_35
action_36 (30) = happyShift action_36
action_36 (36) = happyShift action_38
action_36 (53) = happyShift action_42
action_36 (54) = happyShift action_43
action_36 (55) = happyShift action_44
action_36 (61) = happyShift action_48
action_36 (62) = happyShift action_49
action_36 (16) = happyGoto action_63
action_36 (18) = happyGoto action_64
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (22) = happyShift action_34
action_37 (23) = happyShift action_35
action_37 (30) = happyShift action_36
action_37 (32) = happyShift action_37
action_37 (36) = happyShift action_38
action_37 (41) = happyShift action_39
action_37 (44) = happyShift action_40
action_37 (45) = happyShift action_41
action_37 (53) = happyShift action_42
action_37 (54) = happyShift action_43
action_37 (55) = happyShift action_44
action_37 (56) = happyShift action_7
action_37 (57) = happyShift action_8
action_37 (58) = happyShift action_45
action_37 (59) = happyShift action_46
action_37 (60) = happyShift action_47
action_37 (61) = happyShift action_48
action_37 (62) = happyShift action_49
action_37 (63) = happyShift action_9
action_37 (64) = happyShift action_10
action_37 (65) = happyShift action_11
action_37 (11) = happyGoto action_28
action_37 (12) = happyGoto action_62
action_37 (13) = happyGoto action_30
action_37 (16) = happyGoto action_31
action_37 (17) = happyGoto action_32
action_37 (18) = happyGoto action_33
action_37 _ = happyReduce_28

action_38 (22) = happyShift action_55
action_38 (23) = happyShift action_35
action_38 (30) = happyShift action_56
action_38 (36) = happyShift action_38
action_38 (53) = happyShift action_42
action_38 (54) = happyShift action_43
action_38 (55) = happyShift action_44
action_38 (61) = happyShift action_48
action_38 (62) = happyShift action_49
action_38 (18) = happyGoto action_61
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (30) = happyShift action_60
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (30) = happyShift action_59
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (30) = happyShift action_58
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_48

action_43 _ = happyReduce_49

action_44 _ = happyReduce_50

action_45 (22) = happyShift action_55
action_45 (23) = happyShift action_35
action_45 (30) = happyShift action_56
action_45 (36) = happyShift action_38
action_45 (40) = happyShift action_57
action_45 (53) = happyShift action_42
action_45 (54) = happyShift action_43
action_45 (55) = happyShift action_44
action_45 (61) = happyShift action_48
action_45 (62) = happyShift action_49
action_45 (18) = happyGoto action_54
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (40) = happyShift action_53
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (40) = happyShift action_52
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (30) = happyShift action_51
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (30) = happyShift action_50
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_55
action_50 (23) = happyShift action_35
action_50 (30) = happyShift action_56
action_50 (36) = happyShift action_38
action_50 (53) = happyShift action_42
action_50 (54) = happyShift action_43
action_50 (55) = happyShift action_44
action_50 (61) = happyShift action_48
action_50 (62) = happyShift action_49
action_50 (18) = happyGoto action_114
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (31) = happyShift action_113
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_21

action_53 _ = happyReduce_20

action_54 (24) = happyShift action_70
action_54 (25) = happyShift action_71
action_54 (26) = happyShift action_72
action_54 (27) = happyShift action_73
action_54 (34) = happyShift action_74
action_54 (37) = happyShift action_75
action_54 (38) = happyShift action_76
action_54 (40) = happyShift action_112
action_54 (43) = happyShift action_77
action_54 (47) = happyShift action_78
action_54 (48) = happyShift action_79
action_54 (49) = happyShift action_80
action_54 (50) = happyShift action_81
action_54 (51) = happyShift action_82
action_54 (52) = happyShift action_83
action_54 (21) = happyGoto action_69
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (30) = happyShift action_66
action_55 _ = happyReduce_51

action_56 (22) = happyShift action_55
action_56 (23) = happyShift action_35
action_56 (30) = happyShift action_56
action_56 (36) = happyShift action_38
action_56 (53) = happyShift action_42
action_56 (54) = happyShift action_43
action_56 (55) = happyShift action_44
action_56 (61) = happyShift action_48
action_56 (62) = happyShift action_49
action_56 (18) = happyGoto action_64
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_24

action_58 (22) = happyShift action_34
action_58 (23) = happyShift action_35
action_58 (30) = happyShift action_36
action_58 (36) = happyShift action_38
action_58 (40) = happyShift action_111
action_58 (53) = happyShift action_42
action_58 (54) = happyShift action_43
action_58 (55) = happyShift action_44
action_58 (56) = happyShift action_7
action_58 (57) = happyShift action_8
action_58 (61) = happyShift action_48
action_58 (62) = happyShift action_49
action_58 (63) = happyShift action_9
action_58 (64) = happyShift action_10
action_58 (65) = happyShift action_11
action_58 (13) = happyGoto action_110
action_58 (16) = happyGoto action_31
action_58 (17) = happyGoto action_32
action_58 (18) = happyGoto action_33
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_55
action_59 (23) = happyShift action_35
action_59 (30) = happyShift action_56
action_59 (36) = happyShift action_38
action_59 (53) = happyShift action_42
action_59 (54) = happyShift action_43
action_59 (55) = happyShift action_44
action_59 (61) = happyShift action_48
action_59 (62) = happyShift action_49
action_59 (18) = happyGoto action_109
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (22) = happyShift action_55
action_60 (23) = happyShift action_35
action_60 (30) = happyShift action_56
action_60 (36) = happyShift action_38
action_60 (53) = happyShift action_42
action_60 (54) = happyShift action_43
action_60 (55) = happyShift action_44
action_60 (61) = happyShift action_48
action_60 (62) = happyShift action_49
action_60 (18) = happyGoto action_108
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (34) = happyShift action_74
action_61 (21) = happyGoto action_69
action_61 _ = happyReduce_52

action_62 (33) = happyShift action_107
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (31) = happyShift action_106
action_63 (34) = happyShift action_89
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (24) = happyShift action_70
action_64 (25) = happyShift action_71
action_64 (26) = happyShift action_72
action_64 (27) = happyShift action_73
action_64 (31) = happyShift action_105
action_64 (34) = happyShift action_74
action_64 (37) = happyShift action_75
action_64 (38) = happyShift action_76
action_64 (43) = happyShift action_77
action_64 (47) = happyShift action_78
action_64 (48) = happyShift action_79
action_64 (49) = happyShift action_80
action_64 (50) = happyShift action_81
action_64 (51) = happyShift action_82
action_64 (52) = happyShift action_83
action_64 (21) = happyGoto action_69
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (30) = happyShift action_66
action_65 (31) = happyReduce_51
action_65 (34) = happyReduce_51
action_65 _ = happyReduce_51

action_66 (22) = happyShift action_55
action_66 (23) = happyShift action_35
action_66 (30) = happyShift action_56
action_66 (31) = happyShift action_104
action_66 (36) = happyShift action_38
action_66 (53) = happyShift action_42
action_66 (54) = happyShift action_43
action_66 (55) = happyShift action_44
action_66 (61) = happyShift action_48
action_66 (62) = happyShift action_49
action_66 (18) = happyGoto action_102
action_66 (19) = happyGoto action_103
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (22) = happyShift action_55
action_67 (23) = happyShift action_35
action_67 (30) = happyShift action_56
action_67 (36) = happyShift action_38
action_67 (53) = happyShift action_42
action_67 (54) = happyShift action_43
action_67 (55) = happyShift action_44
action_67 (61) = happyShift action_48
action_67 (62) = happyShift action_49
action_67 (18) = happyGoto action_101
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (22) = happyShift action_55
action_68 (23) = happyShift action_35
action_68 (30) = happyShift action_56
action_68 (36) = happyShift action_38
action_68 (53) = happyShift action_42
action_68 (54) = happyShift action_43
action_68 (55) = happyShift action_44
action_68 (61) = happyShift action_48
action_68 (62) = happyShift action_49
action_68 (18) = happyGoto action_100
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_55
action_69 (23) = happyShift action_35
action_69 (30) = happyShift action_56
action_69 (36) = happyShift action_38
action_69 (53) = happyShift action_42
action_69 (54) = happyShift action_43
action_69 (55) = happyShift action_44
action_69 (61) = happyShift action_48
action_69 (62) = happyShift action_49
action_69 (18) = happyGoto action_99
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_64

action_71 _ = happyReduce_65

action_72 _ = happyReduce_67

action_73 _ = happyReduce_66

action_74 (22) = happyShift action_55
action_74 (23) = happyShift action_35
action_74 (30) = happyShift action_56
action_74 (36) = happyShift action_38
action_74 (53) = happyShift action_42
action_74 (54) = happyShift action_43
action_74 (55) = happyShift action_44
action_74 (61) = happyShift action_48
action_74 (62) = happyShift action_49
action_74 (18) = happyGoto action_98
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_70

action_76 _ = happyReduce_69

action_77 _ = happyReduce_68

action_78 _ = happyReduce_71

action_79 _ = happyReduce_72

action_80 _ = happyReduce_74

action_81 _ = happyReduce_76

action_82 _ = happyReduce_73

action_83 _ = happyReduce_75

action_84 _ = happyReduce_34

action_85 (39) = happyShift action_97
action_85 _ = happyReduce_37

action_86 (34) = happyShift action_96
action_86 _ = happyReduce_38

action_87 _ = happyReduce_29

action_88 _ = happyReduce_30

action_89 (22) = happyShift action_55
action_89 (23) = happyShift action_35
action_89 (30) = happyShift action_56
action_89 (36) = happyShift action_38
action_89 (53) = happyShift action_42
action_89 (54) = happyShift action_43
action_89 (55) = happyShift action_44
action_89 (61) = happyShift action_48
action_89 (62) = happyShift action_49
action_89 (18) = happyGoto action_95
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_25

action_91 _ = happyReduce_8

action_92 _ = happyReduce_26

action_93 (33) = happyShift action_94
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_9

action_95 (24) = happyShift action_70
action_95 (25) = happyShift action_71
action_95 (26) = happyShift action_72
action_95 (27) = happyShift action_73
action_95 (34) = happyShift action_74
action_95 (35) = happyShift action_128
action_95 (37) = happyShift action_75
action_95 (38) = happyShift action_76
action_95 (43) = happyShift action_77
action_95 (47) = happyShift action_78
action_95 (48) = happyShift action_79
action_95 (49) = happyShift action_80
action_95 (50) = happyShift action_81
action_95 (51) = happyShift action_82
action_95 (52) = happyShift action_83
action_95 (21) = happyGoto action_69
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (22) = happyShift action_55
action_96 (23) = happyShift action_35
action_96 (30) = happyShift action_56
action_96 (36) = happyShift action_38
action_96 (53) = happyShift action_42
action_96 (54) = happyShift action_43
action_96 (55) = happyShift action_44
action_96 (61) = happyShift action_48
action_96 (62) = happyShift action_49
action_96 (18) = happyGoto action_127
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (22) = happyShift action_126
action_97 (14) = happyGoto action_125
action_97 (15) = happyGoto action_85
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (24) = happyShift action_70
action_98 (25) = happyShift action_71
action_98 (26) = happyShift action_72
action_98 (27) = happyShift action_73
action_98 (34) = happyShift action_74
action_98 (35) = happyShift action_124
action_98 (37) = happyShift action_75
action_98 (38) = happyShift action_76
action_98 (43) = happyShift action_77
action_98 (47) = happyShift action_78
action_98 (48) = happyShift action_79
action_98 (49) = happyShift action_80
action_98 (50) = happyShift action_81
action_98 (51) = happyShift action_82
action_98 (52) = happyShift action_83
action_98 (21) = happyGoto action_69
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (24) = happyShift action_70
action_99 (25) = happyShift action_71
action_99 (26) = happyShift action_72
action_99 (27) = happyShift action_73
action_99 (34) = happyShift action_74
action_99 (37) = happyShift action_75
action_99 (38) = happyShift action_76
action_99 (43) = happyShift action_77
action_99 (47) = happyShift action_78
action_99 (48) = happyShift action_79
action_99 (49) = happyShift action_80
action_99 (50) = happyShift action_81
action_99 (51) = happyShift action_82
action_99 (52) = happyShift action_83
action_99 (21) = happyGoto action_69
action_99 _ = happyReduce_57

action_100 (24) = happyShift action_70
action_100 (25) = happyShift action_71
action_100 (26) = happyShift action_72
action_100 (27) = happyShift action_73
action_100 (34) = happyShift action_74
action_100 (37) = happyShift action_75
action_100 (38) = happyShift action_76
action_100 (43) = happyShift action_77
action_100 (47) = happyShift action_78
action_100 (48) = happyShift action_79
action_100 (49) = happyShift action_80
action_100 (50) = happyShift action_81
action_100 (51) = happyShift action_82
action_100 (52) = happyShift action_83
action_100 (21) = happyGoto action_69
action_100 _ = happyReduce_31

action_101 (24) = happyShift action_70
action_101 (25) = happyShift action_71
action_101 (26) = happyShift action_72
action_101 (27) = happyShift action_73
action_101 (34) = happyShift action_74
action_101 (35) = happyShift action_123
action_101 (37) = happyShift action_75
action_101 (38) = happyShift action_76
action_101 (43) = happyShift action_77
action_101 (47) = happyShift action_78
action_101 (48) = happyShift action_79
action_101 (49) = happyShift action_80
action_101 (50) = happyShift action_81
action_101 (51) = happyShift action_82
action_101 (52) = happyShift action_83
action_101 (21) = happyGoto action_69
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (24) = happyShift action_70
action_102 (25) = happyShift action_71
action_102 (26) = happyShift action_72
action_102 (27) = happyShift action_73
action_102 (34) = happyShift action_74
action_102 (37) = happyShift action_75
action_102 (38) = happyShift action_76
action_102 (39) = happyShift action_122
action_102 (43) = happyShift action_77
action_102 (47) = happyShift action_78
action_102 (48) = happyShift action_79
action_102 (49) = happyShift action_80
action_102 (50) = happyShift action_81
action_102 (51) = happyShift action_82
action_102 (52) = happyShift action_83
action_102 (20) = happyGoto action_121
action_102 (21) = happyGoto action_69
action_102 _ = happyReduce_63

action_103 (31) = happyShift action_120
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_53

action_105 _ = happyReduce_59

action_106 _ = happyReduce_41

action_107 _ = happyReduce_22

action_108 (24) = happyShift action_70
action_108 (25) = happyShift action_71
action_108 (26) = happyShift action_72
action_108 (27) = happyShift action_73
action_108 (31) = happyShift action_119
action_108 (34) = happyShift action_74
action_108 (37) = happyShift action_75
action_108 (38) = happyShift action_76
action_108 (43) = happyShift action_77
action_108 (47) = happyShift action_78
action_108 (48) = happyShift action_79
action_108 (49) = happyShift action_80
action_108 (50) = happyShift action_81
action_108 (51) = happyShift action_82
action_108 (52) = happyShift action_83
action_108 (21) = happyGoto action_69
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (24) = happyShift action_70
action_109 (25) = happyShift action_71
action_109 (26) = happyShift action_72
action_109 (27) = happyShift action_73
action_109 (31) = happyShift action_118
action_109 (34) = happyShift action_74
action_109 (37) = happyShift action_75
action_109 (38) = happyShift action_76
action_109 (43) = happyShift action_77
action_109 (47) = happyShift action_78
action_109 (48) = happyShift action_79
action_109 (49) = happyShift action_80
action_109 (50) = happyShift action_81
action_109 (51) = happyShift action_82
action_109 (52) = happyShift action_83
action_109 (21) = happyGoto action_69
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (40) = happyShift action_117
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (22) = happyShift action_55
action_111 (23) = happyShift action_35
action_111 (30) = happyShift action_56
action_111 (36) = happyShift action_38
action_111 (53) = happyShift action_42
action_111 (54) = happyShift action_43
action_111 (55) = happyShift action_44
action_111 (61) = happyShift action_48
action_111 (62) = happyShift action_49
action_111 (18) = happyGoto action_116
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_23

action_113 _ = happyReduce_55

action_114 (24) = happyShift action_70
action_114 (25) = happyShift action_71
action_114 (26) = happyShift action_72
action_114 (27) = happyShift action_73
action_114 (31) = happyShift action_115
action_114 (34) = happyShift action_74
action_114 (37) = happyShift action_75
action_114 (38) = happyShift action_76
action_114 (43) = happyShift action_77
action_114 (47) = happyShift action_78
action_114 (48) = happyShift action_79
action_114 (49) = happyShift action_80
action_114 (50) = happyShift action_81
action_114 (51) = happyShift action_82
action_114 (52) = happyShift action_83
action_114 (21) = happyGoto action_69
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_56

action_116 (24) = happyShift action_70
action_116 (25) = happyShift action_71
action_116 (26) = happyShift action_72
action_116 (27) = happyShift action_73
action_116 (34) = happyShift action_74
action_116 (37) = happyShift action_75
action_116 (38) = happyShift action_76
action_116 (40) = happyShift action_135
action_116 (43) = happyShift action_77
action_116 (47) = happyShift action_78
action_116 (48) = happyShift action_79
action_116 (49) = happyShift action_80
action_116 (50) = happyShift action_81
action_116 (51) = happyShift action_82
action_116 (52) = happyShift action_83
action_116 (21) = happyGoto action_69
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (22) = happyShift action_55
action_117 (23) = happyShift action_35
action_117 (30) = happyShift action_56
action_117 (36) = happyShift action_38
action_117 (53) = happyShift action_42
action_117 (54) = happyShift action_43
action_117 (55) = happyShift action_44
action_117 (61) = happyShift action_48
action_117 (62) = happyShift action_49
action_117 (18) = happyGoto action_134
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (22) = happyShift action_34
action_118 (23) = happyShift action_35
action_118 (30) = happyShift action_36
action_118 (32) = happyShift action_37
action_118 (36) = happyShift action_38
action_118 (41) = happyShift action_39
action_118 (44) = happyShift action_40
action_118 (45) = happyShift action_41
action_118 (53) = happyShift action_42
action_118 (54) = happyShift action_43
action_118 (55) = happyShift action_44
action_118 (56) = happyShift action_7
action_118 (57) = happyShift action_8
action_118 (58) = happyShift action_45
action_118 (59) = happyShift action_46
action_118 (60) = happyShift action_47
action_118 (61) = happyShift action_48
action_118 (62) = happyShift action_49
action_118 (63) = happyShift action_9
action_118 (64) = happyShift action_10
action_118 (65) = happyShift action_11
action_118 (11) = happyGoto action_133
action_118 (13) = happyGoto action_30
action_118 (16) = happyGoto action_31
action_118 (17) = happyGoto action_32
action_118 (18) = happyGoto action_33
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (22) = happyShift action_34
action_119 (23) = happyShift action_35
action_119 (30) = happyShift action_36
action_119 (32) = happyShift action_37
action_119 (36) = happyShift action_38
action_119 (41) = happyShift action_39
action_119 (44) = happyShift action_40
action_119 (45) = happyShift action_41
action_119 (53) = happyShift action_42
action_119 (54) = happyShift action_43
action_119 (55) = happyShift action_44
action_119 (56) = happyShift action_7
action_119 (57) = happyShift action_8
action_119 (58) = happyShift action_45
action_119 (59) = happyShift action_46
action_119 (60) = happyShift action_47
action_119 (61) = happyShift action_48
action_119 (62) = happyShift action_49
action_119 (63) = happyShift action_9
action_119 (64) = happyShift action_10
action_119 (65) = happyShift action_11
action_119 (11) = happyGoto action_132
action_119 (13) = happyGoto action_30
action_119 (16) = happyGoto action_31
action_119 (17) = happyGoto action_32
action_119 (18) = happyGoto action_33
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_54

action_121 _ = happyReduce_60

action_122 (22) = happyShift action_55
action_122 (23) = happyShift action_35
action_122 (30) = happyShift action_56
action_122 (36) = happyShift action_38
action_122 (53) = happyShift action_42
action_122 (54) = happyShift action_43
action_122 (55) = happyShift action_44
action_122 (61) = happyShift action_48
action_122 (62) = happyShift action_49
action_122 (18) = happyGoto action_131
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (46) = happyShift action_130
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_58

action_125 _ = happyReduce_36

action_126 _ = happyReduce_38

action_127 (24) = happyShift action_70
action_127 (25) = happyShift action_71
action_127 (26) = happyShift action_72
action_127 (27) = happyShift action_73
action_127 (34) = happyShift action_74
action_127 (35) = happyShift action_129
action_127 (37) = happyShift action_75
action_127 (38) = happyShift action_76
action_127 (43) = happyShift action_77
action_127 (47) = happyShift action_78
action_127 (48) = happyShift action_79
action_127 (49) = happyShift action_80
action_127 (50) = happyShift action_81
action_127 (51) = happyShift action_82
action_127 (52) = happyShift action_83
action_127 (21) = happyGoto action_69
action_127 _ = happyFail (happyExpListPerState 127)

action_128 _ = happyReduce_40

action_129 _ = happyReduce_33

action_130 (22) = happyShift action_55
action_130 (23) = happyShift action_35
action_130 (30) = happyShift action_56
action_130 (36) = happyShift action_38
action_130 (53) = happyShift action_42
action_130 (54) = happyShift action_43
action_130 (55) = happyShift action_44
action_130 (61) = happyShift action_48
action_130 (62) = happyShift action_49
action_130 (18) = happyGoto action_141
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (24) = happyShift action_70
action_131 (25) = happyShift action_71
action_131 (26) = happyShift action_72
action_131 (27) = happyShift action_73
action_131 (34) = happyShift action_74
action_131 (37) = happyShift action_75
action_131 (38) = happyShift action_76
action_131 (39) = happyShift action_122
action_131 (43) = happyShift action_77
action_131 (47) = happyShift action_78
action_131 (48) = happyShift action_79
action_131 (49) = happyShift action_80
action_131 (50) = happyShift action_81
action_131 (51) = happyShift action_82
action_131 (52) = happyShift action_83
action_131 (20) = happyGoto action_140
action_131 (21) = happyGoto action_69
action_131 _ = happyReduce_63

action_132 (42) = happyShift action_139
action_132 _ = happyReduce_14

action_133 _ = happyReduce_15

action_134 (24) = happyShift action_70
action_134 (25) = happyShift action_71
action_134 (26) = happyShift action_72
action_134 (27) = happyShift action_73
action_134 (34) = happyShift action_74
action_134 (37) = happyShift action_75
action_134 (38) = happyShift action_76
action_134 (40) = happyShift action_138
action_134 (43) = happyShift action_77
action_134 (47) = happyShift action_78
action_134 (48) = happyShift action_79
action_134 (49) = happyShift action_80
action_134 (50) = happyShift action_81
action_134 (51) = happyShift action_82
action_134 (52) = happyShift action_83
action_134 (21) = happyGoto action_69
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (22) = happyShift action_34
action_135 (23) = happyShift action_35
action_135 (30) = happyShift action_36
action_135 (31) = happyShift action_137
action_135 (36) = happyShift action_38
action_135 (53) = happyShift action_42
action_135 (54) = happyShift action_43
action_135 (55) = happyShift action_44
action_135 (56) = happyShift action_7
action_135 (57) = happyShift action_8
action_135 (61) = happyShift action_48
action_135 (62) = happyShift action_49
action_135 (63) = happyShift action_9
action_135 (64) = happyShift action_10
action_135 (65) = happyShift action_11
action_135 (13) = happyGoto action_136
action_135 (16) = happyGoto action_31
action_135 (17) = happyGoto action_32
action_135 (18) = happyGoto action_33
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (31) = happyShift action_146
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (22) = happyShift action_34
action_137 (23) = happyShift action_35
action_137 (30) = happyShift action_36
action_137 (32) = happyShift action_37
action_137 (36) = happyShift action_38
action_137 (41) = happyShift action_39
action_137 (44) = happyShift action_40
action_137 (45) = happyShift action_41
action_137 (53) = happyShift action_42
action_137 (54) = happyShift action_43
action_137 (55) = happyShift action_44
action_137 (56) = happyShift action_7
action_137 (57) = happyShift action_8
action_137 (58) = happyShift action_45
action_137 (59) = happyShift action_46
action_137 (60) = happyShift action_47
action_137 (61) = happyShift action_48
action_137 (62) = happyShift action_49
action_137 (63) = happyShift action_9
action_137 (64) = happyShift action_10
action_137 (65) = happyShift action_11
action_137 (11) = happyGoto action_145
action_137 (13) = happyGoto action_30
action_137 (16) = happyGoto action_31
action_137 (17) = happyGoto action_32
action_137 (18) = happyGoto action_33
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (22) = happyShift action_34
action_138 (23) = happyShift action_35
action_138 (30) = happyShift action_36
action_138 (31) = happyShift action_144
action_138 (36) = happyShift action_38
action_138 (53) = happyShift action_42
action_138 (54) = happyShift action_43
action_138 (55) = happyShift action_44
action_138 (56) = happyShift action_7
action_138 (57) = happyShift action_8
action_138 (61) = happyShift action_48
action_138 (62) = happyShift action_49
action_138 (63) = happyShift action_9
action_138 (64) = happyShift action_10
action_138 (65) = happyShift action_11
action_138 (13) = happyGoto action_143
action_138 (16) = happyGoto action_31
action_138 (17) = happyGoto action_32
action_138 (18) = happyGoto action_33
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (22) = happyShift action_34
action_139 (23) = happyShift action_35
action_139 (30) = happyShift action_36
action_139 (32) = happyShift action_37
action_139 (36) = happyShift action_38
action_139 (41) = happyShift action_39
action_139 (44) = happyShift action_40
action_139 (45) = happyShift action_41
action_139 (53) = happyShift action_42
action_139 (54) = happyShift action_43
action_139 (55) = happyShift action_44
action_139 (56) = happyShift action_7
action_139 (57) = happyShift action_8
action_139 (58) = happyShift action_45
action_139 (59) = happyShift action_46
action_139 (60) = happyShift action_47
action_139 (61) = happyShift action_48
action_139 (62) = happyShift action_49
action_139 (63) = happyShift action_9
action_139 (64) = happyShift action_10
action_139 (65) = happyShift action_11
action_139 (11) = happyGoto action_142
action_139 (13) = happyGoto action_30
action_139 (16) = happyGoto action_31
action_139 (17) = happyGoto action_32
action_139 (18) = happyGoto action_33
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_62

action_141 (24) = happyShift action_70
action_141 (25) = happyShift action_71
action_141 (26) = happyShift action_72
action_141 (27) = happyShift action_73
action_141 (34) = happyShift action_74
action_141 (37) = happyShift action_75
action_141 (38) = happyShift action_76
action_141 (43) = happyShift action_77
action_141 (47) = happyShift action_78
action_141 (48) = happyShift action_79
action_141 (49) = happyShift action_80
action_141 (50) = happyShift action_81
action_141 (51) = happyShift action_82
action_141 (52) = happyShift action_83
action_141 (21) = happyGoto action_69
action_141 _ = happyReduce_32

action_142 _ = happyReduce_13

action_143 (31) = happyShift action_149
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (22) = happyShift action_34
action_144 (23) = happyShift action_35
action_144 (30) = happyShift action_36
action_144 (32) = happyShift action_37
action_144 (36) = happyShift action_38
action_144 (41) = happyShift action_39
action_144 (44) = happyShift action_40
action_144 (45) = happyShift action_41
action_144 (53) = happyShift action_42
action_144 (54) = happyShift action_43
action_144 (55) = happyShift action_44
action_144 (56) = happyShift action_7
action_144 (57) = happyShift action_8
action_144 (58) = happyShift action_45
action_144 (59) = happyShift action_46
action_144 (60) = happyShift action_47
action_144 (61) = happyShift action_48
action_144 (62) = happyShift action_49
action_144 (63) = happyShift action_9
action_144 (64) = happyShift action_10
action_144 (65) = happyShift action_11
action_144 (11) = happyGoto action_148
action_144 (13) = happyGoto action_30
action_144 (16) = happyGoto action_31
action_144 (17) = happyGoto action_32
action_144 (18) = happyGoto action_33
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_16

action_146 (22) = happyShift action_34
action_146 (23) = happyShift action_35
action_146 (30) = happyShift action_36
action_146 (32) = happyShift action_37
action_146 (36) = happyShift action_38
action_146 (41) = happyShift action_39
action_146 (44) = happyShift action_40
action_146 (45) = happyShift action_41
action_146 (53) = happyShift action_42
action_146 (54) = happyShift action_43
action_146 (55) = happyShift action_44
action_146 (56) = happyShift action_7
action_146 (57) = happyShift action_8
action_146 (58) = happyShift action_45
action_146 (59) = happyShift action_46
action_146 (60) = happyShift action_47
action_146 (61) = happyShift action_48
action_146 (62) = happyShift action_49
action_146 (63) = happyShift action_9
action_146 (64) = happyShift action_10
action_146 (65) = happyShift action_11
action_146 (11) = happyGoto action_147
action_146 (13) = happyGoto action_30
action_146 (16) = happyGoto action_31
action_146 (17) = happyGoto action_32
action_146 (18) = happyGoto action_33
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_18

action_148 _ = happyReduce_17

action_149 (22) = happyShift action_34
action_149 (23) = happyShift action_35
action_149 (30) = happyShift action_36
action_149 (32) = happyShift action_37
action_149 (36) = happyShift action_38
action_149 (41) = happyShift action_39
action_149 (44) = happyShift action_40
action_149 (45) = happyShift action_41
action_149 (53) = happyShift action_42
action_149 (54) = happyShift action_43
action_149 (55) = happyShift action_44
action_149 (56) = happyShift action_7
action_149 (57) = happyShift action_8
action_149 (58) = happyShift action_45
action_149 (59) = happyShift action_46
action_149 (60) = happyShift action_47
action_149 (61) = happyShift action_48
action_149 (62) = happyShift action_49
action_149 (63) = happyShift action_9
action_149 (64) = happyShift action_10
action_149 (65) = happyShift action_11
action_149 (11) = happyGoto action_150
action_149 (13) = happyGoto action_30
action_149 (16) = happyGoto action_31
action_149 (17) = happyGoto action_32
action_149 (18) = happyGoto action_33
action_149 _ = happyFail (happyExpListPerState 149)

action_150 _ = happyReduce_19

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_0  5 happyReduction_3
happyReduction_3  =  HappyAbsSyn5
		 ([]
	)

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (DeclareFunc happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (DefineFunc happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happyReduce 5 7 happyReduction_6
happyReduction_6 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (CallFuncNoParam happy_var_1 happy_var_2
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 6 7 happyReduction_7
happyReduction_7 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (CallFunc happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (FuncNoParam happy_var_1 happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 8 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Func happy_var_1 happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  10 happyReduction_12
happyReduction_12 (HappyTerminal (ID happy_var_2))
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn10
		 (Param happy_var_1 happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 7 11 happyReduction_13
happyReduction_13 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Ifelse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 11 happyReduction_14
happyReduction_14 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 11 happyReduction_15
happyReduction_15 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 7 11 happyReduction_16
happyReduction_16 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ForA happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 8 11 happyReduction_17
happyReduction_17 ((HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ForB happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 8 11 happyReduction_18
happyReduction_18 ((HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ForC happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 9 11 happyReduction_19
happyReduction_19 ((HappyAbsSyn11  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ForD happy_var_3 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_2  11 happyReduction_20
happyReduction_20 _
	_
	 =  HappyAbsSyn11
		 (Break
	)

happyReduce_21 = happySpecReduce_2  11 happyReduction_21
happyReduction_21 _
	_
	 =  HappyAbsSyn11
		 (Continue
	)

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Block happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Return happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  11 happyReduction_24
happyReduction_24 _
	_
	 =  HappyAbsSyn11
		 (ReturnNull
	)

happyReduce_25 = happySpecReduce_2  11 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn11
		 (SimpleStmt happy_var_1
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  12 happyReduction_26
happyReduction_26 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  12 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_0  12 happyReduction_28
happyReduction_28  =  HappyAbsSyn12
		 ([]
	)

happyReduce_29 = happySpecReduce_2  13 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 (Incr happy_var_1
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  13 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 (Decr happy_var_1
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 6 13 happyReduction_32
happyReduction_32 ((HappyAbsSyn18  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (AssignArrayItem happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 5 13 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (DeclareArray happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_2  13 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn13
		 (DeclareIds happy_var_1 happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn13
		 (ExpSimple happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn15
		 (VarId happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  16 happyReduction_39
happyReduction_39 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn16
		 (VarLv happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happyReduce 4 16 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Array happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_3  16 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn17
		 (Int
	)

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn17
		 (Bool
	)

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn17
		 (String
	)

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn17
		 (Char
	)

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn17
		 (Void
	)

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn18
		 (Num happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  18 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn18
		 (TrueConst
	)

happyReduce_49 = happySpecReduce_1  18 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn18
		 (FalseConst
	)

happyReduce_50 = happySpecReduce_1  18 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn18
		 (Null
	)

happyReduce_51 = happySpecReduce_1  18 happyReduction_51
happyReduction_51 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (VarExp happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  18 happyReduction_52
happyReduction_52 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Not happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  18 happyReduction_53
happyReduction_53 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (IdNoParam happy_var_1
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happyReduce 4 18 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (IdWithParams happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  18 happyReduction_55
happyReduction_55 _
	_
	_
	 =  HappyAbsSyn18
		 (ScanInt
	)

happyReduce_56 = happyReduce 4 18 happyReduction_56
happyReduction_56 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (PrintInt happy_var_3
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  18 happyReduction_57
happyReduction_57 (HappyAbsSyn18  happy_var_3)
	(HappyAbsSyn21  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (BinOpExp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happyReduce 4 18 happyReduction_58
happyReduction_58 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (ArrayExp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_59 = happySpecReduce_3  18 happyReduction_59
happyReduction_59 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  19 happyReduction_60
happyReduction_60 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 : happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_0  19 happyReduction_61
happyReduction_61  =  HappyAbsSyn19
		 ([]
	)

happyReduce_62 = happySpecReduce_3  20 happyReduction_62
happyReduction_62 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2 : happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_0  20 happyReduction_63
happyReduction_63  =  HappyAbsSyn20
		 ([]
	)

happyReduce_64 = happySpecReduce_1  21 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn21
		 (Add
	)

happyReduce_65 = happySpecReduce_1  21 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn21
		 (Minus
	)

happyReduce_66 = happySpecReduce_1  21 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn21
		 (Mult
	)

happyReduce_67 = happySpecReduce_1  21 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn21
		 (Div
	)

happyReduce_68 = happySpecReduce_1  21 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn21
		 (Mod
	)

happyReduce_69 = happySpecReduce_1  21 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn21
		 (Or
	)

happyReduce_70 = happySpecReduce_1  21 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn21
		 (And
	)

happyReduce_71 = happySpecReduce_1  21 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn21
		 (EqualsThan
	)

happyReduce_72 = happySpecReduce_1  21 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn21
		 (DiffThan
	)

happyReduce_73 = happySpecReduce_1  21 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn21
		 (GreaterEqualsThan
	)

happyReduce_74 = happySpecReduce_1  21 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn21
		 (GreaterThan
	)

happyReduce_75 = happySpecReduce_1  21 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn21
		 (LowerEqualsThan
	)

happyReduce_76 = happySpecReduce_1  21 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn21
		 (LowerThan
	)

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ID happy_dollar_dollar -> cont 22;
	NUM happy_dollar_dollar -> cont 23;
	PLUS -> cont 24;
	MINUS -> cont 25;
	DIV -> cont 26;
	MULT -> cont 27;
	INCR -> cont 28;
	DECR -> cont 29;
	LPAREN -> cont 30;
	RPAREN -> cont 31;
	LBRACE -> cont 32;
	RBRACE -> cont 33;
	LBRACK -> cont 34;
	RBRACK -> cont 35;
	NOT -> cont 36;
	AND -> cont 37;
	OR -> cont 38;
	COMMA -> cont 39;
	SEMICOLON -> cont 40;
	IF -> cont 41;
	ELSE -> cont 42;
	MODULE -> cont 43;
	WHILE -> cont 44;
	FOR -> cont 45;
	EQUAL -> cont 46;
	EQUALS -> cont 47;
	NOTEQUALS -> cont 48;
	GTHAN -> cont 49;
	LTHAN -> cont 50;
	GETHAN -> cont 51;
	LETHAN -> cont 52;
	TRUE -> cont 53;
	FALSE -> cont 54;
	NULL -> cont 55;
	INT -> cont 56;
	BOOL -> cont 57;
	RETURN -> cont 58;
	BREAK -> cont 59;
	CONTINUE -> cont 60;
	SCANINT -> cont 61;
	PRINTINT -> cont 62;
	STRING -> cont 63;
	CHAR -> cont 64;
	VOID -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data Prog = Program [Function]
    deriving Show

data Function = DeclareFunc Gdecl
    | DefineFunc Gdefn
    deriving Show

data Gdecl = CallFuncNoParam Tp String
    | CallFunc Tp String [ParamDecl]
    deriving Show

data Gdefn = FuncNoParam Tp String [Stmt]
    | Func Tp String [ParamDecl] [Stmt]
    deriving Show

data ParamDecl = Param Tp String
    deriving Show

data Stmt = Ifelse Exp Stmt Stmt 
    | If Exp Stmt
    | While Exp Stmt 
    | ForA  Exp  Stmt 
    | ForB Stmt  Exp  Stmt 
    | ForC  Exp  Stmt Stmt 
    | ForD Stmt  Exp  Stmt Stmt 
    | Break
    | Continue
    | Block [Stmt]
    | Return Exp 
    | ReturnNull
    | SimpleStmt Stmt
    | Incr Lv 
    | Decr Lv
    | Assign String Exp
    | AssignArrayItem String Exp Exp
    | DeclareArray Tp String Exp
    | DeclareIds Tp [Element]
    | ExpSimple Exp 
    deriving Show

data Element = VarId String
    deriving Show

data Lv = VarLv String
    | Array Lv Exp
    deriving Show

data Tp = Int 
    | Bool 
    | String 
    | Char 
    | Void
    deriving Show

data Exp = Num Int
    | TrueConst 
    | FalseConst 
    | Null 
    | VarExp String 
    | Not Exp 
    | IdNoParam String
    | IdWithParams String [Exp]
    | ScanInt
    | PrintInt Exp
    | BinOpExp Exp BinOp Exp
    | ArrayExp Exp Exp
    deriving Show

data BinOp = Add 
    | Minus 
    | Mult 
    | Div 
    | Mod 
    | Or 
    | And 
    | EqualsThan 
    | DiffThan 
    | GreaterEqualsThan 
    | GreaterThan 
    | LowerEqualsThan 
    | LowerThan
    deriving Show




parseError :: [Token] -> a
parseError toks = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
